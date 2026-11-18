import React from 'react';
import { Navigate, useLocation } from 'react-router-dom';
import { Loader2 } from 'lucide-react';
import { useExamSession } from '../hooks/useExamSession';
import { MitLogoBrand } from '../components/MitLogoBrand';
import { securityService } from '../services/securityService';

export const StudentSessionLoader: React.FC<{ children: React.ReactNode }> = ({
  children,
}) => {
  const { isInitializing, submitted, examSession } = useExamSession();
  const location = useLocation();

  if (isInitializing) {
    return (
      <div className="min-h-[100dvh] bg-[#F7F9FC] flex flex-col items-center justify-center p-6 font-sans">
        <div className="bg-white border border-[#DCE3EC] rounded-[10px] p-8 max-w-md w-full flex flex-col items-center text-center space-y-4 institutional-card-shadow">
          <MitLogoBrand size="md" showPortalSubheading={true} />
          <div className="flex items-center gap-2.5 text-sm font-medium text-[#102A43] pt-2">
            <Loader2 className="w-4 h-4 animate-spin text-[#2463B5]" />
            <span>Verifying workstation session with Local Lab Server...</span>
          </div>
        </div>
      </div>
    );
  }

  // Global post-submission route guard: keep candidate on /student/completion while in completed state
  const isLockedSubmitted =
    submitted || examSession?.availabilityState === 'COMPLETED';
  if (isLockedSubmitted && location.pathname !== '/student/completion' && location.pathname !== '/student/login') {
    return <Navigate to="/student/completion" replace />;
  }

  return <>{children}</>;
};

export const PostSubmissionRouteGuard: React.FC<{
  children: React.ReactNode;
}> = ({ children }) => {
  const { submitted, examSession } = useExamSession();
  if (submitted || examSession?.availabilityState === 'COMPLETED') {
    return <Navigate to="/student/completion" replace />;
  }
  return <>{children}</>;
};
