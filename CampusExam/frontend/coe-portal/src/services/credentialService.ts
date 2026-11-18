import { SessionUnlockCredential } from '../types/examination';
import { OfflineUnlockVerificationResult } from '../utils/credentials';
import { apiClient } from './apiClient';

export interface GenerateSessionUnlockResult {
  credential: SessionUnlockCredential;
  revealOnceSecret: string;
}

export const credentialService = {
  async getSessionUnlockCredentials(): Promise<SessionUnlockCredential[]> {
    const res = await apiClient.centralRequest<SessionUnlockCredential[]>(
      '/examinations/unlock-credentials',
      { method: 'GET' }
    );
    return res.data;
  },

  /**
   * Requests the Central Java Backend to generate a CSPRNG sitting-specific
   * Invigilator Session Unlock Credential, sync its salted verifier to the Lab Server,
   * and return the plaintext once for COE handoff.
   */
  async generateSessionUnlockCredential(
    examinationId: string,
    sittingId: string
  ): Promise<GenerateSessionUnlockResult> {
    const res = await apiClient.centralRequest<GenerateSessionUnlockResult>(
      `/examinations/${encodeURIComponent(examinationId)}/sittings/${encodeURIComponent(
        sittingId
      )}/unlock-credential`,
      {
        method: 'POST',
        body: JSON.stringify({ examinationId, sittingId }),
      }
    );

    return res.data;
  },

  /**
   * Requests the Central Java Backend to invalidate the active sitting unlock credential
   * and generate & sync a fresh revision to the Lab Server.
   */
  async regenerateSessionUnlockCredential(
    examinationId: string,
    sittingId: string
  ): Promise<GenerateSessionUnlockResult> {
    const res = await apiClient.centralRequest<GenerateSessionUnlockResult>(
      `/examinations/${encodeURIComponent(examinationId)}/sittings/${encodeURIComponent(
        sittingId
      )}/unlock-credential/regenerate`,
      {
        method: 'POST',
        body: JSON.stringify({ examinationId, sittingId }),
      }
    );

    return res.data;
  },

  async revokeSessionUnlockCredential(
    examinationId: string,
    sittingId: string
  ): Promise<SessionUnlockCredential> {
    const res = await apiClient.centralRequest<SessionUnlockCredential>(
      `/examinations/${encodeURIComponent(examinationId)}/sittings/${encodeURIComponent(
        sittingId
      )}/unlock-credential/revoke`,
      { method: 'POST' }
    );

    return res.data;
  },

  /**
   * Submits an unlock verification request to the Lab Server API.
   */
  async verifyLocalSessionUnlock(params: {
    candidateSecret: string;
    examinationId: string;
    sittingId: string;
    labId: string;
    pcId: string;
    studentUsn: string;
    invigilatorOperatorId: string;
  }): Promise<OfflineUnlockVerificationResult> {
    const res = await apiClient.labServerRequest<OfflineUnlockVerificationResult>(
      `/labs/${encodeURIComponent(params.labId)}/sittings/${encodeURIComponent(
        params.sittingId
      )}/verify-unlock`,
      {
        method: 'POST',
        body: JSON.stringify(params),
      }
    );

    return res.data;
  },
};
