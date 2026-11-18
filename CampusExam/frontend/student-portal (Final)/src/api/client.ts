/**
 * @license
 * SPDX-License-Identifier: Apache-2.0
 */

/**
 * Unified API Client for Maharaja Institute of Technology Mysore Examination Portal.
 * Handles base URL resolution, bearer auth token injection, request/response interceptors,
 * timeout handling, and centralized error classification (401, 403, 404, 500, network, timeout).
 */

export interface RequestOptions extends RequestInit {
  timeoutMs?: number;
  token?: string | null;
  params?: Record<string, string | number | boolean | undefined | null>;
}

export type RequestInterceptor = (
  url: string,
  options: RequestOptions
) => Promise<{ url: string; options: RequestOptions }> | { url: string; options: RequestOptions };

export type ResponseInterceptor = (response: Response) => Promise<Response> | Response;

export type ErrorInterceptor = (error: ApiClientError) => Promise<never> | never;

export class ApiClientError extends Error {
  public readonly statusCode: number;
  public readonly code: string;
  public readonly isNetworkError: boolean;
  public readonly isTimeout: boolean;
  public readonly details?: unknown;

  constructor(
    message: string,
    statusCode = 500,
    code = 'API_ERROR',
    isNetworkError = false,
    isTimeout = false,
    details?: unknown
  ) {
    super(message);
    this.name = 'ApiClientError';
    this.statusCode = statusCode;
    this.code = code;
    this.isNetworkError = isNetworkError;
    this.isTimeout = isTimeout;
    this.details = details;
  }
}

const ACTIVE_STUDENT_TOKEN_KEY = 'mitm_student_active_session_token_v1';
const INSTRUCTOR_TOKEN_KEY = 'mitm_emgr_instructor_token_v1';

export class ApiClient {
  private baseUrl: string;
  private defaultTimeoutMs: number;
  private requestInterceptors: RequestInterceptor[] = [];
  private responseInterceptors: ResponseInterceptor[] = [];
  private errorInterceptors: ErrorInterceptor[] = [];

  constructor() {
    this.baseUrl =
      (typeof import.meta !== 'undefined' &&
        (import.meta.env?.VITE_API_URL || import.meta.env?.VITE_LAB_API_BASE_URL)) ||
      'http://localhost:8080';

    this.defaultTimeoutMs = Number(
      (typeof import.meta !== 'undefined' && import.meta.env?.VITE_API_TIMEOUT_MS) || 8000
    );

    // Register default response error interceptor for 401 handling
    this.useErrorInterceptor((error) => {
      const detailsObj = error.details as { endpoint?: string } | undefined;
      const endpoint = detailsObj?.endpoint || '';
      const isAuthActionEndpoint =
        endpoint.includes('/security/unlock') ||
        endpoint.includes('/student/login') ||
        endpoint.includes('/instructor/login');

      if (error.statusCode === 401 && !isAuthActionEndpoint) {
        if (typeof window !== 'undefined') {
          window.dispatchEvent(
            new CustomEvent('mitm:auth:unauthorized', {
              detail: { error },
            })
          );
        }
      }
      throw error;
    });
  }

  public getBaseUrl(): string {
    return this.baseUrl.replace(/\/$/, '');
  }

  public setBaseUrl(url: string): void {
    this.baseUrl = url;
  }

  public useRequestInterceptor(interceptor: RequestInterceptor): void {
    this.requestInterceptors.push(interceptor);
  }

  public useResponseInterceptor(interceptor: ResponseInterceptor): void {
    this.responseInterceptors.push(interceptor);
  }

  public useErrorInterceptor(interceptor: ErrorInterceptor): void {
    this.errorInterceptors.push(interceptor);
  }

  /**
   * Retrieves active auth token from memory/sessionStorage.
   * Priority: Student token, then Instructor token.
   */
  public getStoredToken(): string | null {
    if (typeof window === 'undefined') return null;
    try {
      return (
        sessionStorage.getItem(ACTIVE_STUDENT_TOKEN_KEY) ||
        localStorage.getItem(ACTIVE_STUDENT_TOKEN_KEY) ||
        sessionStorage.getItem(INSTRUCTOR_TOKEN_KEY) ||
        localStorage.getItem(INSTRUCTOR_TOKEN_KEY)
      );
    } catch {
      return null;
    }
  }

  public setStoredToken(token: string | null): void {
    if (typeof window === 'undefined') return null as unknown as void;
    try {
      if (!token) {
        sessionStorage.removeItem(ACTIVE_STUDENT_TOKEN_KEY);
        localStorage.removeItem(ACTIVE_STUDENT_TOKEN_KEY);
      } else {
        sessionStorage.setItem(ACTIVE_STUDENT_TOKEN_KEY, token);
        localStorage.setItem(ACTIVE_STUDENT_TOKEN_KEY, token);
      }
    } catch {
      // Ignore quota errors
    }
  }

  /**
   * Core request execution engine
   */
  public async request<TResponse>(
    endpoint: string,
    options: RequestOptions = {}
  ): Promise<TResponse> {
    let resolvedUrl = endpoint.startsWith('http')
      ? endpoint
      : `${this.getBaseUrl()}${endpoint.startsWith('/') ? '' : '/'}${endpoint}`;

    if (options.params) {
      const searchParams = new URLSearchParams();
      Object.entries(options.params).forEach(([key, val]) => {
        if (val !== undefined && val !== null && val !== '') {
          searchParams.append(key, String(val));
        }
      });
      const queryString = searchParams.toString();
      if (queryString) {
        resolvedUrl += (resolvedUrl.includes('?') ? '&' : '?') + queryString;
      }
    }

    let modifiedOptions: RequestOptions = {
      ...options,
      headers: { ...(options.headers as Record<string, string>) },
    };

    // Attach Bearer token if not explicitly provided and available
    const token = modifiedOptions.token !== undefined ? modifiedOptions.token : this.getStoredToken();
    if (token) {
      (modifiedOptions.headers as Record<string, string>)['Authorization'] = `Bearer ${token}`;
    }

    // Run Request Interceptors
    for (const interceptor of this.requestInterceptors) {
      const res = await interceptor(resolvedUrl, modifiedOptions);
      resolvedUrl = res.url;
      modifiedOptions = res.options;
    }

    const timeout = modifiedOptions.timeoutMs || this.defaultTimeoutMs;
    const controller = new AbortController();
    const timeoutId = setTimeout(() => controller.abort(), timeout);

    try {
      let response = await fetch(resolvedUrl, {
        ...modifiedOptions,
        signal: controller.signal,
      });

      clearTimeout(timeoutId);

      // Run Response Interceptors
      for (const interceptor of this.responseInterceptors) {
        response = await interceptor(response);
      }

      if (!response.ok) {
        let errorData: {
          message?: string;
          error?: string;
          code?: string;
          status?: string;
          lockdownRequired?: boolean;
          alreadySubmitted?: boolean;
          usn?: string;
          studentName?: string;
          details?: unknown;
        } = {};
        try {
          errorData = await response.json();
        } catch {
          // Response body was not JSON
        }

        const statusCode = response.status;
        let defaultMessage = `Request failed with status ${statusCode}`;
        if (statusCode === 401) {
          defaultMessage = 'Authentication session expired or invalid credentials. Please log in again.';
        } else if (statusCode === 403) {
          defaultMessage = 'Access forbidden. You do not have permission to perform this examination action.';
        } else if (statusCode === 404) {
          defaultMessage = 'The requested examination resource or endpoint was not found on the server.';
        } else if (statusCode >= 500) {
          defaultMessage = 'The Lab Server encountered an internal error. Please notify the lab invigilator.';
        }

        const errorMessage = errorData.error || errorData.message || defaultMessage;
        const baseDetails =
          errorData.details && typeof errorData.details === 'object'
            ? { ...(errorData.details as Record<string, unknown>) }
            : { rawDetails: errorData.details };
        const mergedDetails: Record<string, unknown> = {
          ...baseDetails,
          endpoint,
          ...(errorData.status !== undefined ? { status: errorData.status } : {}),
          ...(errorData.lockdownRequired !== undefined ? { lockdownRequired: errorData.lockdownRequired } : {}),
          ...(errorData.alreadySubmitted !== undefined ? { alreadySubmitted: errorData.alreadySubmitted } : {}),
          ...(errorData.usn !== undefined ? { usn: errorData.usn } : {}),
          ...(errorData.studentName !== undefined ? { studentName: errorData.studentName } : {}),
        };
        const apiError = new ApiClientError(
          errorMessage,
          statusCode,
          errorData.code || errorData.status || `HTTP_${statusCode}`,
          false,
          false,
          mergedDetails
        );

        throw apiError;
      }

      // 204 No Content
      if (response.status === 204) {
        return undefined as unknown as TResponse;
      }

      return (await response.json()) as TResponse;
    } catch (err) {
      clearTimeout(timeoutId);

      if (err instanceof ApiClientError) {
        return this.handleError(err);
      }

      const isTimeout = err instanceof Error && err.name === 'AbortError';
      const apiError = new ApiClientError(
        isTimeout
          ? `Request timed out after ${timeout}ms. Check that the Lab Server at ${this.getBaseUrl()} is reachable.`
          : `Unable to connect to the Lab Server at ${this.getBaseUrl()}. Check your network connection.`,
        0,
        isTimeout ? 'REQUEST_TIMEOUT' : 'NETWORK_ERROR',
        !isTimeout,
        isTimeout
      );

      return this.handleError(apiError);
    }
  }

  private handleError(error: ApiClientError): Promise<never> {
    for (const interceptor of this.errorInterceptors) {
      interceptor(error);
    }
    return Promise.reject(error);
  }

  public get<T>(endpoint: string, options: RequestOptions = {}): Promise<T> {
    return this.request<T>(endpoint, {
      ...options,
      method: 'GET',
    });
  }

  public post<T>(endpoint: string, body?: unknown, options: RequestOptions = {}): Promise<T> {
    const isFormData = typeof FormData !== 'undefined' && body instanceof FormData;
    const headers = {
      ...(isFormData ? {} : { 'Content-Type': 'application/json' }),
      ...(options.headers as Record<string, string>),
    };

    return this.request<T>(endpoint, {
      ...options,
      method: 'POST',
      headers,
      body: isFormData ? (body as FormData) : body !== undefined ? JSON.stringify(body) : undefined,
    });
  }

  public put<T>(endpoint: string, body?: unknown, options: RequestOptions = {}): Promise<T> {
    const isFormData = typeof FormData !== 'undefined' && body instanceof FormData;
    const headers = {
      ...(isFormData ? {} : { 'Content-Type': 'application/json' }),
      ...(options.headers as Record<string, string>),
    };

    return this.request<T>(endpoint, {
      ...options,
      method: 'PUT',
      headers,
      body: isFormData ? (body as FormData) : body !== undefined ? JSON.stringify(body) : undefined,
    });
  }

  public patch<T>(endpoint: string, body?: unknown, options: RequestOptions = {}): Promise<T> {
    const isFormData = typeof FormData !== 'undefined' && body instanceof FormData;
    const headers = {
      ...(isFormData ? {} : { 'Content-Type': 'application/json' }),
      ...(options.headers as Record<string, string>),
    };

    return this.request<T>(endpoint, {
      ...options,
      method: 'PATCH',
      headers,
      body: isFormData ? (body as FormData) : body !== undefined ? JSON.stringify(body) : undefined,
    });
  }

  public delete<T>(endpoint: string, options: RequestOptions = {}): Promise<T> {
    return this.request<T>(endpoint, {
      ...options,
      method: 'DELETE',
    });
  }

  /**
   * Dedicated helper for multipart file uploads
   */
  public upload<T>(endpoint: string, formData: FormData, options: RequestOptions = {}): Promise<T> {
    return this.post<T>(endpoint, formData, options);
  }
}

// Singleton API Client export
export const apiClient = new ApiClient();
