import React, { useState } from 'react';
import { useSearchParams } from 'react-router-dom';
import {
  AlertCircle,
  CheckCircle2,
  Eye,
  EyeOff,
  KeyRound,
  Moon,
  Sun,
} from 'lucide-react';
import { useExaminationStore } from '../hooks/useExaminationStore';
import { authenticationService } from '../services/authenticationService';

export type SettingsSectionId = 'change-password' | 'appearance';

export const SettingsPage: React.FC = () => {
  const [searchParams] = useSearchParams();
  const { theme, setTheme, refreshAll, notify } = useExaminationStore();

  const rawSection = searchParams.get('section');
  const activeSection: SettingsSectionId =
    rawSection === 'appearance' ? 'appearance' : 'change-password';

  // Section A: Change Password State
  const [currentPassword, setCurrentPassword] = useState('');
  const [newPassword, setNewPassword] = useState('');
  const [confirmNewPassword, setConfirmNewPassword] = useState('');

  const [showCurrent, setShowCurrent] = useState(false);
  const [showNew, setShowNew] = useState(false);
  const [showConfirm, setShowConfirm] = useState(false);

  const [submitting, setSubmitting] = useState(false);
  const [statusMessage, setStatusMessage] = useState<{
    type: 'success' | 'error';
    text: string;
  } | null>(null);

  const handleUpdatePassword = async (e: React.FormEvent) => {
    e.preventDefault();
    setStatusMessage(null);

    if (!currentPassword || !newPassword || !confirmNewPassword) {
      setStatusMessage({
        type: 'error',
        text: 'All password fields are required.',
      });
      return;
    }

    if (newPassword.length < 8) {
      setStatusMessage({
        type: 'error',
        text: 'New password must be at least 8 characters long.',
      });
      return;
    }

    if (newPassword !== confirmNewPassword) {
      setStatusMessage({
        type: 'error',
        text: 'New password and confirmation password do not match.',
      });
      return;
    }

    setSubmitting(true);
    try {
      const res = await authenticationService.changePassword(
        currentPassword,
        newPassword,
        confirmNewPassword
      );
      await refreshAll();
      setCurrentPassword('');
      setNewPassword('');
      setConfirmNewPassword('');
      setStatusMessage({
        type: 'success',
        text: res.message,
      });
      notify('success', 'Password Updated', res.message);
    } catch (err) {
      const msg =
        err instanceof Error ? err.message : 'Unable to update COE password.';
      setStatusMessage({
        type: 'error',
        text: msg,
      });
      notify('error', 'Password Update Failed', msg);
    } finally {
      setSubmitting(false);
    }
  };

  return (
    <div className="max-w-4xl space-y-7">
      {/* Main Page Heading (26–28px) */}
      <div className="bg-white dark:bg-[#1E293B] border border-[#D9E2EF] dark:border-[#334155] rounded-xl p-6 sm:p-7 shadow-xs">
        <h1 className="text-[26px] sm:text-[28px] font-bold text-[#1F2937] dark:text-slate-100 leading-tight">
          COE Portal Settings
        </h1>
        <p className="text-[15px] text-[#64748B] dark:text-slate-400 mt-1.5 leading-relaxed">
          Manage your Controller of Examinations account password and portal appearance preferences.
        </p>
      </div>

      {/* SECTION A: Change Password */}
      {activeSection === 'change-password' && (
        <div className="bg-white dark:bg-[#1E293B] border border-[#D9E2EF] dark:border-[#334155] rounded-xl p-6 sm:p-7 shadow-xs space-y-6">
          <div className="flex items-center gap-3 border-b border-[#D9E2EF] dark:border-[#334155] pb-5">
            <KeyRound className="w-6 h-6 text-[#2563EB] dark:text-blue-400" />
            <div>
              <h2 className="text-[20px] font-bold text-[#1F2937] dark:text-slate-100">
                Change Password
              </h2>
              <p className="text-sm text-[#64748B] dark:text-slate-400 mt-0.5">
                Update your COE authentication credentials.
              </p>
            </div>
          </div>

          {statusMessage && (
            <div
              className={`p-4 rounded-xl border flex items-start gap-3 text-sm ${
                statusMessage.type === 'success'
                  ? 'bg-emerald-50 dark:bg-emerald-950/30 border-emerald-200 dark:border-emerald-800 text-[#16834A] dark:text-emerald-300'
                  : 'bg-red-50 dark:bg-red-950/30 border-red-200 dark:border-red-800 text-[#B42318] dark:text-red-300'
              }`}
            >
              {statusMessage.type === 'success' ? (
                <CheckCircle2 className="w-5 h-5 shrink-0 mt-0.5" />
              ) : (
                <AlertCircle className="w-5 h-5 shrink-0 mt-0.5" />
              )}
              <span className="font-medium leading-relaxed">{statusMessage.text}</span>
            </div>
          )}

          <form onSubmit={handleUpdatePassword} className="space-y-5">
            <div>
              <label className="block text-sm font-semibold text-[#1F2937] dark:text-slate-200 mb-2">
                Current Password
              </label>
              <div className="relative">
                <input
                  type={showCurrent ? 'text' : 'password'}
                  value={currentPassword}
                  onChange={(e) => setCurrentPassword(e.target.value)}
                  placeholder="Enter current password"
                  className="w-full px-4 py-3 pr-11 text-sm rounded-lg border border-[#D9E2EF] dark:border-[#334155] bg-[#F5F7FB] dark:bg-[#0F172A] text-[#1F2937] dark:text-slate-100"
                />
                <button
                  type="button"
                  onClick={() => setShowCurrent((prev) => !prev)}
                  className="absolute right-3.5 top-1/2 -translate-y-1/2 text-[#64748B] hover:text-[#1F2937] dark:hover:text-slate-200 cursor-pointer"
                  aria-label="Toggle current password visibility"
                >
                  {showCurrent ? (
                    <EyeOff className="w-4 h-4" />
                  ) : (
                    <Eye className="w-4 h-4" />
                  )}
                </button>
              </div>
            </div>

            <div>
              <label className="block text-sm font-semibold text-[#1F2937] dark:text-slate-200 mb-2">
                New Password
              </label>
              <div className="relative">
                <input
                  type={showNew ? 'text' : 'password'}
                  value={newPassword}
                  onChange={(e) => setNewPassword(e.target.value)}
                  placeholder="Enter new password (minimum 8 characters, letters & numbers)"
                  className="w-full px-4 py-3 pr-11 text-sm rounded-lg border border-[#D9E2EF] dark:border-[#334155] bg-[#F5F7FB] dark:bg-[#0F172A] text-[#1F2937] dark:text-slate-100"
                />
                <button
                  type="button"
                  onClick={() => setShowNew((prev) => !prev)}
                  className="absolute right-3.5 top-1/2 -translate-y-1/2 text-[#64748B] hover:text-[#1F2937] dark:hover:text-slate-200 cursor-pointer"
                  aria-label="Toggle new password visibility"
                >
                  {showNew ? (
                    <EyeOff className="w-4 h-4" />
                  ) : (
                    <Eye className="w-4 h-4" />
                  )}
                </button>
              </div>
            </div>

            <div>
              <label className="block text-sm font-semibold text-[#1F2937] dark:text-slate-200 mb-2">
                Confirm New Password
              </label>
              <div className="relative">
                <input
                  type={showConfirm ? 'text' : 'password'}
                  value={confirmNewPassword}
                  onChange={(e) => setConfirmNewPassword(e.target.value)}
                  placeholder="Re-enter new password"
                  className="w-full px-4 py-3 pr-11 text-sm rounded-lg border border-[#D9E2EF] dark:border-[#334155] bg-[#F5F7FB] dark:bg-[#0F172A] text-[#1F2937] dark:text-slate-100"
                />
                <button
                  type="button"
                  onClick={() => setShowConfirm((prev) => !prev)}
                  className="absolute right-3.5 top-1/2 -translate-y-1/2 text-[#64748B] hover:text-[#1F2937] dark:hover:text-slate-200 cursor-pointer"
                  aria-label="Toggle confirm password visibility"
                >
                  {showConfirm ? (
                    <EyeOff className="w-4 h-4" />
                  ) : (
                    <Eye className="w-4 h-4" />
                  )}
                </button>
              </div>
            </div>

            <div className="pt-2">
              <button
                type="submit"
                disabled={submitting}
                className="px-6 py-3 text-sm font-semibold text-white bg-[#2563EB] hover:bg-blue-700 disabled:opacity-50 rounded-lg shadow-xs transition-colors cursor-pointer"
              >
                {submitting ? 'Updating Password...' : 'Update Password'}
              </button>
            </div>
          </form>
        </div>
      )}

      {/* SECTION B: Appearance */}
      {activeSection === 'appearance' && (
        <div className="bg-white dark:bg-[#1E293B] border border-[#D9E2EF] dark:border-[#334155] rounded-xl p-6 sm:p-7 shadow-xs space-y-6">
          <div className="border-b border-[#D9E2EF] dark:border-[#334155] pb-5">
            <h2 className="text-[20px] font-bold text-[#1F2937] dark:text-slate-100">
              Appearance
            </h2>
            <p className="text-sm text-[#64748B] dark:text-slate-400 mt-1">
              Choose Light Mode or Dark Mode for the COE Portal.
            </p>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-5">
            <button
              type="button"
              onClick={() => setTheme('light')}
              className={`p-5 rounded-xl border text-left transition-all cursor-pointer flex items-center justify-between ${
                theme === 'light'
                  ? 'border-[#2563EB] bg-blue-50/60 dark:bg-blue-950/30 ring-1 ring-[#2563EB]'
                  : 'border-[#D9E2EF] dark:border-[#334155] bg-[#F5F7FB] dark:bg-[#0F172A] hover:border-slate-400'
              }`}
            >
              <div className="flex items-center gap-3.5">
                <div className="w-11 h-11 rounded-lg bg-white border border-[#D9E2EF] flex items-center justify-center text-amber-500 shrink-0">
                  <Sun className="w-5 h-5" />
                </div>
                <div>
                  <div className="text-base font-bold text-[#1F2937] dark:text-slate-100">
                    Light Mode
                  </div>
                  <div className="text-[13px] text-[#64748B] dark:text-slate-400 mt-0.5">
                    Standard institutional daylight interface
                  </div>
                </div>
              </div>
              {theme === 'light' && (
                <CheckCircle2 className="w-5 h-5 text-[#2563EB] shrink-0" />
              )}
            </button>

            <button
              type="button"
              onClick={() => setTheme('dark')}
              className={`p-5 rounded-xl border text-left transition-all cursor-pointer flex items-center justify-between ${
                theme === 'dark'
                  ? 'border-[#2563EB] bg-blue-50/60 dark:bg-blue-950/30 ring-1 ring-[#2563EB]'
                  : 'border-[#D9E2EF] dark:border-[#334155] bg-[#F5F7FB] dark:bg-[#0F172A] hover:border-slate-400'
              }`}
            >
              <div className="flex items-center gap-3.5">
                <div className="w-11 h-11 rounded-lg bg-[#0F172A] border border-slate-700 flex items-center justify-center text-blue-400 shrink-0">
                  <Moon className="w-5 h-5" />
                </div>
                <div>
                  <div className="text-base font-bold text-[#1F2937] dark:text-slate-100">
                    Dark Mode
                  </div>
                  <div className="text-[13px] text-[#64748B] dark:text-slate-400 mt-0.5">
                    Low-glare dark slate operational theme
                  </div>
                </div>
              </div>
              {theme === 'dark' && (
                <CheckCircle2 className="w-5 h-5 text-[#2563EB] dark:text-blue-400 shrink-0" />
              )}
            </button>
          </div>
        </div>
      )}
    </div>
  );
};
