import React, { useState } from 'react';
import { Navigate, useNavigate } from 'react-router-dom';
import { Eye, EyeOff } from 'lucide-react';
import { authenticationService } from '../services/authenticationService';
import { useExaminationStore } from '../hooks/useExaminationStore';

const CAMPUS_BACKGROUND_IMAGE = '/assets/aistudio/image_74996ac2.png';
const OFFICIAL_CRISP_LOGO_IMAGE = '/assets/aistudio/image_03b7be00.png';

export const LoginPage: React.FC = () => {
  const navigate = useNavigate();
  const { authSession, setAuthSession, notify } = useExaminationStore();

  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [showPassword, setShowPassword] = useState(false);
  const [loading, setLoading] = useState(false);
  const [errorMessage, setErrorMessage] = useState<string | null>(null);

  if (authSession?.authenticated) {
    return <Navigate to="/" replace />;
  }

  const handleLoginSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setErrorMessage(null);

    if (!username.trim()) {
      setErrorMessage('Please enter your COE username.');
      return;
    }
    if (!password) {
      setErrorMessage('Please enter your password.');
      return;
    }

    setLoading(true);
    try {
      const response = await authenticationService.login(username, password);
      setAuthSession(response);
      notify(
        'success',
        'COE Session Authenticated',
        `Welcome, ${response.user.fullName} (${response.user.designation}).`
      );
      navigate('/', { replace: true });
    } catch (err) {
      setErrorMessage(
        err instanceof Error ? err.message : 'Authentication failed.'
      );
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="relative h-screen w-full flex flex-col justify-between overflow-hidden select-none bg-[#0F1E36]">
      {/* Full-Viewport Campus Background Photo with Calibrated Contrast Scrim */}
      <div className="fixed inset-0 z-0 pointer-events-none" aria-hidden="true">
        <img
          src={CAMPUS_BACKGROUND_IMAGE}
          alt=""
          className="w-full h-full object-cover object-[center_42%]"
        />
        <div className="absolute inset-0 bg-gradient-to-b from-[#0A1629]/50 via-[#0E1E38]/35 to-[#0A1629]/75" />
      </div>

      {/* Full-Width Institutional Masthead Header (Edge-to-Edge 100% Viewport Width) */}
      <header className="relative z-20 w-full shrink-0 bg-white/95 dark:bg-[#0F172A]/95 backdrop-blur-md border-b border-[#D9E2EF]/90 dark:border-slate-800 shadow-sm">
        <div className="w-full px-4 sm:px-6 lg:px-8 py-2.5 sm:py-3 flex items-center justify-center gap-4 sm:gap-6 md:gap-7">
          {/* Scaled Clean Circular MIT Mysore Emblem Directly Beside Text */}
          <div className="shrink-0 w-16 h-16 sm:w-20 sm:h-20 md:w-22 md:h-22 lg:w-24 lg:h-24 rounded-full bg-[#2C3384] p-[3px] sm:p-[4px] shadow-sm flex items-center justify-center aspect-square">
            <div className="w-full h-full rounded-full overflow-hidden aspect-square bg-[#2C3384] flex items-center justify-center">
              <img
                src={OFFICIAL_CRISP_LOGO_IMAGE}
                alt="Maharaja Institute of Technology Mysore Official Logo"
                className="w-full h-full object-contain aspect-square select-none"
              />
            </div>
          </div>

          {/* Institutional Hierarchy Text Block Close to Logo */}
          <div className="flex flex-col items-center justify-center text-center space-y-0.5 sm:space-y-1">
            <div
              className="text-[11px] sm:text-xs md:text-sm lg:text-[14px] font-bold tracking-[0.18em] uppercase text-[#3B337A] dark:text-indigo-300"
              style={{ fontFamily: 'Georgia, serif' }}
            >
              Maharaja Education Trust &reg;, Mysuru
            </div>
            <h1
              className="text-lg sm:text-2xl md:text-3xl lg:text-[34px] xl:text-[36px] font-extrabold text-[#242468] dark:text-white leading-tight tracking-[0.02em]"
              style={{ fontFamily: 'Georgia, serif' }}
            >
              Maharaja Institute of Technology Mysore
            </h1>
            <div className="text-xs sm:text-sm md:text-base lg:text-lg xl:text-xl font-bold text-[#2E3473] dark:text-indigo-200 leading-snug tracking-wide">
              ಮಹಾರಾಜ ತಾಂತ್ರಿಕ ಮಹಾವಿದ್ಯಾಲಯ ಮೈಸೂರು
            </div>
            <div
              className="text-[10px] sm:text-xs md:text-sm lg:text-[14px] font-bold leading-relaxed pt-0.5 flex flex-wrap items-center justify-center gap-x-2 gap-y-0.5 tracking-normal sm:tracking-wide"
              style={{ fontFamily: 'Georgia, serif' }}
            >
              <span className="text-[#D96B18] dark:text-amber-400">
                An Autonomous Institution Affiliated to VTU, Belagavi
              </span>
              <span className="hidden sm:inline text-slate-400" aria-hidden="true">
                &middot;
              </span>
              <span className="text-[#3B337A] dark:text-slate-300">
                Approved by AICTE, New Delhi, Recognized by GoK.
              </span>
            </div>
          </div>
        </div>
      </header>

      {/* Centered Fixed High-Contrast Login Card */}
      <main className="relative z-10 flex-1 w-full flex items-center justify-center px-4 py-3 sm:py-4 overflow-hidden">
        <div className="w-full max-w-[390px] sm:max-w-[410px] bg-white/95 dark:bg-[#1E293B]/95 backdrop-blur-md rounded-2xl shadow-2xl border border-white/70 dark:border-slate-700/80 px-6 py-6 sm:px-8 sm:py-7 flex flex-col justify-between">
          {/* Card Identity & Clean Circular Emblem */}
          <div className="flex flex-col items-center text-center">
            <div className="w-12 h-12 sm:w-14 sm:h-14 rounded-full bg-[#2C3384] p-[2.5px] sm:p-[3px] shadow-xs flex items-center justify-center">
              <div className="w-full h-full rounded-full overflow-hidden aspect-square bg-[#2C3384]">
                <img
                  src={OFFICIAL_CRISP_LOGO_IMAGE}
                  alt="MIT Mysore Emblem"
                  className="w-full h-full object-cover"
                />
              </div>
            </div>
            <h2 className="mt-2 text-xl sm:text-2xl font-bold text-[#242468] dark:text-white tracking-tight">
              COE Portal
            </h2>
            <p className="mt-0.5 text-xs sm:text-sm font-medium text-[#64748B] dark:text-slate-400">
              Examination Management System
            </p>
          </div>

          <div className="my-auto pt-4 pb-3">
            {errorMessage && (
              <div
                role="alert"
                className="mb-3.5 p-2.5 rounded-lg bg-red-50 dark:bg-red-950/40 border border-[#B42318]/40 text-xs sm:text-sm text-[#B42318] dark:text-red-300 font-medium leading-relaxed"
              >
                {errorMessage}
              </div>
            )}

            <form onSubmit={handleLoginSubmit} className="space-y-3.5" noValidate>
              <div>
                <label
                  htmlFor="coe-login-username"
                  className="block text-xs font-semibold text-[#334155] dark:text-slate-200 mb-1"
                >
                  Username
                </label>
                <input
                  id="coe-login-username"
                  type="text"
                  required
                  autoComplete="username"
                  value={username}
                  onChange={(e) => setUsername(e.target.value)}
                  placeholder="Enter your username"
                  className="w-full px-3.5 py-2.5 text-sm bg-white dark:bg-slate-800 border border-[#CBD5E1] dark:border-slate-700 rounded-lg text-[#1F2937] dark:text-white placeholder:text-[#94A3B8] focus:outline-none focus:border-[#242468] dark:focus:border-blue-500 focus:ring-2 focus:ring-[#242468]/15"
                />
              </div>

              <div>
                <label
                  htmlFor="coe-login-password"
                  className="block text-xs font-semibold text-[#334155] dark:text-slate-200 mb-1"
                >
                  Password
                </label>
                <div className="relative">
                  <input
                    id="coe-login-password"
                    type={showPassword ? 'text' : 'password'}
                    required
                    autoComplete="current-password"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    placeholder="Enter your password"
                    className="w-full pl-3.5 pr-10 py-2.5 text-sm bg-white dark:bg-slate-800 border border-[#CBD5E1] dark:border-slate-700 rounded-lg text-[#1F2937] dark:text-white placeholder:text-[#94A3B8] focus:outline-none focus:border-[#242468] dark:focus:border-blue-500 focus:ring-2 focus:ring-[#242468]/15"
                  />
                  <button
                    type="button"
                    onClick={() => setShowPassword((prev) => !prev)}
                    aria-label={showPassword ? 'Hide password' : 'Show password'}
                    className="absolute right-3 top-1/2 -translate-y-1/2 text-[#64748B] dark:text-slate-400 hover:text-[#1F2937] dark:hover:text-white p-1 cursor-pointer"
                  >
                    {showPassword ? (
                      <EyeOff className="w-4 h-4" />
                    ) : (
                      <Eye className="w-4 h-4" />
                    )}
                  </button>
                </div>
              </div>

              <div className="pt-1.5">
                <button
                  type="submit"
                  disabled={loading}
                  className="w-full py-2.5 px-4 bg-[#242468] hover:bg-[#1B1B52] dark:bg-[#2563EB] dark:hover:bg-[#1D4ED8] disabled:opacity-60 text-white text-sm font-semibold rounded-lg transition-colors shadow-sm cursor-pointer"
                >
                  {loading ? 'Signing In...' : 'Sign In'}
                </button>
              </div>
            </form>
          </div>

          <div className="pt-3 border-t border-slate-200/80 dark:border-slate-700/80 text-center">
            <div className="text-xs font-bold text-[#475569] dark:text-slate-300">
              For COE Access Only
            </div>
          </div>
        </div>
      </main>

      {/* Institutional Footer */}
      <footer className="relative z-10 w-full shrink-0 py-2 px-4 text-center text-xs font-medium text-white/95 bg-[#0A1629]/55 backdrop-blur-xs border-t border-white/10">
        Maharaja Institute of Technology Mysore
      </footer>
    </div>
  );
};
