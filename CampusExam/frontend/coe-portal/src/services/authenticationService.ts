import { AuthResponse } from '../types/examination';
import {
  apiClient,
  ApiError,
  AUTH_SESSION_STORAGE_KEY,
  AUTH_TOKEN_STORAGE_KEY,
} from './apiClient';

export const authenticationService = {
  /**
   * Authenticates COE credentials strictly against the Central Java Backend API.
   */
  async login(username: string, password: string): Promise<AuthResponse> {
    const cleanUser = username.trim();
    if (!cleanUser) {
      throw new Error('Please enter your COE username.');
    }
    if (!password) {
      throw new Error('Please enter your password.');
    }

    let authResult: AuthResponse;
    try {
      const res = await apiClient.centralRequest<AuthResponse>('/auth/coe/login', {
        method: 'POST',
        body: JSON.stringify({ username: cleanUser, password }),
      });

      if (!res.data?.authenticated || !res.data?.token) {
        throw new Error(
          'Authentication failed. Invalid server response from authentication service.'
        );
      }
      authResult = res.data;
    } catch (err) {
      if (err instanceof ApiError && err.kind === 'network') {
        throw new Error(
          'Authentication service unavailable. Unable to reach the Central Java Backend. Please verify backend connectivity and try again.'
        );
      }
      throw err;
    }

    sessionStorage.setItem(AUTH_SESSION_STORAGE_KEY, JSON.stringify(authResult));
    sessionStorage.setItem(AUTH_TOKEN_STORAGE_KEY, authResult.token);
    return authResult;
  },

  async logout(): Promise<void> {
    try {
      await apiClient.centralRequest('/auth/coe/logout', { method: 'POST' });
    } catch {
      // Clear local session tokens even if backend session already expired or is unreachable
    } finally {
      sessionStorage.removeItem(AUTH_SESSION_STORAGE_KEY);
      sessionStorage.removeItem(AUTH_TOKEN_STORAGE_KEY);
    }
  },

  getCurrentSession(): AuthResponse | null {
    try {
      const raw = sessionStorage.getItem(AUTH_SESSION_STORAGE_KEY);
      const token = sessionStorage.getItem(AUTH_TOKEN_STORAGE_KEY);
      if (!raw || !token) return null;
      const parsed = JSON.parse(raw) as AuthResponse;
      if (
        !parsed.authenticated ||
        token.startsWith('coe-local-preview-') ||
        parsed.user?.id === 'coe-preview-01'
      ) {
        sessionStorage.removeItem(AUTH_SESSION_STORAGE_KEY);
        sessionStorage.removeItem(AUTH_TOKEN_STORAGE_KEY);
        return null;
      }
      return parsed;
    } catch {
      return null;
    }
  },

  async changePassword(
    currentPassword: string,
    newPassword: string,
    confirmNewPassword: string
  ): Promise<{ message: string }> {
    if (!currentPassword) {
      throw new Error('Current password is required.');
    }
    if (!newPassword || newPassword.length < 8) {
      throw new Error(
        'Weak password: New password must be at least 8 characters long and include letters and numbers.'
      );
    }
    if (!/[A-Za-z]/.test(newPassword) || !/[0-9]/.test(newPassword)) {
      throw new Error(
        'Weak password: New password must contain both alphabetic characters and numeric digits.'
      );
    }
    if (newPassword !== confirmNewPassword) {
      throw new Error('Password confirmation does not match the new password.');
    }
    if (currentPassword === newPassword) {
      throw new Error('New password must be different from your current password.');
    }

    const res = await apiClient.centralRequest<{ message: string }>(
      '/auth/coe/change-password',
      {
        method: 'POST',
        body: JSON.stringify({ currentPassword, newPassword }),
      }
    );

    return res.data;
  },
};
