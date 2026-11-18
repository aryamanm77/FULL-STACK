import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { AlertCircle, Eye, EyeOff, Loader2 } from 'lucide-react';
import { OFFICIAL_MIT_LOGO_PATH } from '../components/InstitutionLogo';
import { useAuth } from '../hooks/useAuth';

const MIT_BUILDING_BG_PATH = '/assets/aistudio/Screenshot_2026-11-15_092631_74996ac2.png';

export const LoginPage: React.FC = () => {
  const { user, login } = useAuth();
  const navigate = useNavigate();

  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [showPassword, setShowPassword] = useState(false);
  const [errorMessage, setErrorMessage] = useState('');
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [headerLogoError, setHeaderLogoError] = useState(false);
  const [cardLogoError, setCardLogoError] = useState(false);
  const [bgError, setBgError] = useState(false);

  useEffect(() => {
    if (user) {
      const isPrincipalOrAdmin = user.role === 'PRINCIPAL' || (user.role as string) === 'ADMIN';
      navigate(
        isPrincipalOrAdmin ? '/admin/principal/dashboard' : '/admin/hod/dashboard',
        { replace: true }
      );
    }
  }, [user, navigate]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setErrorMessage('');

    if (!username.trim()) {
      setErrorMessage('Please enter your username.');
      return;
    }
    if (!password) {
      setErrorMessage('Please enter your password.');
      return;
    }

    setIsSubmitting(true);
    try {
      const response = await login({ username: username.trim(), password });
      const isPrincipalOrAdmin = response.user.role === 'PRINCIPAL' || (response.user.role as string) === 'ADMIN';
      if (isPrincipalOrAdmin) {
        navigate('/admin/principal/dashboard', { replace: true });
      } else {
        navigate('/admin/hod/dashboard', { replace: true });
      }
    } catch (err) {
      setErrorMessage(
        err instanceof Error
          ? err.message
          : 'Unable to sign in. Please verify your credentials and try again.'
      );
    } finally {
      setIsSubmitting(false);
    }
  };

  return (
    <div className="relative h-screen w-full overflow-hidden flex flex-col justify-between bg-[#0F1B33]">
      {/* Full-Viewport Official MIT Mysore Building Background */}
      <div className="fixed inset-0 z-0 overflow-hidden pointer-events-none select-none bg-[#0F1B33]">
        {!bgError && (
          <img
            src={MIT_BUILDING_BG_PATH}
            alt="Maharaja Institute of Technology Mysore Campus Building"
            referrerPolicy="no-referrer"
            onError={() => setBgError(true)}
            className="w-full h-full object-cover object-[50%_58%] scale-[1.02]"
          />
        )}
        <div
          aria-hidden="true"
          className="absolute inset-0 bg-gradient-to-b from-[#162338]/45 via-[#182842]/45 to-[#0D1729]/70"
        />
      </div>

      {/* Full-Width Solid White Institutional Header Masthead (Edge-to-Edge 100% Viewport Width) */}
      <header className="relative z-20 w-full shrink-0 bg-white dark:bg-slate-900 border-b border-[#D9E2EF] dark:border-slate-800 shadow-[0_2px_12px_rgba(15,27,51,0.08)]">
        <div className="w-full px-4 sm:px-6 lg:px-8 py-2.5 sm:py-3 flex items-center justify-center gap-4 sm:gap-6 md:gap-7">
          {/* Scaled Circular Logo Directly Beside Text */}
          <div className="shrink-0 w-16 h-16 sm:w-20 sm:h-20 md:w-22 md:h-22 lg:w-24 lg:h-24 rounded-full bg-[#2C3384] p-[3px] sm:p-[4px] shadow-sm flex items-center justify-center aspect-square">
            <div className="w-full h-full rounded-full overflow-hidden aspect-square bg-[#2C3384] flex items-center justify-center">
              {!headerLogoError ? (
                <img
                  src={OFFICIAL_MIT_LOGO_PATH}
                  alt="Maharaja Institute of Technology Mysore Official Logo"
                  referrerPolicy="no-referrer"
                  onError={() => setHeaderLogoError(true)}
                  className="w-full h-full object-contain aspect-square select-none"
                />
              ) : (
                <span className="text-xs sm:text-sm font-bold text-white bg-[#262F87] w-full h-full flex items-center justify-center">
                  MITM
                </span>
              )}
            </div>
          </div>

          {/* Institutional Hierarchy Text Block Close to Logo */}
          <div className="flex flex-col items-center justify-center text-center space-y-0.5 sm:space-y-1">
            <p className="text-[11px] sm:text-xs md:text-sm lg:text-[14px] font-bold uppercase tracking-[0.18em] text-[#22246B] dark:text-indigo-300 font-serif leading-tight">
              Maharaja Education Trust ®, Mysuru
            </p>

            <h1 className="text-lg sm:text-2xl md:text-3xl lg:text-[34px] xl:text-[36px] font-extrabold text-[#22246B] dark:text-white tracking-[0.02em] font-serif leading-tight mt-0.5">
              Maharaja Institute of Technology Mysore
            </h1>

            <p className="text-xs sm:text-sm md:text-base lg:text-lg xl:text-xl font-bold text-[#22246B] dark:text-slate-200 leading-snug tracking-wide mt-0.5">
              ಮಹಾರಾಜ ತಾಂತ್ರಿಕ ಮಹಾವಿದ್ಯಾಲಯ ಮೈಸೂರು
            </p>

            <p className="text-[10px] sm:text-xs md:text-sm lg:text-[14px] font-bold leading-relaxed mt-0.5 font-serif flex flex-wrap items-center justify-center gap-x-2 gap-y-0.5 tracking-normal sm:tracking-wide">
              <span className="text-[#E86C1F] dark:text-orange-400">
                An Autonomous Institution Affiliated to VTU, Belagavi
              </span>
              <span className="text-[#94A3B8] hidden sm:inline" aria-hidden="true">
                ·
              </span>
              <span className="text-[#22246B] dark:text-slate-300">
                Approved by AICTE, New Delhi, Recognized by GoK.
              </span>
            </p>
          </div>
        </div>
      </header>

      {/* Centered Fixed Common Principal / HOD Login Card */}
      <main className="relative z-10 flex-1 flex items-center justify-center px-4 py-3 sm:py-4 overflow-hidden">
        <div className="w-full max-w-[390px] sm:max-w-[420px] bg-white dark:bg-slate-900 rounded-2xl border border-[#E2E8F0] dark:border-slate-700/80 shadow-[0_20px_50px_rgba(10,18,35,0.4)] px-6 py-6 sm:px-8 sm:py-7 flex flex-col justify-between">
          <div>
            <div className="flex flex-col items-center text-center mb-4">
              <div className="w-12 h-12 sm:w-14 sm:h-14 rounded-full overflow-hidden flex items-center justify-center mb-2">
                {!cardLogoError ? (
                  <img
                    src={OFFICIAL_MIT_LOGO_PATH}
                    alt="MIT Mysore Official Emblem"
                    referrerPolicy="no-referrer"
                    onError={() => setCardLogoError(true)}
                    className="w-full h-full object-contain select-none"
                  />
                ) : (
                  <span className="text-xs font-bold text-white bg-[#262F87] w-full h-full flex items-center justify-center">
                    MITM
                  </span>
                )}
              </div>
              <h2 className="text-base sm:text-lg font-bold text-[#22246B] dark:text-white tracking-tight leading-snug">
                MIT Mysore Examination Management System
              </h2>
              <p className="text-xs text-[#64748B] dark:text-slate-400 mt-0.5">
                Examination Management System
              </p>
            </div>

            {errorMessage && (
              <div
                role="alert"
                className="mb-3.5 p-2.5 rounded-lg bg-[#B42318]/10 dark:bg-red-950/40 border border-[#B42318]/30 dark:border-red-800 flex items-start gap-2 text-xs text-[#B42318] dark:text-red-300"
              >
                <AlertCircle className="w-4 h-4 shrink-0 mt-0.5" />
                <span className="leading-relaxed font-medium">{errorMessage}</span>
              </div>
            )}

            <form onSubmit={handleSubmit} noValidate className="space-y-3.5">
              <div>
                <label
                  htmlFor="admin-username"
                  className="block text-xs font-semibold text-[#1F2937] dark:text-slate-200 mb-1"
                >
                  Username
                </label>
                <input
                  id="admin-username"
                  type="text"
                  autoComplete="username"
                  value={username}
                  onChange={(e) => setUsername(e.target.value)}
                  placeholder="Enter your username"
                  disabled={isSubmitting}
                  className="w-full px-3.5 py-2.5 text-sm rounded-lg border border-[#D9E2EF] dark:border-slate-700 bg-white dark:bg-slate-800 text-[#1F2937] dark:text-slate-100 placeholder:text-slate-400 focus:outline-none focus:ring-2 focus:ring-[#25287A]/25 focus:border-[#25287A] transition-colors"
                />
              </div>

              <div>
                <label
                  htmlFor="admin-password"
                  className="block text-xs font-semibold text-[#1F2937] dark:text-slate-200 mb-1"
                >
                  Password
                </label>
                <div className="relative">
                  <input
                    id="admin-password"
                    type={showPassword ? 'text' : 'password'}
                    autoComplete="current-password"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    placeholder="Enter your password"
                    disabled={isSubmitting}
                    className="w-full pl-3.5 pr-10 py-2.5 text-sm rounded-lg border border-[#D9E2EF] dark:border-slate-700 bg-white dark:bg-slate-800 text-[#1F2937] dark:text-slate-100 placeholder:text-slate-400 focus:outline-none focus:ring-2 focus:ring-[#25287A]/25 focus:border-[#25287A] transition-colors"
                  />
                  <button
                    type="button"
                    onClick={() => setShowPassword((prev) => !prev)}
                    className="absolute right-3 top-1/2 -translate-y-1/2 text-[#64748B] dark:text-slate-400 hover:text-[#1F2937] dark:hover:text-white cursor-pointer"
                    aria-label={showPassword ? 'Hide password' : 'Show password'}
                  >
                    {showPassword ? <EyeOff className="w-4 h-4" /> : <Eye className="w-4 h-4" />}
                  </button>
                </div>
              </div>

              <button
                type="submit"
                disabled={isSubmitting}
                className="w-full mt-1.5 py-2.5 px-4 rounded-lg bg-[#25287A] hover:bg-[#1D2063] dark:bg-[#2563EB] dark:hover:bg-[#1D4ED8] text-white text-sm font-semibold shadow-xs transition-colors flex items-center justify-center gap-2 disabled:opacity-60 cursor-pointer"
              >
                {isSubmitting ? (
                  <>
                    <Loader2 className="w-4 h-4 animate-spin" />
                    <span>Signing In...</span>
                  </>
                ) : (
                  <span>Sign In</span>
                )}
              </button>
            </form>
          </div>

          <div className="mt-4 pt-3 border-t border-[#E2E8F0] dark:border-slate-800 text-center">
            <p className="text-xs font-medium text-[#475569] dark:text-slate-300">
              For Principal / HOD Access Only
            </p>
          </div>
        </div>
      </main>

      {/* Clean Institutional Footer */}
      <footer className="relative z-10 w-full shrink-0 py-2 px-4 text-center text-xs font-medium text-white/90 drop-shadow-xs">
        Maharaja Institute of Technology Mysore · Administrative Examination Portal
      </footer>
    </div>
  );
};
