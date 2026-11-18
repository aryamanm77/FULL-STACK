import React, { useEffect } from 'react';
import { Navigate, useNavigate } from 'react-router-dom';
import { ArrowLeft, CheckCircle2, Lock, ShieldCheck } from 'lucide-react';
import { InstitutionHeader } from '../../components/layout/InstitutionHeader';
import { useExamSession } from '../../hooks/useExamSession';
import { MIT_MYSORE_CAMPUS_BG_URL } from '../../assets/brandAssets';

/**
 * Post-Submission Confirmation Screen (/student/completion)
 * Displays clean "Test Submitted" confirmation screen with official submission metadata
 * and a Back button that returns cleanly to the Student Login screen.
 * No invigilator password prompt.
 */
export const ExamCompletionPage: React.FC = () => {
  const navigate = useNavigate();
  const {
    student,
    examSession,
    submitted,
    submissionReceipt,
    logoutStudent,
  } = useExamSession();

  // Prevent browser Back-button navigation into /exam or /instructions
  useEffect(() => {
    if (typeof window === 'undefined') return;
    window.history.pushState({ examSubmittedLocked: true }, '', window.location.href);
    const handlePopState = () => {
      window.history.pushState({ examSubmittedLocked: true }, '', window.location.href);
    };
    window.addEventListener('popstate', handlePopState);
    return () => {
      window.removeEventListener('popstate', handlePopState);
    };
  }, []);

  const handleReturnToLogin = () => {
    logoutStudent();
    navigate('/student/login', { replace: true });
  };

  if (!student || !examSession) {
    return <Navigate to="/student/login" replace />;
  }

  if (!submitted && examSession.availabilityState !== 'COMPLETED') {
    return <Navigate to="/student/examination" replace />;
  }

  return (
    <div className="relative min-h-[100dvh] bg-[#F7F9FC] flex flex-col justify-between font-sans text-[#243247] overflow-x-hidden">
      {/* Background Campus Image Layer */}
      <div
        className="fixed inset-0 z-0 bg-cover bg-center bg-no-repeat pointer-events-none"
        style={{ backgroundImage: `url(${MIT_MYSORE_CAMPUS_BG_URL})` }}
        aria-hidden="true"
      >
        <div className="absolute inset-0 bg-gradient-to-b from-white/72 via-white/58 to-white/72" />
      </div>

      {/* Standard Shared Institutional Header */}
      <div className="relative z-10">
        <InstitutionHeader
          rightSlot={
            <div className="flex items-center gap-2.5 text-xs sm:text-sm font-semibold text-[#16865B] bg-emerald-50 px-3.5 sm:px-4 py-2 sm:py-2.5 rounded-[8px] border border-emerald-200 shadow-xs">
              <ShieldCheck className="w-4 h-4 sm:w-5 sm:h-5 text-[#16865B]" />
              <span>Responses Locked on Lab Server</span>
            </div>
          }
        />
      </div>

      {/* Main Completion Card */}
      <main className="relative z-10 flex-1 max-w-[1240px] w-full mx-auto px-4 sm:px-6 py-6 sm:py-8 flex items-center justify-center">
        <div className="max-w-[620px] w-full bg-white border border-[#DCE3EC] rounded-[10px] p-4 sm:p-6 md:p-8 space-y-5 sm:space-y-6 institutional-card-shadow">
          {/* Success Header */}
          <div className="flex flex-col items-center text-center space-y-3 pb-4 border-b border-[#DCE3EC]">
            <div className="w-12 h-12 rounded-[6px] bg-emerald-50 border border-emerald-200 text-[#16865B] flex items-center justify-center">
              <CheckCircle2 className="w-7 h-7" />
            </div>
            <h1 className="text-[23px] font-bold text-[#102A43] tracking-tight">
              Test Submitted
            </h1>
            <p className="text-sm text-[#64748B] max-w-lg">
              Your examination responses have been successfully recorded and finalized.
            </p>
          </div>

          {/* Official Submission Confirmation Details (No Marks or Answer Keys) */}
          <div className="border border-[#DCE3EC] rounded-[6px] divide-y divide-[#DCE3EC] text-sm overflow-hidden">
            <div className="flex items-center justify-between px-4 py-3 bg-[#F7F9FC]">
              <span className="text-[#64748B] font-medium">
                Submission Confirmation Reference
              </span>
              <span className="font-mono font-bold text-[#102A43]">
                {submissionReceipt?.confirmationReference ||
                  `MITM-SUB-2026-${student.usn}`}
              </span>
            </div>

            <div className="flex items-center justify-between px-4 py-3">
              <span className="text-[#64748B]">Student USN</span>
              <span className="font-mono font-bold text-[#102A43]">
                {student.usn}
              </span>
            </div>

            <div className="flex items-center justify-between px-4 py-3">
              <span className="text-[#64748B]">Candidate Name</span>
              <span className="font-semibold text-[#102A43]">
                {student.fullName}
              </span>
            </div>

            <div className="flex items-center justify-between px-4 py-3">
              <span className="text-[#64748B]">Subject Name</span>
              <span className="font-semibold text-[#102A43] text-right">
                {examSession.subjectCode} – {examSession.subjectName}
              </span>
            </div>

            <div className="flex items-center justify-between px-4 py-3">
              <span className="text-[#64748B]">Examination Session</span>
              <span className="font-medium text-[#243247] text-right">
                {examSession.examinationType}
                {examSession.sessionSlot ? ` (${examSession.sessionSlot})` : ''}
              </span>
            </div>

            <div className="flex items-center justify-between px-4 py-3">
              <span className="text-[#64748B]">Submission Timestamp</span>
              <span className="font-mono tabular-nums font-medium text-[#243247]">
                {(() => {
                  const raw = submissionReceipt?.submittedAt;
                  if (!raw) return new Date().toLocaleString('en-IN');
                  const parsed = new Date(raw);
                  return Number.isNaN(parsed.getTime())
                    ? raw
                    : parsed.toLocaleString('en-IN', {
                        day: '2-digit',
                        month: 'short',
                        year: 'numeric',
                        hour: '2-digit',
                        minute: '2-digit',
                        second: '2-digit',
                        hour12: true,
                      });
                })()}
              </span>
            </div>

            {submissionReceipt && (
              <div className="flex items-center justify-between px-4 py-3">
                <span className="text-[#64748B]">Submission Mode</span>
                <span className="font-medium text-[#16865B]">
                  {submissionReceipt.submissionTrigger === 'AUTO_TIMER_EXPIRED'
                    ? 'Automatic Submission (Lab Server Timer Expired)'
                    : 'Candidate Confirmed Final Submission'}
                </span>
              </div>
            )}
          </div>

          <div className="p-3.5 rounded-[6px] bg-[#F7F9FC] border border-[#DCE3EC] text-xs text-[#64748B] leading-relaxed">
            In accordance with examination regulations, your submission has been permanently recorded on the server. Re-entry and retakes are blocked.
          </div>

          {/* Clean Return to Login Action Button */}
          <div className="pt-2">
            <button
              type="button"
              onClick={handleReturnToLogin}
              className="w-full h-[46px] rounded-[6px] bg-[#2463B5] hover:bg-[#194F96] text-white font-bold text-sm tracking-wide transition-colors duration-150 flex items-center justify-center gap-2 cursor-pointer shadow-sm focus:outline-none focus:ring-2 focus:ring-[#2463B5]"
            >
              <ArrowLeft className="w-4 h-4" />
              <span>Back to Login</span>
            </button>
          </div>
        </div>
      </main>

      <footer className="relative z-10 bg-white border-t border-[#DCE3EC] px-6 py-3.5 text-xs text-[#64748B]">
        <div className="max-w-[1240px] mx-auto flex flex-wrap items-center justify-between gap-2">
          <span>Maharaja Institute of Technology Mysore</span>
          <span>MIT Mysore Student Examination Portal</span>
        </div>
      </footer>
    </div>
  );
};
