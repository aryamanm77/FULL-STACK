import React, { useCallback, useEffect, useMemo, useState } from 'react';
import {
  AlertCircle,
  ArrowLeft,
  BookOpenCheck,
  CheckCircle2,
  Clock,
  Download,
  Eye,
  FileText,
  History,
  Loader2,
  MessageSquareWarning,
  Plus,
  RefreshCw,
  Search,
  Trash2,
} from 'lucide-react';
import { useExaminationStore } from '../hooks/useExaminationStore';
import { courseOutcomeService } from '../services/courseOutcomeService';
import {
  CourseOutcomeStatement,
  CourseOutcomeStatus,
  CourseOutcomeSubmission,
  DepartmentCode,
} from '../types/examination';
import { StatusIndicator, SemanticTone } from '../components/StatusIndicator';
import { formatSemesterLabel } from '../utils/academicSemesters';

const CANONICAL_DEPARTMENTS: DepartmentCode[] = [
  'CSE',
  'ISE',
  'ECE',
  'AIML',
  'ME',
  'CV',
];

function getCourseOutcomeStatusTone(status: CourseOutcomeStatus): SemanticTone {
  switch (status) {
    case 'Reviewed':
      return 'approved';
    case 'Under Review':
      return 'info';
    case 'Clarification Requested':
      return 'warning';
    case 'Received':
    default:
      return 'pending';
  }
}

function formatFileSize(bytes?: number): string {
  if (!bytes || bytes <= 0) return '—';
  if (bytes < 1024) return `${bytes} B`;
  if (bytes < 1024 * 1024) return `${(bytes / 1024).toFixed(1)} KB`;
  return `${(bytes / (1024 * 1024)).toFixed(2)} MB`;
}

export const CourseOutcomesPage: React.FC = () => {
  const { departments, semesters, notify } = useExaminationStore();

  const [submissions, setSubmissions] = useState<CourseOutcomeSubmission[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [loadError, setLoadError] = useState<string | null>(null);

  // Filters
  const [departmentFilter, setDepartmentFilter] = useState<string>('ALL');
  const [semesterFilter, setSemesterFilter] = useState<string>('ALL');
  const [subjectSearch, setSubjectSearch] = useState<string>('');
  const [statusFilter, setStatusFilter] = useState<string>('ALL');
  const [fromDate, setFromDate] = useState<string>('');
  const [toDate, setToDate] = useState<string>('');

  // Selected submission detail workspace
  const [selectedSubmissionId, setSelectedSubmissionId] = useState<string | null>(null);
  const [activeRevisionNumber, setActiveRevisionNumber] = useState<number | null>(null);
  const [pdfPreviewUrl, setPdfPreviewUrl] = useState<string | null>(null);
  const [pdfPreviewLoading, setPdfPreviewLoading] = useState<boolean>(false);
  const [pdfPreviewError, setPdfPreviewError] = useState<string | null>(null);
  const [downloadingRevision, setDownloadingRevision] = useState<number | null>(null);

  // COE Review state (stored separately from original PDF)
  const [coStatements, setCoStatements] = useState<CourseOutcomeStatement[]>([]);
  const [internalNotes, setInternalNotes] = useState<string>('');
  const [clarificationNotes, setClarificationNotes] = useState<string>('');
  const [savingReview, setSavingReview] = useState<boolean>(false);

  const loadSubmissions = useCallback(async () => {
    setLoading(true);
    setLoadError(null);
    try {
      const data = await courseOutcomeService.getCourseOutcomeSubmissions();
      setSubmissions(Array.isArray(data) ? data : []);
    } catch (err) {
      setSubmissions([]);
      setLoadError(
        err instanceof Error
          ? err.message
          : 'Unable to load Course Outcomes submissions from backend.'
      );
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    loadSubmissions();
  }, [loadSubmissions]);

  // Clean up object URL when changing preview or unmounting
  useEffect(() => {
    return () => {
      if (pdfPreviewUrl) {
        URL.revokeObjectURL(pdfPreviewUrl);
      }
    };
  }, [pdfPreviewUrl]);

  const departmentOptions = useMemo(() => {
    const map = new Map<string, string>();
    const normalizeCode = (c: string) =>
      c.trim().toUpperCase() === 'CIVIL' ? 'CV' : c.trim().toUpperCase();
    CANONICAL_DEPARTMENTS.forEach((code) => map.set(normalizeCode(code), code));
    departments.forEach((d) => {
      const key = normalizeCode(d.code);
      map.set(key, `${key} — ${d.name}`);
    });
    return Array.from(map.entries()).map(([code, label]) => ({ code, label }));
  }, [departments]);

  const filteredSubmissions = useMemo(() => {
    return submissions.filter((item) => {
      if (departmentFilter !== 'ALL' && item.department !== departmentFilter) {
        return false;
      }
      if (
        semesterFilter !== 'ALL' &&
        item.semester !== Number(semesterFilter)
      ) {
        return false;
      }
      if (statusFilter !== 'ALL' && item.status !== statusFilter) {
        return false;
      }
      const q = subjectSearch.trim().toLowerCase();
      if (q) {
        const matchesSubject =
          item.subjectName.toLowerCase().includes(q) ||
          item.subjectCode.toLowerCase().includes(q) ||
          item.submittedByHod.toLowerCase().includes(q);
        if (!matchesSubject) return false;
      }
      const submittedDay = (item.submittedAt || '').slice(0, 10);
      if (fromDate && submittedDay && submittedDay < fromDate) return false;
      if (toDate && submittedDay && submittedDay > toDate) return false;
      return true;
    });
  }, [
    submissions,
    departmentFilter,
    semesterFilter,
    statusFilter,
    subjectSearch,
    fromDate,
    toDate,
  ]);

  const selectedSubmission = useMemo(
    () =>
      selectedSubmissionId
        ? submissions.find((s) => s.id === selectedSubmissionId) || null
        : null,
    [submissions, selectedSubmissionId]
  );

  // Sync review inputs when opening or refreshing a submission
  useEffect(() => {
    if (!selectedSubmission) return;
    setCoStatements(
      (selectedSubmission.courseOutcomeStatements || []).map((st) => ({
        id: st.id,
        code: st.code,
        statement: st.statement,
      }))
    );
    setInternalNotes(selectedSubmission.internalReviewNotes || '');
    setClarificationNotes(selectedSubmission.clarificationNotes || '');
    setActiveRevisionNumber(selectedSubmission.currentRevisionNumber);
  }, [selectedSubmission]);

  const handleLoadPdfPreview = useCallback(
    async (submissionId: string, revisionNumber: number) => {
      setPdfPreviewLoading(true);
      setPdfPreviewError(null);
      setActiveRevisionNumber(revisionNumber);
      try {
        const res = await courseOutcomeService.fetchCourseOutcomePdfBlob(
          submissionId,
          revisionNumber,
          'inline'
        );
        const url = URL.createObjectURL(res.blob);
        setPdfPreviewUrl((prev) => {
          if (prev) URL.revokeObjectURL(prev);
          return url;
        });
      } catch (err) {
        setPdfPreviewUrl((prev) => {
          if (prev) URL.revokeObjectURL(prev);
          return null;
        });
        setPdfPreviewError(
          err instanceof Error
            ? err.message
            : 'Unable to load Course Outcomes PDF preview from backend.'
        );
      } finally {
        setPdfPreviewLoading(false);
      }
    },
    []
  );

  const handleOpenSubmission = (submission: CourseOutcomeSubmission) => {
    setSelectedSubmissionId(submission.id);
    setPdfPreviewError(null);
    handleLoadPdfPreview(submission.id, submission.currentRevisionNumber);
  };

  const handleCloseDetail = () => {
    setSelectedSubmissionId(null);
    setActiveRevisionNumber(null);
    setPdfPreviewError(null);
    setPdfPreviewUrl((prev) => {
      if (prev) URL.revokeObjectURL(prev);
      return null;
    });
  };

  const handleDownloadPdfRevision = async (
    submission: CourseOutcomeSubmission,
    revisionNumber: number
  ) => {
    setDownloadingRevision(revisionNumber);
    try {
      const res = await courseOutcomeService.fetchCourseOutcomePdfBlob(
        submission.id,
        revisionNumber,
        'attachment'
      );
      const revMeta = submission.revisions.find(
        (r) => r.revisionNumber === revisionNumber
      );
      const fallbackName =
        revMeta?.fileName ||
        `${submission.department}_Sem${submission.semester}_${submission.subjectCode}_CO_Rev${revisionNumber}.pdf`;
      const downloadName = res.filename || fallbackName;
      const objectUrl = URL.createObjectURL(res.blob);
      const anchor = document.createElement('a');
      anchor.href = objectUrl;
      anchor.download = downloadName;
      document.body.appendChild(anchor);
      anchor.click();
      document.body.removeChild(anchor);
      URL.revokeObjectURL(objectUrl);
    } catch (err) {
      notify(
        'error',
        'Download Failed',
        err instanceof Error
          ? err.message
          : 'Unable to download Course Outcomes PDF from backend.'
      );
    } finally {
      setDownloadingRevision(null);
    }
  };

  const handleAddCoRow = () => {
    setCoStatements((prev) => [
      ...prev,
      {
        code: `CO${prev.length + 1}`,
        statement: '',
      },
    ]);
  };

  const handleUpdateCoRow = (
    index: number,
    field: 'code' | 'statement',
    value: string
  ) => {
    setCoStatements((prev) =>
      prev.map((row, idx) => (idx === index ? { ...row, [field]: value } : row))
    );
  };

  const handleRemoveCoRow = (index: number) => {
    setCoStatements((prev) => prev.filter((_, idx) => idx !== index));
  };

  const handleSubmitReview = async (targetStatus: CourseOutcomeStatus) => {
    if (!selectedSubmission) return;
    setSavingReview(true);
    try {
      const updated = await courseOutcomeService.reviewCourseOutcomeSubmission(
        selectedSubmission.id,
        {
          status: targetStatus,
          internalReviewNotes: internalNotes,
          clarificationNotes,
          courseOutcomeStatements: coStatements,
        }
      );
      setSubmissions((prev) =>
        prev.map((item) => (item.id === updated.id ? updated : item))
      );
      notify(
        'success',
        'Course Outcomes Updated',
        `${updated.subjectCode} (${updated.subjectName}) status updated to ${updated.status}.`
      );
    } catch (err) {
      notify(
        'error',
        'Review Save Failed',
        err instanceof Error
          ? err.message
          : 'Unable to save Course Outcomes review.'
      );
    } finally {
      setSavingReview(false);
    }
  };

  const hasActiveFilters =
    departmentFilter !== 'ALL' ||
    semesterFilter !== 'ALL' ||
    statusFilter !== 'ALL' ||
    subjectSearch.trim() !== '' ||
    fromDate !== '' ||
    toDate !== '';

  const resetFilters = () => {
    setDepartmentFilter('ALL');
    setSemesterFilter('ALL');
    setSubjectSearch('');
    setStatusFilter('ALL');
    setFromDate('');
    setToDate('');
  };

  // ==========================================================================
  // DETAIL WORKSPACE VIEW
  // ==========================================================================
  if (selectedSubmission) {
    const sortedRevisions = [...(selectedSubmission.revisions || [])].sort(
      (a, b) => b.revisionNumber - a.revisionNumber
    );
    const activeRevObj =
      sortedRevisions.find((r) => r.revisionNumber === activeRevisionNumber) ||
      sortedRevisions[0];

    return (
      <div className="space-y-7">
        {/* Top Bar & Metadata Summary */}
        <div className="bg-white dark:bg-[#1E293B] border border-[#D9E2EF] dark:border-[#334155] rounded-xl p-6 sm:p-7 shadow-xs space-y-5">
          <div className="flex flex-wrap items-center justify-between gap-4 border-b border-[#D9E2EF] dark:border-[#334155] pb-4">
            <div className="space-y-1.5">
              <button
                type="button"
                onClick={handleCloseDetail}
                className="inline-flex items-center gap-1.5 text-sm font-semibold text-[#2563EB] dark:text-blue-400 hover:underline cursor-pointer"
              >
                <ArrowLeft className="w-4 h-4" />
                Back to Course Outcomes Submissions
              </button>
              <div className="flex flex-wrap items-center gap-3 pt-1">
                <h1 className="text-[24px] sm:text-[26px] font-bold text-[#1F2937] dark:text-slate-100 leading-tight">
                  {selectedSubmission.subjectCode
                    ? `${selectedSubmission.subjectCode} — ${selectedSubmission.subjectName}`
                    : selectedSubmission.subjectName}
                </h1>
                <StatusIndicator
                  tone={getCourseOutcomeStatusTone(selectedSubmission.status)}
                  label={selectedSubmission.status}
                />
                <span className="px-2.5 py-1 rounded-md text-xs font-mono font-bold bg-blue-50 dark:bg-blue-950/40 text-[#2563EB] dark:text-blue-300 border border-blue-200 dark:border-blue-800">
                  Rev {selectedSubmission.currentRevisionNumber} (Latest)
                </span>
              </div>
            </div>

            <div className="flex flex-wrap items-center gap-2.5">
              <button
                type="button"
                onClick={() =>
                  handleLoadPdfPreview(
                    selectedSubmission.id,
                    activeRevisionNumber ?? selectedSubmission.currentRevisionNumber
                  )
                }
                disabled={pdfPreviewLoading}
                className="inline-flex items-center gap-2 px-4 py-2.5 text-sm font-semibold text-[#1F2937] dark:text-slate-100 bg-[#F5F7FB] dark:bg-[#0F172A] hover:bg-slate-200 dark:hover:bg-slate-800 border border-[#D9E2EF] dark:border-[#334155] rounded-lg cursor-pointer disabled:opacity-50"
              >
                <Eye className="w-4 h-4" />
                Preview PDF
              </button>
              <button
                type="button"
                onClick={() =>
                  handleDownloadPdfRevision(
                    selectedSubmission,
                    activeRevisionNumber ?? selectedSubmission.currentRevisionNumber
                  )
                }
                disabled={downloadingRevision !== null}
                className="inline-flex items-center gap-2 px-4 py-2.5 text-sm font-semibold text-white bg-[#2563EB] hover:bg-blue-700 rounded-lg cursor-pointer disabled:opacity-50"
              >
                <Download className="w-4 h-4" />
                {downloadingRevision !== null
                  ? 'Downloading...'
                  : 'Download Original PDF'}
              </button>
            </div>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4 text-sm">
            <div className="p-3.5 rounded-lg bg-[#F5F7FB] dark:bg-[#0F172A]/60 border border-[#D9E2EF] dark:border-[#334155]">
              <div className="text-xs font-semibold uppercase tracking-wide text-[#64748B] dark:text-slate-400">
                Department &amp; Semester
              </div>
              <div className="font-bold text-[#1F2937] dark:text-slate-100 mt-1">
                {selectedSubmission.departmentName || selectedSubmission.department} (
                {selectedSubmission.department}) &middot;{' '}
                {formatSemesterLabel(selectedSubmission.semester)}
              </div>
            </div>

            <div className="p-3.5 rounded-lg bg-[#F5F7FB] dark:bg-[#0F172A]/60 border border-[#D9E2EF] dark:border-[#334155]">
              <div className="text-xs font-semibold uppercase tracking-wide text-[#64748B] dark:text-slate-400">
                Submitting HOD &amp; Timestamp
              </div>
              <div className="font-bold text-[#1F2937] dark:text-slate-100 mt-1">
                {selectedSubmission.submittedByHod}
              </div>
              <div className="text-xs font-mono text-[#64748B] dark:text-slate-400 mt-0.5">
                {selectedSubmission.submittedAt}
              </div>
            </div>

            <div className="p-3.5 rounded-lg bg-[#F5F7FB] dark:bg-[#0F172A]/60 border border-[#D9E2EF] dark:border-[#334155]">
              <div className="text-xs font-semibold uppercase tracking-wide text-[#64748B] dark:text-slate-400">
                Viewing Document Revision
              </div>
              <div className="font-bold text-[#1F2937] dark:text-slate-100 mt-1 truncate">
                Rev {activeRevisionNumber ?? selectedSubmission.currentRevisionNumber} &middot;{' '}
                {activeRevObj?.fileName || selectedSubmission.fileName}
              </div>
              <div className="text-xs font-mono text-[#64748B] dark:text-slate-400 mt-0.5">
                Size:{' '}
                {formatFileSize(
                  activeRevObj?.fileSizeBytes ?? selectedSubmission.fileSizeBytes
                )}
              </div>
            </div>
          </div>
        </div>

        {/* Split Workspace: Original PDF Preview (Left) + COE Review & Dynamic COs (Right) */}
        <div className="grid grid-cols-1 xl:grid-cols-12 gap-7">
          {/* Left: Original HOD Course Outcomes PDF Viewer (Unmodified) */}
          <section className="xl:col-span-7 bg-white dark:bg-[#1E293B] border border-[#D9E2EF] dark:border-[#334155] rounded-xl p-6 shadow-xs flex flex-col space-y-4">
            <div className="flex flex-wrap items-center justify-between gap-3 border-b border-[#D9E2EF] dark:border-[#334155] pb-3.5">
              <div>
                <h2 className="text-[19px] font-bold text-[#1F2937] dark:text-slate-100 flex items-center gap-2">
                  <FileText className="w-5 h-5 text-[#2563EB]" />
                  Original HOD Course Outcomes PDF
                </h2>
                <p className="text-xs text-[#64748B] dark:text-slate-400 mt-0.5">
                  Served unchanged from the Central Java Backend repository.
                </p>
              </div>
              {sortedRevisions.length > 1 && (
                <select
                  aria-label="Select document revision to preview"
                  value={activeRevisionNumber ?? selectedSubmission.currentRevisionNumber}
                  onChange={(e) =>
                    handleLoadPdfPreview(
                      selectedSubmission.id,
                      Number(e.target.value)
                    )
                  }
                  className="px-3 py-2 text-xs font-semibold rounded-lg border border-[#D9E2EF] dark:border-[#334155] bg-[#F5F7FB] dark:bg-[#0F172A] text-[#1F2937] dark:text-slate-100"
                >
                  {sortedRevisions.map((rev) => (
                    <option key={rev.revisionNumber} value={rev.revisionNumber}>
                      Revision {rev.revisionNumber}
                      {rev.isLatest ? ' (Latest)' : ' (Previous)'} — {rev.submittedAt}
                    </option>
                  ))}
                </select>
              )}
            </div>

            {pdfPreviewLoading ? (
              <div className="h-[620px] rounded-xl border border-[#D9E2EF] dark:border-[#334155] bg-[#F5F7FB] dark:bg-[#0F172A]/60 flex flex-col items-center justify-center gap-3 text-sm text-[#64748B] dark:text-slate-400">
                <Loader2 className="w-6 h-6 animate-spin text-[#2563EB]" />
                <span>Retrieving original Course Outcomes PDF from backend...</span>
              </div>
            ) : pdfPreviewError ? (
              <div className="h-[620px] rounded-xl border border-red-200 dark:border-red-800 bg-red-50/60 dark:bg-red-950/20 p-8 flex flex-col items-center justify-center text-center gap-3">
                <AlertCircle className="w-8 h-8 text-[#B42318] dark:text-red-400" />
                <div className="text-base font-bold text-[#B42318] dark:text-red-300">
                  Original PDF Unavailable
                </div>
                <p className="text-sm text-[#B42318] dark:text-red-300/90 max-w-md">
                  {pdfPreviewError}
                </p>
                <button
                  type="button"
                  onClick={() =>
                    handleLoadPdfPreview(
                      selectedSubmission.id,
                      activeRevisionNumber ?? selectedSubmission.currentRevisionNumber
                    )
                  }
                  className="inline-flex items-center gap-2 px-4 py-2 text-xs font-semibold text-white bg-[#B42318] hover:bg-[#911B13] rounded-lg cursor-pointer"
                >
                  <RefreshCw className="w-3.5 h-3.5" />
                  Retry PDF Preview
                </button>
              </div>
            ) : pdfPreviewUrl ? (
              <iframe
                title={`Course Outcomes PDF Preview Revision ${activeRevisionNumber}`}
                src={pdfPreviewUrl}
                className="w-full h-[620px] rounded-xl border border-[#D9E2EF] dark:border-[#334155] bg-white"
              />
            ) : (
              <div className="h-[620px] rounded-xl border border-[#D9E2EF] dark:border-[#334155] bg-[#F5F7FB] dark:bg-[#0F172A]/60 flex items-center justify-center text-sm text-[#64748B] dark:text-slate-400">
                Click Preview PDF to load the document.
              </div>
            )}
          </section>

          {/* Right: COE Review, Dynamic CO Recording & Status Actions */}
          <section className="xl:col-span-5 bg-white dark:bg-[#1E293B] border border-[#D9E2EF] dark:border-[#334155] rounded-xl p-6 shadow-xs space-y-6">
            <div className="border-b border-[#D9E2EF] dark:border-[#334155] pb-3.5">
              <h2 className="text-[19px] font-bold text-[#1F2937] dark:text-slate-100">
                COE Review &amp; Course Outcome Records
              </h2>
              <p className="text-xs text-[#64748B] dark:text-slate-400 mt-0.5">
                Record CO statements manually from the PDF if needed. Stored separately from the original HOD document.
              </p>
            </div>

            {/* Dynamic Course Outcomes Statements */}
            <div className="space-y-3">
              <div className="flex items-center justify-between gap-2">
                <label className="text-sm font-bold text-[#1F2937] dark:text-slate-100">
                  Recorded Course Outcomes ({coStatements.length})
                </label>
                <button
                  type="button"
                  onClick={handleAddCoRow}
                  className="inline-flex items-center gap-1.5 px-3 py-1.5 text-xs font-semibold text-[#2563EB] dark:text-blue-400 bg-blue-50 dark:bg-blue-950/30 border border-blue-200 dark:border-blue-800 hover:bg-blue-100 dark:hover:bg-blue-950/50 rounded-lg cursor-pointer"
                >
                  <Plus className="w-3.5 h-3.5" />
                  Add Course Outcome
                </button>
              </div>

              {coStatements.length === 0 ? (
                <div className="p-4 rounded-xl border border-dashed border-[#D9E2EF] dark:border-[#334155] bg-[#F5F7FB]/50 dark:bg-[#0F172A]/40 text-xs text-[#64748B] dark:text-slate-400 text-center">
                  No Course Outcome statements recorded yet. Click{' '}
                  <strong>Add Course Outcome</strong> to transcribe CO1, CO2, CO3, etc., as displayed in the PDF.
                </div>
              ) : (
                <div className="space-y-3 max-h-[280px] overflow-y-auto pr-1">
                  {coStatements.map((co, idx) => (
                    <div
                      key={idx}
                      className="p-3 rounded-xl bg-[#F5F7FB] dark:bg-[#0F172A]/60 border border-[#D9E2EF] dark:border-[#334155] space-y-2"
                    >
                      <div className="flex items-center justify-between gap-2">
                        <input
                          type="text"
                          value={co.code}
                          onChange={(e) =>
                            handleUpdateCoRow(idx, 'code', e.target.value)
                          }
                          placeholder={`CO${idx + 1}`}
                          aria-label={`Course outcome code ${idx + 1}`}
                          className="w-24 px-2.5 py-1.5 text-xs font-mono font-bold rounded-lg border border-[#D9E2EF] dark:border-[#334155] bg-white dark:bg-[#1E293B] text-[#1F2937] dark:text-slate-100"
                        />
                        <button
                          type="button"
                          onClick={() => handleRemoveCoRow(idx)}
                          aria-label={`Remove ${co.code || `CO${idx + 1}`}`}
                          className="p-1.5 text-[#64748B] hover:text-[#B42318] dark:hover:text-red-400 rounded-md cursor-pointer"
                        >
                          <Trash2 className="w-4 h-4" />
                        </button>
                      </div>
                      <textarea
                        rows={2}
                        value={co.statement}
                        onChange={(e) =>
                          handleUpdateCoRow(idx, 'statement', e.target.value)
                        }
                        placeholder="Enter exact Course Outcome statement from the PDF..."
                        className="w-full px-3 py-2 text-xs rounded-lg border border-[#D9E2EF] dark:border-[#334155] bg-white dark:bg-[#1E293B] text-[#1F2937] dark:text-slate-100 placeholder:text-[#94A3B8]"
                      />
                    </div>
                  ))}
                </div>
              )}
            </div>

            {/* Internal Review Notes */}
            <div>
              <label
                htmlFor="co-internal-notes"
                className="block text-sm font-bold text-[#1F2937] dark:text-slate-100 mb-1.5"
              >
                Internal COE Review Notes
              </label>
              <textarea
                id="co-internal-notes"
                rows={3}
                value={internalNotes}
                onChange={(e) => setInternalNotes(e.target.value)}
                placeholder="Internal review observations for Examination Cell records..."
                className="w-full px-3.5 py-2.5 text-sm rounded-lg border border-[#D9E2EF] dark:border-[#334155] bg-[#F5F7FB] dark:bg-[#0F172A] text-[#1F2937] dark:text-slate-100"
              />
            </div>

            {/* Clarification Note */}
            <div>
              <label
                htmlFor="co-clarification-notes"
                className="block text-sm font-bold text-[#1F2937] dark:text-slate-100 mb-1.5"
              >
                Clarification Note to Submitting HOD
              </label>
              <textarea
                id="co-clarification-notes"
                rows={2}
                value={clarificationNotes}
                onChange={(e) => setClarificationNotes(e.target.value)}
                placeholder="Required when requesting clarification from the submitting HOD..."
                className="w-full px-3.5 py-2.5 text-sm rounded-lg border border-[#D9E2EF] dark:border-[#334155] bg-[#F5F7FB] dark:bg-[#0F172A] text-[#1F2937] dark:text-slate-100"
              />
            </div>

            {/* Review Workflow Action Buttons */}
            <div className="pt-3 border-t border-[#D9E2EF] dark:border-[#334155] flex flex-col gap-2.5">
              <button
                type="button"
                disabled={savingReview}
                onClick={() => handleSubmitReview('Reviewed')}
                className="w-full inline-flex items-center justify-center gap-2 px-4 py-2.5 text-sm font-semibold text-white bg-[#16834A] hover:bg-green-700 disabled:opacity-50 rounded-lg cursor-pointer"
              >
                <CheckCircle2 className="w-4 h-4" />
                {savingReview ? 'Saving Review...' : 'Mark as Reviewed'}
              </button>

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-2.5">
                <button
                  type="button"
                  disabled={savingReview}
                  onClick={() => handleSubmitReview('Under Review')}
                  className="inline-flex items-center justify-center gap-2 px-3.5 py-2.5 text-xs font-semibold text-[#1F2937] dark:text-slate-100 bg-[#F5F7FB] dark:bg-[#0F172A] hover:bg-slate-200 dark:hover:bg-slate-800 border border-[#D9E2EF] dark:border-[#334155] disabled:opacity-50 rounded-lg cursor-pointer"
                >
                  <Clock className="w-3.5 h-3.5" />
                  Save Notes (Under Review)
                </button>

                <button
                  type="button"
                  disabled={savingReview}
                  onClick={() => handleSubmitReview('Clarification Requested')}
                  className="inline-flex items-center justify-center gap-2 px-3.5 py-2.5 text-xs font-semibold text-white bg-[#B7791F] hover:bg-amber-700 disabled:opacity-50 rounded-lg cursor-pointer"
                >
                  <MessageSquareWarning className="w-3.5 h-3.5" />
                  Request Clarification
                </button>
              </div>
            </div>
          </section>
        </div>

        {/* Bottom Row: Document Revisions + Submission & Review History */}
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-7">
          {/* Document Revisions */}
          <section className="bg-white dark:bg-[#1E293B] border border-[#D9E2EF] dark:border-[#334155] rounded-xl p-6 shadow-xs space-y-4">
            <div className="flex items-center gap-2.5 border-b border-[#D9E2EF] dark:border-[#334155] pb-3.5">
              <FileText className="w-5 h-5 text-[#2563EB]" />
              <h2 className="text-[18px] font-bold text-[#1F2937] dark:text-slate-100">
                Document Revision History ({sortedRevisions.length})
              </h2>
            </div>

            {sortedRevisions.length === 0 ? (
              <div className="text-sm text-[#64748B] dark:text-slate-400 py-4">
                No revision records available.
              </div>
            ) : (
              <div className="space-y-3">
                {sortedRevisions.map((rev) => (
                  <div
                    key={rev.revisionNumber}
                    className={`p-4 rounded-xl border flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3 ${
                      rev.isLatest
                        ? 'border-[#2563EB] bg-blue-50/30 dark:bg-blue-950/20'
                        : 'border-[#D9E2EF] dark:border-[#334155] bg-[#F5F7FB]/50 dark:bg-[#0F172A]/40'
                    }`}
                  >
                    <div className="min-w-0">
                      <div className="flex flex-wrap items-center gap-2">
                        <span className="font-mono text-xs font-bold text-[#2563EB] dark:text-blue-400">
                          Revision {rev.revisionNumber}
                        </span>
                        {rev.isLatest && (
                          <span className="px-2 py-0.5 text-[11px] font-bold rounded bg-[#2563EB] text-white">
                            Latest
                          </span>
                        )}
                      </div>
                      <div className="text-sm font-bold text-[#1F2937] dark:text-slate-100 mt-1 truncate">
                        {rev.fileName}
                      </div>
                      <div className="text-xs text-[#64748B] dark:text-slate-400 mt-0.5">
                        Submitted by {rev.submittedByHod} &middot;{' '}
                        <span className="font-mono">{rev.submittedAt}</span> &middot;{' '}
                        {formatFileSize(rev.fileSizeBytes)}
                      </div>
                    </div>

                    <div className="flex items-center gap-2 shrink-0">
                      <button
                        type="button"
                        onClick={() =>
                          handleLoadPdfPreview(
                            selectedSubmission.id,
                            rev.revisionNumber
                          )
                        }
                        className="inline-flex items-center gap-1.5 px-3 py-1.5 text-xs font-semibold rounded-lg border border-[#D9E2EF] dark:border-[#334155] bg-white dark:bg-[#1E293B] text-[#1F2937] dark:text-slate-100 hover:border-[#2563EB] cursor-pointer"
                      >
                        <Eye className="w-3.5 h-3.5" />
                        Preview
                      </button>
                      <button
                        type="button"
                        disabled={downloadingRevision === rev.revisionNumber}
                        onClick={() =>
                          handleDownloadPdfRevision(
                            selectedSubmission,
                            rev.revisionNumber
                          )
                        }
                        className="inline-flex items-center gap-1.5 px-3 py-1.5 text-xs font-semibold rounded-lg bg-[#17243A] text-white hover:bg-slate-800 cursor-pointer disabled:opacity-50"
                      >
                        <Download className="w-3.5 h-3.5" />
                        Download
                      </button>
                    </div>
                  </div>
                ))}
              </div>
            )}
          </section>

          {/* Submission & Review History */}
          <section className="bg-white dark:bg-[#1E293B] border border-[#D9E2EF] dark:border-[#334155] rounded-xl p-6 shadow-xs space-y-4">
            <div className="flex items-center gap-2.5 border-b border-[#D9E2EF] dark:border-[#334155] pb-3.5">
              <History className="w-5 h-5 text-[#6D5CE8]" />
              <h2 className="text-[18px] font-bold text-[#1F2937] dark:text-slate-100">
                Submission &amp; Review History ({selectedSubmission.history.length})
              </h2>
            </div>

            {selectedSubmission.history.length === 0 ? (
              <div className="text-sm text-[#64748B] dark:text-slate-400 py-4">
                No historical events recorded for this submission yet.
              </div>
            ) : (
              <div className="space-y-3 max-h-[340px] overflow-y-auto pr-1">
                {selectedSubmission.history.map((ev) => (
                  <div
                    key={ev.id}
                    className="p-3.5 rounded-xl bg-[#F5F7FB]/60 dark:bg-[#0F172A]/50 border border-[#D9E2EF] dark:border-[#334155] space-y-1.5 text-sm"
                  >
                    <div className="flex flex-wrap items-center justify-between gap-2">
                      <span className="font-bold text-[#1F2937] dark:text-slate-100">
                        {ev.action}
                      </span>
                      <StatusIndicator
                        tone={getCourseOutcomeStatusTone(ev.statusAfter)}
                        label={ev.statusAfter}
                      />
                    </div>
                    <div className="text-xs text-[#64748B] dark:text-slate-400">
                      {ev.actorName} ({ev.actorRole}) &middot; Rev {ev.revisionNumber}{' '}
                      &middot; <span className="font-mono">{ev.timestamp}</span>
                    </div>
                    {ev.notes && (
                      <div className="text-xs text-[#1F2937] dark:text-slate-200 pt-1">
                        {ev.notes}
                      </div>
                    )}
                  </div>
                ))}
              </div>
            )}
          </section>
        </div>
      </div>
    );
  }

  // ==========================================================================
  // SUBMISSIONS LIST VIEW
  // ==========================================================================
  return (
    <div className="space-y-7">
      {/* Main Page Header */}
      <div className="bg-white dark:bg-[#1E293B] border border-[#D9E2EF] dark:border-[#334155] rounded-xl p-6 sm:p-7 shadow-xs flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
        <div>
          <h1 className="text-[26px] sm:text-[28px] font-bold text-[#1F2937] dark:text-slate-100 leading-tight flex items-center gap-3">
            <BookOpenCheck className="w-7 h-7 text-[#2563EB]" />
            Course Outcomes Management
          </h1>
          <p className="text-[15px] text-[#64748B] dark:text-slate-400 mt-1.5 leading-relaxed">
            Review HOD-submitted Course Outcomes PDFs across all departments and semesters (1st–8th Semester), inspect document revisions, and record COE verification remarks.
          </p>
        </div>

        <button
          type="button"
          disabled={loading}
          onClick={loadSubmissions}
          className="inline-flex items-center gap-2 px-4 py-2.5 text-sm font-semibold text-white bg-[#2563EB] hover:bg-blue-700 disabled:opacity-50 rounded-lg shrink-0 cursor-pointer"
        >
          <RefreshCw className={`w-4 h-4 ${loading ? 'animate-spin' : ''}`} />
          {loading ? 'Refreshing...' : 'Refresh Submissions'}
        </button>
      </div>

      {/* Filters Panel */}
      <div className="bg-white dark:bg-[#1E293B] border border-[#D9E2EF] dark:border-[#334155] rounded-xl p-5 shadow-xs space-y-4">
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-6 gap-4">
          {/* Department */}
          <div>
            <label
              htmlFor="co-filter-department"
              className="block text-xs font-semibold uppercase tracking-wide text-[#64748B] dark:text-slate-400 mb-1.5"
            >
              Department
            </label>
            <select
              id="co-filter-department"
              value={departmentFilter}
              onChange={(e) => setDepartmentFilter(e.target.value)}
              className="w-full px-3 py-2.5 text-sm rounded-lg border border-[#D9E2EF] dark:border-[#334155] bg-[#F5F7FB] dark:bg-[#0F172A] text-[#1F2937] dark:text-slate-100"
            >
              <option value="ALL">All Departments</option>
              {departmentOptions.map((dept) => (
                <option key={dept.code} value={dept.code}>
                  {dept.label}
                </option>
              ))}
            </select>
          </div>

          {/* Semester (Strictly all 1st–8th Semesters in ascending order) */}
          <div>
            <label
              htmlFor="co-filter-semester"
              className="block text-xs font-semibold uppercase tracking-wide text-[#64748B] dark:text-slate-400 mb-1.5"
            >
              Semester
            </label>
            <select
              id="co-filter-semester"
              value={semesterFilter}
              onChange={(e) => setSemesterFilter(e.target.value)}
              className="w-full px-3 py-2.5 text-sm rounded-lg border border-[#D9E2EF] dark:border-[#334155] bg-[#F5F7FB] dark:bg-[#0F172A] text-[#1F2937] dark:text-slate-100"
            >
              <option value="ALL">All Semesters (1st–8th)</option>
              {semesters.map((sem) => (
                <option key={sem.semesterNumber} value={sem.semesterNumber}>
                  {sem.label}
                </option>
              ))}
            </select>
          </div>

          {/* Subject Search */}
          <div>
            <label
              htmlFor="co-filter-subject"
              className="block text-xs font-semibold uppercase tracking-wide text-[#64748B] dark:text-slate-400 mb-1.5"
            >
              Subject / HOD
            </label>
            <div className="relative">
              <Search className="w-4 h-4 text-[#64748B] absolute left-3 top-1/2 -translate-y-1/2" />
              <input
                id="co-filter-subject"
                type="text"
                value={subjectSearch}
                onChange={(e) => setSubjectSearch(e.target.value)}
                placeholder="Subject code or name..."
                className="w-full pl-9 pr-3 py-2.5 text-sm rounded-lg border border-[#D9E2EF] dark:border-[#334155] bg-[#F5F7FB] dark:bg-[#0F172A] text-[#1F2937] dark:text-slate-100"
              />
            </div>
          </div>

          {/* Submission Status */}
          <div>
            <label
              htmlFor="co-filter-status"
              className="block text-xs font-semibold uppercase tracking-wide text-[#64748B] dark:text-slate-400 mb-1.5"
            >
              Submission Status
            </label>
            <select
              id="co-filter-status"
              value={statusFilter}
              onChange={(e) => setStatusFilter(e.target.value)}
              className="w-full px-3 py-2.5 text-sm rounded-lg border border-[#D9E2EF] dark:border-[#334155] bg-[#F5F7FB] dark:bg-[#0F172A] text-[#1F2937] dark:text-slate-100"
            >
              <option value="ALL">All Statuses</option>
              <option value="Received">Received</option>
              <option value="Under Review">Under Review</option>
              <option value="Reviewed">Reviewed</option>
              <option value="Clarification Requested">Clarification Requested</option>
            </select>
          </div>

          {/* Submission Date From */}
          <div>
            <label
              htmlFor="co-filter-from-date"
              className="block text-xs font-semibold uppercase tracking-wide text-[#64748B] dark:text-slate-400 mb-1.5"
            >
              Submitted From
            </label>
            <input
              id="co-filter-from-date"
              type="date"
              value={fromDate}
              onChange={(e) => setFromDate(e.target.value)}
              className="w-full px-3 py-2.5 text-sm rounded-lg border border-[#D9E2EF] dark:border-[#334155] bg-[#F5F7FB] dark:bg-[#0F172A] text-[#1F2937] dark:text-slate-100"
            />
          </div>

          {/* Submission Date To */}
          <div>
            <label
              htmlFor="co-filter-to-date"
              className="block text-xs font-semibold uppercase tracking-wide text-[#64748B] dark:text-slate-400 mb-1.5"
            >
              Submitted To
            </label>
            <div className="flex items-center gap-2">
              <input
                id="co-filter-to-date"
                type="date"
                value={toDate}
                onChange={(e) => setToDate(e.target.value)}
                className="w-full px-3 py-2.5 text-sm rounded-lg border border-[#D9E2EF] dark:border-[#334155] bg-[#F5F7FB] dark:bg-[#0F172A] text-[#1F2937] dark:text-slate-100"
              />
              {hasActiveFilters && (
                <button
                  type="button"
                  onClick={resetFilters}
                  className="px-2.5 py-2.5 text-xs font-semibold text-[#64748B] hover:text-[#1F2937] dark:text-slate-400 dark:hover:text-white border border-[#D9E2EF] dark:border-[#334155] rounded-lg cursor-pointer shrink-0"
                >
                  Clear
                </button>
              )}
            </div>
          </div>
        </div>
      </div>

      {/* Backend Error Banner (Non-destructive) */}
      {loadError && (
        <div
          role="alert"
          className="p-4 sm:p-5 rounded-xl bg-amber-50 dark:bg-amber-950/30 border border-amber-200 dark:border-amber-800 flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4"
        >
          <div className="flex items-start gap-3">
            <AlertCircle className="w-5 h-5 text-[#B7791F] dark:text-amber-400 shrink-0 mt-0.5" />
            <div>
              <div className="text-sm font-bold text-[#B7791F] dark:text-amber-300">
                Course Outcomes Backend Service Unavailable
              </div>
              <div className="text-sm text-[#B7791F] dark:text-amber-300/90 mt-0.5">
                {loadError}
              </div>
            </div>
          </div>
          <button
            type="button"
            disabled={loading}
            onClick={loadSubmissions}
            className="inline-flex items-center gap-2 px-4 py-2 text-xs font-semibold text-white bg-[#B7791F] hover:bg-amber-700 disabled:opacity-50 rounded-lg shrink-0 cursor-pointer"
          >
            <RefreshCw className={`w-3.5 h-3.5 ${loading ? 'animate-spin' : ''}`} />
            Retry
          </button>
        </div>
      )}

      {/* Course Outcomes Submissions Table */}
      <div className="bg-white dark:bg-[#1E293B] border border-[#D9E2EF] dark:border-[#334155] rounded-xl shadow-xs overflow-hidden">
        {loading ? (
          <div className="py-14 text-center flex flex-col items-center gap-3 text-sm text-[#64748B] dark:text-slate-400">
            <Loader2 className="w-6 h-6 animate-spin text-[#2563EB]" />
            <span>Loading HOD Course Outcomes submissions from backend...</span>
          </div>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="bg-[#F5F7FB] dark:bg-[#0F172A]/60 border-b border-[#D9E2EF] dark:border-[#334155] text-xs font-bold text-[#64748B] dark:text-slate-400 uppercase tracking-wider">
                  <th className="py-4 px-5">Department</th>
                  <th className="py-4 px-5">Semester</th>
                  <th className="py-4 px-5">Subject</th>
                  <th className="py-4 px-5">Submitted On</th>
                  <th className="py-4 px-5">Revision</th>
                  <th className="py-4 px-5">Status</th>
                  <th className="py-4 px-5 text-right">Action</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-[#D9E2EF] dark:divide-[#334155] text-sm">
                {filteredSubmissions.map((sub) => (
                  <tr
                    key={sub.id}
                    className="hover:bg-[#F5F7FB]/60 dark:hover:bg-slate-800/50"
                  >
                    <td className="py-4 px-5 font-bold text-[#1F2937] dark:text-slate-100 whitespace-nowrap">
                      {sub.department}
                    </td>
                    <td className="py-4 px-5 font-medium text-[#1F2937] dark:text-slate-200 whitespace-nowrap">
                      {formatSemesterLabel(sub.semester)}
                    </td>
                    <td className="py-4 px-5">
                      <div className="font-bold text-[#1F2937] dark:text-slate-100">
                        {sub.subjectName}
                      </div>
                      <div className="text-xs text-[#64748B] dark:text-slate-400 mt-0.5">
                        {sub.subjectCode ? (
                          <span className="font-mono font-semibold">
                            {sub.subjectCode}
                          </span>
                        ) : null}
                        {sub.subjectCode ? ' · ' : ''}HOD: {sub.submittedByHod}
                      </div>
                    </td>
                    <td className="py-4 px-5 font-mono text-[13px] text-[#64748B] dark:text-slate-300 whitespace-nowrap">
                      {sub.submittedAt}
                    </td>
                    <td className="py-4 px-5 font-mono font-semibold text-[#2563EB] dark:text-blue-400 whitespace-nowrap">
                      Rev {sub.currentRevisionNumber}
                    </td>
                    <td className="py-4 px-5 whitespace-nowrap">
                      <StatusIndicator
                        tone={getCourseOutcomeStatusTone(sub.status)}
                        label={sub.status}
                      />
                    </td>
                    <td className="py-4 px-5 text-right whitespace-nowrap">
                      <button
                        type="button"
                        onClick={() => handleOpenSubmission(sub)}
                        className="inline-flex items-center gap-1.5 px-3.5 py-2 text-xs font-semibold text-white bg-[#2563EB] hover:bg-blue-700 rounded-lg cursor-pointer"
                      >
                        <Eye className="w-3.5 h-3.5" />
                        View
                      </button>
                    </td>
                  </tr>
                ))}

                {filteredSubmissions.length === 0 && (
                  <tr>
                    <td colSpan={7} className="py-12 px-6 text-center">
                      <div className="text-base font-bold text-[#1F2937] dark:text-slate-100">
                        {semesterFilter !== 'ALL'
                          ? `No Course Outcomes submissions found for ${formatSemesterLabel(
                              Number(semesterFilter)
                            )}.`
                          : submissions.length === 0
                            ? 'No Course Outcomes Submissions Found'
                            : 'No Submissions Match Active Filters'}
                      </div>
                      <p className="text-sm text-[#64748B] dark:text-slate-400 mt-1 max-w-lg mx-auto">
                        {submissions.length === 0
                          ? 'HOD-submitted Course Outcomes PDFs will appear here once uploaded and stored by the Central Java Backend.'
                          : 'Try clearing or adjusting the selected department, semester, status, or date range filters.'}
                      </p>
                    </td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </div>
  );
};
