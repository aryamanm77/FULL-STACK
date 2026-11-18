/**
 * @license
 * SPDX-License-Identifier: Apache-2.0
 */

import {
  SecurityAuditLogEntry,
  SecurityLockState,
  SecurityViolationInfo,
  SecurityViolationType,
} from '../types/security';
import { apiClient, ApiClientError } from '../api/client';

export const INVIGILATOR_SECRET_PASSWORD = 'MIT@CBT2026';
export const OVERRIDE_SECRET_PASSWORD = 'MITPRO@2587';
export const MAX_INVIGILATOR_ATTEMPTS = Number.MAX_SAFE_INTEGER;

const SECURITY_LOCK_STATE_KEY = 'mitm_cbt_security_lock_state_v1';
const SECURITY_AUDIT_LOGS_KEY = 'mitm_cbt_security_audit_logs_v1';
const POST_SUBMISSION_RELOGIN_LOCK_KEY = 'mitm_cbt_post_submit_relogin_lock_v1';

export interface PostSubmissionReloginLock {
  isLocked: boolean;
  usn: string;
  studentName: string;
  message: string;
  lockedAt: string;
}

const INITIAL_LOCK_STATE: SecurityLockState = {
  isLocked: false,
  violation: null,
  violationCount: 0,
  lockedAtMs: null,
  failedAttempts: 0,
  maxAttempts: MAX_INVIGILATOR_ATTEMPTS,
  isPermanentlyLocked: false,
  resumptionCount: 0,
  lastResumedAt: null,
  savedQuestionIndex: 0,
  savedRemainingSeconds: 2700,
  savedAnswerCount: 0,
};

export const securityService = {
  getLockState(): SecurityLockState {
    try {
      const raw = localStorage.getItem(SECURITY_LOCK_STATE_KEY);
      if (!raw) return { ...INITIAL_LOCK_STATE };
      const parsed = JSON.parse(raw) as Partial<SecurityLockState>;
      return {
        ...INITIAL_LOCK_STATE,
        ...parsed,
        violationCount: Number.isFinite(parsed.violationCount) ? Number(parsed.violationCount) : 0,
        failedAttempts: Number.isFinite(parsed.failedAttempts) ? Number(parsed.failedAttempts) : 0,
        maxAttempts: MAX_INVIGILATOR_ATTEMPTS,
        // Never permanently lock out the invigilator password input regardless of violation/attempt count
        isPermanentlyLocked: false,
      };
    } catch {
      return { ...INITIAL_LOCK_STATE };
    }
  },

  clearLockState(): void {
    try {
      localStorage.setItem(SECURITY_LOCK_STATE_KEY, JSON.stringify({ ...INITIAL_LOCK_STATE }));
    } catch {
      // Ignore quota issues
    }
  },

  saveLockState(state: SecurityLockState): void {
    try {
      localStorage.setItem(SECURITY_LOCK_STATE_KEY, JSON.stringify(state));
    } catch {
      // Ignore quota issues
    }
  },

  triggerLockdown(params: {
    violationType: SecurityViolationType;
    label: string;
    description: string;
    studentUsn: string;
    studentName: string;
    examinationId: string;
    currentQuestionIndex: number;
    remainingSeconds: number;
    answeredCount: number;
  }): SecurityLockState {
    const current = this.getLockState();

    if (current.isLocked) {
      return current;
    }

    const now = new Date();
    const nowMs = now.getTime();
    const formattedTime = now.toLocaleString('en-IN', {
      day: '2-digit',
      month: 'short',
      year: 'numeric',
      hour: '2-digit',
      minute: '2-digit',
      second: '2-digit',
      hour12: true,
    });

    const violation: SecurityViolationInfo = {
      type: params.violationType,
      label: params.label,
      description: params.description,
      detectedAt: formattedTime,
      detectedAtMs: nowMs,
    };

    const newViolationCount = current.violationCount + 1;

    const updatedState: SecurityLockState = {
      ...current,
      isLocked: true,
      violation,
      violationCount: newViolationCount,
      lockedAtMs: nowMs,
      isPermanentlyLocked: false,
      savedQuestionIndex: params.currentQuestionIndex,
      savedRemainingSeconds: params.remainingSeconds,
      savedAnswerCount: params.answeredCount,
    };

    this.saveLockState(updatedState);

    // Record Event 1: Malpractice / Violation Detected
    this.addAuditLog({
      studentUsn: params.studentUsn,
      studentName: params.studentName,
      examinationId: params.examinationId,
      event: `${params.label} detected`,
      violationType: params.violationType,
      status: 'Locked',
      details: `${params.description} (Incident #${newViolationCount}). Interface locked immediately.`,
      questionNumberAtEvent: params.currentQuestionIndex + 1,
      remainingSecondsAtEvent: params.remainingSeconds,
    });

    // Notify backend server asynchronously
    apiClient
      .post('/api/security/violation', {
        violationType: params.violationType,
        label: params.label,
        description: params.description,
        studentUsn: params.studentUsn,
        examinationId: params.examinationId,
        currentQuestionIndex: params.currentQuestionIndex,
        remainingSeconds: params.remainingSeconds,
        answeredCount: params.answeredCount,
      })
      .catch(() => {
        // Safe offline fallback
      });

    return updatedState;
  },

  async verifyInvigilatorPassword(params: {
    enteredPassword: string;
    studentUsn: string;
    studentName: string;
    examinationId: string;
  }): Promise<{ success: boolean; message: string; state: SecurityLockState }> {
    const current = this.getLockState();

    if (!current.isLocked) {
      return {
        success: true,
        message: 'Examination is already unlocked.',
        state: current,
      };
    }

    const trimmedPassword = params.enteredPassword.trim();
    if (!trimmedPassword) {
      throw new Error('Please enter the invigilator authorization password.');
    }

    const now = new Date();
    const formattedTime = now.toLocaleString('en-IN', {
      day: '2-digit',
      month: 'short',
      year: 'numeric',
      hour: '2-digit',
      minute: '2-digit',
      second: '2-digit',
      hour12: true,
    });

    // Attempt authoritative backend verification first
    try {
      const serverResponse = await apiClient.post<{
        success: boolean;
        message: string;
        state?: Partial<SecurityLockState>;
      }>('/api/security/unlock', {
        enteredPassword: trimmedPassword,
        studentUsn: params.studentUsn,
        examinationId: params.examinationId,
      });

      if (serverResponse.success) {
        const mergedState: SecurityLockState = {
          ...current,
          ...(serverResponse.state || {}),
          isLocked: false,
          violation: null,
          violationCount: Math.max(
            current.violationCount,
            Number(serverResponse.state?.violationCount || 0)
          ),
          failedAttempts: 0,
          isPermanentlyLocked: false,
          resumptionCount: current.resumptionCount + 1,
          lastResumedAt: formattedTime,
        };
        this.saveLockState(mergedState);

        this.addAuditLog({
          studentUsn: params.studentUsn,
          studentName: params.studentName,
          examinationId: params.examinationId,
          event: 'Invigilator password entered',
          status: 'Successful',
          details: `Valid invigilator authorization password entered by proctor. Session unlocked (Total violations: ${mergedState.violationCount}).`,
          attemptNumber: current.failedAttempts + 1,
          questionNumberAtEvent: current.savedQuestionIndex + 1,
          remainingSecondsAtEvent: current.savedRemainingSeconds,
        });

        return {
          success: true,
          message:
            serverResponse.message ||
            'Invigilator verification successful. Your examination session has been restored.',
          state: mergedState,
        };
      }
    } catch (err) {
      if (err instanceof ApiClientError && err.code === 'EXAM_ALREADY_SUBMITTED') {
        throw err;
      }
      // Backend rejected password or is unreachable; proceed to local offline verification fallback
    }

    // Local fallback verification (supports unlimited invigilator overrides)
    const isMatch =
      trimmedPassword === INVIGILATOR_SECRET_PASSWORD ||
      trimmedPassword === OVERRIDE_SECRET_PASSWORD;

    if (isMatch) {
      const updatedState: SecurityLockState = {
        ...current,
        isLocked: false,
        violation: null,
        failedAttempts: 0,
        isPermanentlyLocked: false,
        resumptionCount: current.resumptionCount + 1,
        lastResumedAt: formattedTime,
      };

      this.saveLockState(updatedState);

      this.addAuditLog({
        studentUsn: params.studentUsn,
        studentName: params.studentName,
        examinationId: params.examinationId,
        event: 'Invigilator password entered',
        status: 'Successful',
        details: `Valid invigilator authorization password entered by proctor. Session unlocked (Total violations: ${updatedState.violationCount}).`,
        attemptNumber: current.failedAttempts + 1,
        questionNumberAtEvent: current.savedQuestionIndex + 1,
        remainingSecondsAtEvent: current.savedRemainingSeconds,
      });

      return {
        success: true,
        message: 'Invigilator verification successful. Your examination session has been restored.',
        state: updatedState,
      };
    } else {
      const newFailed = current.failedAttempts + 1;

      const updatedState: SecurityLockState = {
        ...current,
        failedAttempts: newFailed,
        // Never permanently lock out the invigilator password input
        isPermanentlyLocked: false,
      };

      this.saveLockState(updatedState);

      this.addAuditLog({
        studentUsn: params.studentUsn,
        studentName: params.studentName,
        examinationId: params.examinationId,
        event: 'Invigilator password attempt failed',
        status: 'Failed',
        details: `Invalid password entered (Attempt #${newFailed}). Invigilator override remains available.`,
        attemptNumber: newFailed,
        questionNumberAtEvent: current.savedQuestionIndex + 1,
        remainingSecondsAtEvent: current.savedRemainingSeconds,
      });

      return {
        success: false,
        message: 'Invalid invigilator password. Please verify the invigilator secret and try again.',
        state: updatedState,
      };
    }
  },

  addAuditLog(entry: {
    studentUsn: string;
    studentName: string;
    examinationId: string;
    event: string;
    status: 'Locked' | 'Successful' | 'Failed' | 'Restored' | 'Permanent Lock';
    details: string;
    violationType?: SecurityViolationType;
    attemptNumber?: number;
    questionNumberAtEvent?: number;
    remainingSecondsAtEvent?: number;
  }): SecurityAuditLogEntry {
    const logs = this.getAuditLogs();
    const now = new Date();
    const formattedTime = now.toLocaleString('en-IN', {
      day: '2-digit',
      month: 'short',
      year: 'numeric',
      hour: '2-digit',
      minute: '2-digit',
      second: '2-digit',
      hour12: true,
    });

    const newLog: SecurityAuditLogEntry = {
      id: `SEC-LOG-${Date.now().toString(36).toUpperCase()}-${Math.floor(Math.random() * 1000)}`,
      timestamp: formattedTime,
      timestampMs: now.getTime(),
      studentUsn: entry.studentUsn,
      studentName: entry.studentName,
      examinationId: entry.examinationId,
      event: entry.event,
      violationType: entry.violationType,
      status: entry.status,
      details: entry.details,
      attemptNumber: entry.attemptNumber,
      questionNumberAtEvent: entry.questionNumberAtEvent,
      remainingSecondsAtEvent: entry.remainingSecondsAtEvent,
    };

    logs.unshift(newLog);

    try {
      localStorage.setItem(SECURITY_AUDIT_LOGS_KEY, JSON.stringify(logs.slice(0, 100)));
    } catch {
      // Ignore
    }

    return newLog;
  },

  getAuditLogs(): SecurityAuditLogEntry[] {
    try {
      const raw = localStorage.getItem(SECURITY_AUDIT_LOGS_KEY);
      if (!raw) return [];
      return JSON.parse(raw) as SecurityAuditLogEntry[];
    } catch {
      return [];
    }
  },

  async fetchRemoteAuditLogs(): Promise<SecurityAuditLogEntry[]> {
    try {
      return await apiClient.get<SecurityAuditLogEntry[]>('/api/security/audit-logs');
    } catch {
      return this.getAuditLogs();
    }
  },

  getPostSubmissionReloginLock(): PostSubmissionReloginLock | null {
    try {
      const raw = localStorage.getItem(POST_SUBMISSION_RELOGIN_LOCK_KEY);
      if (!raw) return null;
      const parsed = JSON.parse(raw) as Partial<PostSubmissionReloginLock>;
      if (!parsed.isLocked) return null;
      return {
        isLocked: true,
        usn: parsed.usn || 'UNKNOWN',
        studentName: parsed.studentName || parsed.usn || 'Candidate',
        message:
          parsed.message ||
          'You have already submitted this examination and cannot retake or re-enter. Invigilator authorization is required to unlock this terminal.',
        lockedAt: parsed.lockedAt || new Date().toLocaleString('en-IN'),
      };
    } catch {
      return null;
    }
  },

  triggerPostSubmissionReloginLock(params: {
    usn: string;
    studentName?: string;
    message?: string;
  }): PostSubmissionReloginLock {
    const now = new Date();
    const formattedTime = now.toLocaleString('en-IN', {
      day: '2-digit',
      month: 'short',
      year: 'numeric',
      hour: '2-digit',
      minute: '2-digit',
      second: '2-digit',
      hour12: true,
    });

    const lock: PostSubmissionReloginLock = {
      isLocked: true,
      usn: params.usn.toUpperCase(),
      studentName: params.studentName || params.usn.toUpperCase(),
      message:
        params.message ||
        'You have already submitted this examination and cannot retake or re-enter. Invigilator authorization is required to unlock this terminal.',
      lockedAt: formattedTime,
    };

    try {
      localStorage.setItem(POST_SUBMISSION_RELOGIN_LOCK_KEY, JSON.stringify(lock));
    } catch {
      // Ignore storage quota issues
    }

    this.addAuditLog({
      studentUsn: lock.usn,
      studentName: lock.studentName,
      examinationId: 'POST_SUBMISSION_RELOGIN',
      event: 'Post-submission re-login attempt blocked',
      status: 'Locked',
      details: `Candidate ${lock.usn} attempted to re-login after submitting the examination. Terminal locked pending invigilator reset.`,
    });

    return lock;
  },

  clearPostSubmissionReloginLock(): void {
    try {
      localStorage.removeItem(POST_SUBMISSION_RELOGIN_LOCK_KEY);
    } catch {
      // Ignore storage errors
    }
  },

  async verifyTerminalResetPassword(params: {
    enteredPassword: string;
    studentUsn: string;
    studentName: string;
  }): Promise<{ success: boolean; message: string }> {
    const trimmedPassword = params.enteredPassword.trim();
    if (!trimmedPassword) {
      return {
        success: false,
        message: 'Please enter the invigilator authorization password.',
      };
    }

    try {
      const serverResponse = await apiClient.post<{
        success: boolean;
        unlocked?: boolean;
        message?: string;
      }>('/api/security/unlock', {
        enteredPassword: trimmedPassword,
        studentUsn: params.studentUsn,
        unlockPurpose: 'POST_SUBMISSION_TERMINAL_RESET',
      });

      if (serverResponse.success) {
        this.clearPostSubmissionReloginLock();
        this.clearLockState();
        this.addAuditLog({
          studentUsn: params.studentUsn,
          studentName: params.studentName,
          examinationId: 'POST_SUBMISSION_RELOGIN',
          event: 'Invigilator unlocked post-submission terminal lockdown',
          status: 'Successful',
          details: `Terminal reset to clean Student Login screen for ${params.studentUsn}. Examination remains permanently submitted.`,
        });
        return {
          success: true,
          message:
            serverResponse.message ||
            'Invigilator verification successful. Terminal unlocked and returned to Student Login.',
        };
      }
    } catch (err) {
      if (err instanceof ApiClientError && err.code === 'INVALID_UNLOCK_PASSWORD') {
        return {
          success: false,
          message:
            err.message ||
            'Invalid invigilator unlock password. Please verify and try again.',
        };
      }
      // Safe offline fallback if backend is unreachable
    }

    const isMatch =
      trimmedPassword === OVERRIDE_SECRET_PASSWORD ||
      trimmedPassword === INVIGILATOR_SECRET_PASSWORD;

    if (isMatch) {
      this.clearPostSubmissionReloginLock();
      this.clearLockState();
      return {
        success: true,
        message: 'Invigilator verification successful. Terminal unlocked and returned to Student Login.',
      };
    }

    return {
      success: false,
      message: 'Invalid invigilator unlock password. Please verify and try again.',
    };
  },
};
