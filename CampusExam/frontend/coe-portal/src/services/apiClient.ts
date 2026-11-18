export type ApiErrorKind =
  | 'network'
  | 'unauthorised'
  | 'forbidden'
  | 'validation'
  | 'not_found'
  | 'server';

export class ApiError extends Error {
  public readonly status?: number;
  public readonly kind: ApiErrorKind;
  public readonly code?: string;
  public readonly details?: string[];

  constructor(
    message: string,
    options: {
      status?: number;
      kind: ApiErrorKind;
      code?: string;
      details?: string[];
    }
  ) {
    super(message);
    this.name = 'ApiError';
    this.status = options.status;
    this.kind = options.kind;
    this.code = options.code;
    this.details = options.details;
  }
}

export interface ApiClientConfig {
  centralApiBaseUrl: string;
  labApiBaseUrl: string;
}

export const AUTH_SESSION_STORAGE_KEY = 'mitm_coe_auth_session_v2';
export const AUTH_TOKEN_STORAGE_KEY = 'mitm_coe_auth_token_v2';

let unauthorisedHandler: (() => void) | null = null;

export function getApiConfig(): ApiClientConfig {
  const metaEnv =
    (typeof import.meta !== 'undefined' && import.meta.env) ||
    ({} as Record<string, string | undefined>);
  const centralRaw = (metaEnv.VITE_API_BASE_URL || 'http://localhost:8080/api/v1').trim();
  const labRaw = (metaEnv.VITE_LAB_API_BASE_URL || 'http://192.168.10.50:8443/lab-api/v1').trim();

  return {
    centralApiBaseUrl: centralRaw.replace(/\/+$/, ''),
    labApiBaseUrl: labRaw.replace(/\/+$/, ''),
  };
}

function classifyHttpStatus(status: number): ApiErrorKind {
  if (status === 401) return 'unauthorised';
  if (status === 403) return 'forbidden';
  if (status === 404) return 'not_found';
  if (status === 400 || status === 409 || status === 422) return 'validation';
  return 'server';
}

async function parseErrorResponse(
  response: Response,
  serviceLabel: string
): Promise<ApiError> {
  const kind = classifyHttpStatus(response.status);
  let message = '';
  let code: string | undefined;
  let details: string[] | undefined;

  try {
    const rawText = await response.text();
    if (rawText) {
      try {
        const parsed = JSON.parse(rawText) as {
          message?: string;
          error?: string;
          code?: string;
          errors?: unknown;
        };
        message = parsed.message || parsed.error || '';
        code = parsed.code;
        if (Array.isArray(parsed.errors)) {
          details = parsed.errors.map((e) => String(e));
        }
      } catch {
        message = rawText;
      }
    }
  } catch {
    // Ignore body read error and fall back to status text
  }

  if (response.status === 401) {
    sessionStorage.removeItem(AUTH_SESSION_STORAGE_KEY);
    sessionStorage.removeItem(AUTH_TOKEN_STORAGE_KEY);
    unauthorisedHandler?.();
    return new ApiError(
      message || 'Your COE Portal session has expired or is unauthorised. Please sign in again.',
      { status: 401, kind: 'unauthorised', code, details }
    );
  }

  if (response.status === 403) {
    return new ApiError(
      message || 'Access denied. Your account lacks COE permission for this operation.',
      { status: 403, kind: 'forbidden', code, details }
    );
  }

  return new ApiError(
    message ||
      `${serviceLabel} returned HTTP ${response.status}${
        response.statusText ? ` (${response.statusText})` : ''
      }.`,
    { status: response.status, kind, code, details }
  );
}

async function executeJsonFetch<T>(
  url: string,
  options: RequestInit,
  serviceLabel: string
): Promise<T> {
  const token = sessionStorage.getItem(AUTH_TOKEN_STORAGE_KEY);
  let response: Response;
  try {
    response = await fetch(url, {
      ...options,
      headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json',
        ...(token ? { Authorization: `Bearer ${token}` } : {}),
        ...(options.headers || {}),
      },
    });
  } catch {
    throw new ApiError(
      `Unable to reach ${serviceLabel}. Verify network connectivity and ensure the backend service is running.`,
      { kind: 'network' }
    );
  }

  if (!response.ok) {
    throw await parseErrorResponse(response, serviceLabel);
  }

  if (response.status === 204) {
    return undefined as T;
  }

  const text = await response.text();
  if (!text) {
    return undefined as T;
  }

  const parsed = JSON.parse(text);
  if (
    parsed &&
    typeof parsed === 'object' &&
    'data' in parsed &&
    ('success' in parsed || 'timestamp' in parsed)
  ) {
    return parsed.data as T;
  }
  return parsed as T;
}

export const apiClient = {
  getConfig: getApiConfig,

  setOnUnauthorisedHandler(handler: (() => void) | null): void {
    unauthorisedHandler = handler;
  },

  async centralRequest<T>(
    endpoint: string,
    options: RequestInit = {}
  ): Promise<{ data: T; source: 'java-rest-backend' }> {
    const config = getApiConfig();
    const data = await executeJsonFetch<T>(
      `${config.centralApiBaseUrl}${endpoint}`,
      options,
      'Central Java Backend'
    );
    return { data, source: 'java-rest-backend' };
  },

  async centralUploadRequest<T>(
    endpoint: string,
    formData: FormData
  ): Promise<{ data: T; source: 'java-rest-backend' }> {
    const config = getApiConfig();
    const token = sessionStorage.getItem(AUTH_TOKEN_STORAGE_KEY);
    let response: Response;
    try {
      response = await fetch(`${config.centralApiBaseUrl}${endpoint}`, {
        method: 'POST',
        body: formData,
        headers: {
          Accept: 'application/json',
          ...(token ? { Authorization: `Bearer ${token}` } : {}),
        },
      });
    } catch {
      throw new ApiError(
        'Unable to reach Central Java Backend for file upload. Verify backend connectivity and try again.',
        { kind: 'network' }
      );
    }

    if (!response.ok) {
      throw await parseErrorResponse(response, 'Central Java Backend');
    }

    const text = await response.text();
    const data = text ? (JSON.parse(text) as T) : (undefined as T);
    return { data, source: 'java-rest-backend' };
  },

  async centralBlobRequest(
    endpoint: string,
    options: RequestInit = {}
  ): Promise<{ blob: Blob; contentType: string; filename?: string }> {
    const config = getApiConfig();
    const token = sessionStorage.getItem(AUTH_TOKEN_STORAGE_KEY);
    let response: Response;
    try {
      response = await fetch(`${config.centralApiBaseUrl}${endpoint}`, {
        ...options,
        headers: {
          Accept: 'application/pdf, application/octet-stream, application/json',
          ...(token ? { Authorization: `Bearer ${token}` } : {}),
          ...(options.headers || {}),
        },
      });
    } catch {
      throw new ApiError(
        'Unable to reach Central Java Backend to retrieve the document. Verify network connectivity and backend status.',
        { kind: 'network' }
      );
    }

    if (!response.ok) {
      throw await parseErrorResponse(response, 'Central Java Backend');
    }

    const blob = await response.blob();
    const contentType = response.headers.get('Content-Type') || 'application/pdf';
    const disposition = response.headers.get('Content-Disposition') || '';
    const utf8Match = disposition.match(/filename\*=UTF-8''([^;\n]+)/i);
    const stdMatch = disposition.match(/filename="?([^";\n]+)"?/i);
    const filename = utf8Match
      ? decodeURIComponent(utf8Match[1])
      : stdMatch
        ? stdMatch[1]
        : undefined;

    return { blob, contentType, filename };
  },

  async labServerRequest<T>(
    endpoint: string,
    options: RequestInit = {}
  ): Promise<{ data: T; source: 'isolated-lab-server' }> {
    const config = getApiConfig();
    const data = await executeJsonFetch<T>(
      `${config.labApiBaseUrl}${endpoint}`,
      options,
      'Laboratory Server API'
    );
    return { data, source: 'isolated-lab-server' };
  },
};
