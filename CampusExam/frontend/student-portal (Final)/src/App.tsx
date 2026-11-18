/**
 * @license
 * SPDX-License-Identifier: Apache-2.0
 */

import {
  BrowserRouter,
  Navigate,
  Route,
  Routes,
} from 'react-router-dom';
import { ExamSessionProvider } from './hooks/useExamSession';
import {
  PostSubmissionRouteGuard,
  StudentSessionLoader,
} from './layouts/StudentRouteGuard';
import { StudentLoginPage } from './pages/login/StudentLoginPage';
import { ExamInstructionsPage } from './pages/instructions/ExamInstructionsPage';
import { ExaminationInterfacePage } from './pages/examination/ExaminationInterfacePage';
import { ExamSubmissionPage } from './pages/submission/ExamSubmissionPage';
import { ExamCompletionPage } from './pages/submission/ExamCompletionPage';

export default function App() {
  return (
    <BrowserRouter>
      <ExamSessionProvider>
        <StudentSessionLoader>
          <Routes>
            <Route
              path="/"
              element={
                <PostSubmissionRouteGuard>
                  <Navigate to="/student/login" replace />
                </PostSubmissionRouteGuard>
              }
            />
            <Route
              path="/login"
              element={
                <PostSubmissionRouteGuard>
                  <Navigate to="/student/login" replace />
                </PostSubmissionRouteGuard>
              }
            />
            <Route
              path="/student/login"
              element={
                <PostSubmissionRouteGuard>
                  <StudentLoginPage />
                </PostSubmissionRouteGuard>
              }
            />
            <Route
              path="/instructor/login"
              element={
                <PostSubmissionRouteGuard>
                  <Navigate to="/student/login" replace />
                </PostSubmissionRouteGuard>
              }
            />
            <Route
              path="/instructor"
              element={
                <PostSubmissionRouteGuard>
                  <Navigate to="/student/login" replace />
                </PostSubmissionRouteGuard>
              }
            />
            <Route
              path="/instructions"
              element={
                <PostSubmissionRouteGuard>
                  <Navigate to="/student/instructions" replace />
                </PostSubmissionRouteGuard>
              }
            />
            <Route
              path="/student/instructions"
              element={
                <PostSubmissionRouteGuard>
                  <ExamInstructionsPage />
                </PostSubmissionRouteGuard>
              }
            />
            <Route
              path="/exam"
              element={
                <PostSubmissionRouteGuard>
                  <Navigate to="/student/examination" replace />
                </PostSubmissionRouteGuard>
              }
            />
            <Route
              path="/student/examination"
              element={
                <PostSubmissionRouteGuard>
                  <ExaminationInterfacePage />
                </PostSubmissionRouteGuard>
              }
            />
            <Route
              path="/student/submission"
              element={
                <PostSubmissionRouteGuard>
                  <ExamSubmissionPage />
                </PostSubmissionRouteGuard>
              }
            />
            <Route
              path="/student/completion"
              element={<ExamCompletionPage />}
            />
            <Route
              path="/recovery/dashboard"
              element={
                <PostSubmissionRouteGuard>
                  <Navigate to="/student/login" replace />
                </PostSubmissionRouteGuard>
              }
            />
            <Route
              path="/recovery"
              element={
                <PostSubmissionRouteGuard>
                  <Navigate to="/student/login" replace />
                </PostSubmissionRouteGuard>
              }
            />
            <Route
              path="*"
              element={
                <PostSubmissionRouteGuard>
                  <Navigate to="/student/login" replace />
                </PostSubmissionRouteGuard>
              }
            />
          </Routes>
        </StudentSessionLoader>
      </ExamSessionProvider>
    </BrowserRouter>
  );
}
