import React, { useState } from 'react';
import { Link, Outlet, useLocation } from 'react-router-dom';
import {
  ChevronLeft,
  ChevronRight,
  ClipboardList,
  FileBarChart2,
  LayoutDashboard,
  LogOut,
  Menu,
  ShieldCheck,
  UserCheck,
  X,
} from 'lucide-react';
import { InstitutionLogo } from '../components/InstitutionLogo';
import { AccountMenu } from '../components/AccountMenu';
import { useAuth } from '../hooks/useAuth';

const PRINCIPAL_NAV_ITEMS = [
  { label: 'Dashboard', to: '/admin/principal/dashboard', icon: LayoutDashboard },
  { label: 'HOD Management', to: '/admin/principal/hod-management', icon: UserCheck },
  {
    label: 'Institution Reports & Analytics',
    to: '/admin/principal/reports',
    icon: FileBarChart2,
  },
  { label: 'Audit Logs', to: '/admin/principal/audit-logs', icon: ClipboardList },
];

export const PrincipalLayout: React.FC = () => {
  const location = useLocation();
  const { logout } = useAuth();
  const [collapsed, setCollapsed] = useState(false);
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

  const isNavActive = (to: string) => location.pathname === to;

  return (
    <div className="min-h-screen flex flex-col lg:flex-row bg-[#F5F7FB] dark:bg-slate-950 text-[#1F2937] dark:text-slate-100 transition-colors">
      {/* Mobile Header Bar */}
      <header className="lg:hidden sticky top-0 z-40 flex items-center justify-between px-4 py-3 bg-[#17243A] text-white border-b border-slate-800">
        <InstitutionLogo variant="mobile-bar" subtitle="Principal Portal" />
        <div className="flex items-center gap-2">
          <AccountMenu profileSettingsPath="/admin/principal/profile-settings" />
          <button
            type="button"
            onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
            className="p-2 rounded-md text-slate-200 hover:bg-white/10"
            aria-label="Toggle navigation menu"
          >
            {mobileMenuOpen ? <X className="w-5 h-5" /> : <Menu className="w-5 h-5" />}
          </button>
        </div>
      </header>

      {/* Mobile Drawer */}
      {mobileMenuOpen && (
        <div className="lg:hidden fixed inset-0 z-50 flex">
          <div className="fixed inset-0 bg-black/50" onClick={() => setMobileMenuOpen(false)} />
          <aside className="relative w-72 max-w-[85vw] bg-[#17243A] text-white flex flex-col h-full z-10 overflow-y-auto">
            <div className="p-4 border-b border-white/10 flex items-center justify-between">
              <InstitutionLogo variant="sidebar-expanded" subtitle="Principal Portal" />
              <button
                type="button"
                onClick={() => setMobileMenuOpen(false)}
                className="p-1.5 rounded-md text-slate-300 hover:text-white"
              >
                <X className="w-4 h-4" />
              </button>
            </div>
            <nav className="flex-1 px-3 py-5 space-y-1.5">
              {PRINCIPAL_NAV_ITEMS.map((item) => {
                const Icon = item.icon;
                const active = isNavActive(item.to);
                return (
                  <Link
                    key={item.to}
                    to={item.to}
                    onClick={() => setMobileMenuOpen(false)}
                    className={`flex items-center gap-3 px-3 py-2.5 rounded-md text-sm font-medium transition-colors ${
                      active
                        ? 'bg-[#2563EB] text-white'
                        : 'text-slate-300 hover:bg-white/10 hover:text-white'
                    }`}
                  >
                    <Icon className="w-4 h-4 shrink-0" />
                    <span>{item.label}</span>
                  </Link>
                );
              })}
              <button
                type="button"
                onClick={() => {
                  setMobileMenuOpen(false);
                  logout();
                }}
                className="w-full flex items-center gap-3 px-3 py-2.5 rounded-md text-sm font-medium text-red-400 hover:bg-red-500/10 transition-colors"
              >
                <LogOut className="w-4 h-4 shrink-0" />
                <span>Logout</span>
              </button>
            </nav>
          </aside>
        </div>
      )}

      {/* Desktop Sticky Sidebar */}
      <aside
        className={`hidden lg:flex flex-col shrink-0 bg-[#17243A] text-white border-r border-slate-800 sticky top-0 h-screen transition-all duration-150 ${
          collapsed ? 'w-20' : 'w-68'
        }`}
      >
        <div className="p-4 border-b border-white/10 flex items-center justify-between gap-2">
          {collapsed ? (
            <InstitutionLogo variant="sidebar-collapsed" />
          ) : (
            <InstitutionLogo variant="sidebar-expanded" subtitle="Principal Portal" />
          )}
          <button
            type="button"
            onClick={() => setCollapsed(!collapsed)}
            className="p-1.5 rounded-md text-slate-400 hover:text-white hover:bg-white/10 transition-colors shrink-0"
            aria-label={collapsed ? 'Expand sidebar' : 'Collapse sidebar'}
            title={collapsed ? 'Expand sidebar' : 'Collapse sidebar'}
          >
            {collapsed ? <ChevronRight className="w-4 h-4" /> : <ChevronLeft className="w-4 h-4" />}
          </button>
        </div>

        <nav className="flex-1 overflow-y-auto px-3 py-5 space-y-1.5">
          {!collapsed && (
            <div className="px-3 mb-2 text-[11px] font-semibold tracking-wider text-slate-400">
              INSTITUTIONAL ADMINISTRATION
            </div>
          )}
          {PRINCIPAL_NAV_ITEMS.map((item) => {
            const Icon = item.icon;
            const active = isNavActive(item.to);
            return (
              <Link
                key={item.to}
                to={item.to}
                title={collapsed ? item.label : undefined}
                className={`flex items-center gap-3 px-3 py-2.5 rounded-md text-[13.5px] font-medium transition-colors ${
                  active
                    ? 'bg-[#2563EB] text-white shadow-xs'
                    : 'text-slate-300 hover:bg-white/10 hover:text-white'
                } ${collapsed ? 'justify-center' : ''}`}
              >
                <Icon className="w-4 h-4 shrink-0" />
                {!collapsed && <span className="leading-snug">{item.label}</span>}
              </Link>
            );
          })}
          <button
            type="button"
            onClick={() => logout()}
            title={collapsed ? 'Logout' : undefined}
            className={`w-full flex items-center gap-3 px-3 py-2.5 rounded-md text-[13.5px] font-medium text-red-400 hover:bg-red-500/10 transition-colors ${
              collapsed ? 'justify-center' : ''
            }`}
          >
            <LogOut className="w-4 h-4 shrink-0" />
            {!collapsed && <span className="leading-snug">Logout</span>}
          </button>
        </nav>

        <div className="p-3.5 border-t border-white/10 bg-[#131E31]">
          {!collapsed ? (
            <div className="text-[11px] text-slate-400 leading-relaxed">
              Maharaja Institute of Technology Mysore · Examination Management System
            </div>
          ) : (
            <div className="flex justify-center">
              <ShieldCheck className="w-4 h-4 text-slate-400" />
            </div>
          )}
        </div>
      </aside>

      {/* Main Content Wrapper */}
      <div className="flex-1 flex flex-col min-w-0">
        <header className="hidden lg:flex sticky top-0 z-30 bg-white dark:bg-slate-900 border-b border-[#D9E2EF] dark:border-slate-800 px-6 py-3 items-center justify-between gap-6">
          <div className="flex items-center gap-2.5 min-w-0">
            <ShieldCheck className="w-4 h-4 text-[#2563EB] dark:text-blue-400 shrink-0" />
            <span className="text-xs font-semibold text-[#17243A] dark:text-slate-100 whitespace-nowrap">
              Principal Administrative Workspace
            </span>
            <span className="text-slate-300 dark:text-slate-600" aria-hidden="true">·</span>
            <span className="text-xs text-[#64748B] dark:text-slate-400 truncate">
              Institution-Wide Oversight
            </span>
          </div>

          <AccountMenu profileSettingsPath="/admin/principal/profile-settings" />
        </header>

        <main className="flex-1 p-5 sm:p-6 lg:p-8 max-w-[1440px] w-full mx-auto">
          <Outlet />
        </main>
      </div>
    </div>
  );
};
