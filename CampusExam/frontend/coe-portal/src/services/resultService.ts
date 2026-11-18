import {
  AnswerKeyCorrectionRequest,
  ExaminationResultRecord,
  FileVerificationReport,
  ResultImportAcknowledgement,
  SittingName,
} from '../types/examination';
import { apiClient } from './apiClient';

export const resultService = {
  async getExaminationResults(): Promise<ExaminationResultRecord[]> {
    const res = await apiClient.centralRequest<ExaminationResultRecord[]>(
      '/results/examinations',
      { method: 'GET' }
    );
    return res.data;
  },

  async getAnswerKeyCorrectionRequests(): Promise<AnswerKeyCorrectionRequest[]> {
    const res = await apiClient.centralRequest<AnswerKeyCorrectionRequest[]>(
      '/results/answer-key-corrections',
      { method: 'GET' }
    );
    return res.data;
  },

  /**
   * Sends the uploaded `.labresult` package to the Central Java Backend for signature,
   * archive integrity, session ID, and frozen eligible USN roster verification.
   */
  async verifyUploadedResultFile(
    examinationId: string,
    sittingName: SittingName,
    file: File
  ): Promise<FileVerificationReport> {
    if (!examinationId) {
      throw new Error('Select an examination before verifying a result package.');
    }
    if (!file) {
      throw new Error('Select a .labresult package file to verify.');
    }

    const formData = new FormData();
    formData.append('file', file, file.name);
    formData.append('examinationId', examinationId);
    formData.append('sittingName', sittingName);

    const res = await apiClient.centralUploadRequest<FileVerificationReport>(
      '/results/verify-upload',
      formData
    );

    return res.data;
  },

  /**
   * Sends the verified `.labresult` package to the Central Java Backend to persist
   * sitting evaluation records into PostgreSQL.
   */
  async importVerifiedResults(
    report: FileVerificationReport,
    file: File
  ): Promise<ResultImportAcknowledgement> {
    if (!report.isValidForImport) {
      throw new Error(
        'Cannot import unverified or invalid result file. Resolve all validation errors first.'
      );
    }
    if (report.alreadyImported) {
      throw new Error('This result package has already been imported.');
    }

    const formData = new FormData();
    formData.append('file', file, file.name);
    formData.append('examinationId', report.examinationId);
    formData.append('sittingId', report.sessionId);
    formData.append('sittingName', report.sittingName);
    formData.append('packageId', report.packageId || '');
    formData.append('packageRevision', String(report.packageRevision ?? 1));

    const res = await apiClient.centralUploadRequest<ResultImportAcknowledgement>(
      '/results/import-verified',
      formData
    );

    return res.data;
  },

  /**
   * Submits COE approval or rejection for an HOD Answer-Key Correction Request.
   * When approved, the Java backend updates the exam-specific answer key and recalculates marks.
   */
  async reviewAnswerKeyCorrection(
    requestId: string,
    decision: 'Approved' | 'Rejected',
    coeDecisionNotes: string
  ): Promise<{
    updatedRequest: AnswerKeyCorrectionRequest;
    recalculatedStudentCount: number;
    scoreChangedCount: number;
  }> {
    if (!coeDecisionNotes.trim()) {
      throw new Error('Please enter a decision remark for the audit record.');
    }

    const res = await apiClient.centralRequest<{
      updatedRequest: AnswerKeyCorrectionRequest;
      recalculatedStudentCount: number;
      scoreChangedCount: number;
    }>(
      `/results/answer-key-corrections/${encodeURIComponent(requestId)}/review`,
      {
        method: 'POST',
        body: JSON.stringify({
          decision,
          coeDecisionNotes: coeDecisionNotes.trim(),
        }),
      }
    );

    return res.data;
  },

  /**
   * Approves and releases final examination results via the Central Java Backend.
   */
  async approveAndReleaseResults(
    resultId: string
  ): Promise<ExaminationResultRecord> {
    const res = await apiClient.centralRequest<ExaminationResultRecord>(
      `/results/${encodeURIComponent(resultId)}/approve-release`,
      { method: 'POST' }
    );

    return res.data;
  },
};
