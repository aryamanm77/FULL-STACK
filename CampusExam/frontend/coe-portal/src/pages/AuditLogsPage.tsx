import React, { useMemo, useState } from 'react';
import { Download, Search, ShieldCheck } from 'lucide-react';
import { useExaminationStore } from '../hooks/useExaminationStore';
import { StatusIndicator } from '../components/StatusIndicator';
import { exportRowsToCsv } from '../utils/csvExport';

export const AuditLogsPage: React.FC = () => {
  const { auditLogs, notify } = useExaminationStore();

  const [searchQuery, setSearchQuery] = useState('');
  const [roleFilter, setRoleFilter] = useState<string>('ALL');
  const [statusFilter, setStatusFilter] = useState<string>('ALL');
  const [dateFilter, setDateFilter] = useState<string>('');

  const filteredLogs = useMemo(() => {
    return auditLogs.filter((log) => {
      const q = searchQuery.trim().toLowerCase();
      const matchesQuery =
        !q ||
        log.activity.toLowerCase().includes(q) ||
        log.userName.toLowerCase().includes(q) ||
        log.examinationRef.toLowerCase().includes(q) ||
        (log.studentUsn && log.studentUsn.toLowerCase().includes(q));
      const matchesRole = roleFilter === 'ALL' || log.userRole === roleFilter;
      const matchesStatus =
        statusFilter === 'ALL' || log.actionStatus === statusFilter;
      const matchesDate = !dateFilter || log.timestamp.startsWith(dateFilter);
      return matchesQuery && matchesRole && matchesStatus && matchesDate;
    });
  }, [auditLogs, searchQuery, roleFilter, statusFilter, dateFilter]);

  const handleExportCsv = () => {
    exportRowsToCsv(
      'MIT_Mysore_COE_Audit_Logs.csv',
      filteredLogs.map((l) => ({
        Activity: l.activity,
        'User Name': l.userName,
        'User Role': l.userRole,
        'Relevant Examination': l.examinationRef,
        'Relevant Student USN': l.studentUsn || '—',
        'Date & Time': l.timestamp,
        'Action Status': l.actionStatus,
      }))
    );
    notify(
      'info',
      'Audit Logs Exported',
      `Exported ${filteredLogs.length} audit log records to CSV.`
    );
  };

  const getStatusTone = (status: string) => {
    switch (status) {
      case 'Completed':
      case 'Verified':
      case 'Approved':
        return 'success';
      case 'Warning / Locked':
        return 'warning';
      case 'Rejected':
        return 'danger';
      default:
        return 'info';
    }
  };

  return (
    <div className="space-y-7">
      {/* Main Page Header (26–28px) */}
      <div className="bg-white dark:bg-[#1E293B] border border-[#D9E2EF] dark:border-[#334155] rounded-xl p-6 sm:p-7 shadow-xs flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
        <div>
          <h1 className="text-[26px] sm:text-[28px] font-bold text-[#1F2937] dark:text-slate-100 leading-tight flex items-center gap-3">
            <ShieldCheck className="w-7 h-7 text-[#2563EB]" />
            Examination Audit Logs (Read-Only)
          </h1>
          <p className="text-[15px] text-[#64748B] dark:text-slate-400 mt-1.5 leading-relaxed">
            View and export recorded examination activities.
          </p>
        </div>
        <button
          type="button"
          onClick={handleExportCsv}
          className="inline-flex items-center gap-2 px-5 py-2.5 text-sm font-semibold text-white bg-[#2563EB] hover:bg-blue-700 rounded-lg shadow-xs cursor-pointer shrink-0"
        >
          <Download className="w-4 h-4" />
          Export Audit Logs CSV
        </button>
      </div>

      {/* Search & Filters */}
      <div className="bg-white dark:bg-[#1E293B] border border-[#D9E2EF] dark:border-[#334155] rounded-xl p-5 shadow-xs grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-4">
        <div className="lg:col-span-2 relative">
          <Search className="w-4 h-4 text-[#64748B] absolute left-3.5 top-1/2 -translate-y-1/2" />
          <input
            type="text"
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            placeholder="Search by Activity, User Name, Examination, or Student USN..."
            className="w-full pl-10 pr-4 py-2.5 text-sm rounded-lg border border-[#D9E2EF] dark:border-[#334155] bg-[#F5F7FB] dark:bg-[#0F172A] text-[#1F2937] dark:text-slate-100"
          />
        </div>
        <div>
          <select
            aria-label="Filter by User Role"
            value={roleFilter}
            onChange={(e) => setRoleFilter(e.target.value)}
            className="w-full px-3.5 py-2.5 text-sm rounded-lg border border-[#D9E2EF] dark:border-[#334155] bg-[#F5F7FB] dark:bg-[#0F172A] text-[#1F2937] dark:text-slate-100"
          >
            <option value="ALL">All User Roles</option>
            <option value="COE">COE</option>
            <option value="HOD">HOD</option>
            <option value="Invigilator">Invigilator</option>
            <option value="Lab Server">Lab Server</option>
            <option value="Central Backend">Central Backend</option>
            <option value="Student">Student</option>
          </select>
        </div>
        <div>
          <select
            aria-label="Filter by Action Status"
            value={statusFilter}
            onChange={(e) => setStatusFilter(e.target.value)}
            className="w-full px-3.5 py-2.5 text-sm rounded-lg border border-[#D9E2EF] dark:border-[#334155] bg-[#F5F7FB] dark:bg-[#0F172A] text-[#1F2937] dark:text-slate-100"
          >
            <option value="ALL">All Action Statuses</option>
            <option value="Completed">Completed</option>
            <option value="Verified">Verified</option>
            <option value="Approved">Approved</option>
            <option value="Warning / Locked">Warning / Locked</option>
            <option value="Rejected">Rejected</option>
          </select>
        </div>
        <div className="flex items-center gap-2">
          <input
            type="date"
            aria-label="Filter by Date"
            value={dateFilter}
            onChange={(e) => setDateFilter(e.target.value)}
            className="w-full px-3.5 py-2.5 text-sm rounded-lg border border-[#D9E2EF] dark:border-[#334155] bg-[#F5F7FB] dark:bg-[#0F172A] text-[#1F2937] dark:text-slate-100"
          />
          {dateFilter && (
            <button
              type="button"
              onClick={() => setDateFilter('')}
              className="px-2.5 py-2.5 text-xs font-semibold text-[#64748B] hover:text-[#1F2937] dark:text-slate-400 dark:hover:text-white border border-[#D9E2EF] dark:border-[#334155] rounded-lg cursor-pointer shrink-0"
            >
              Clear
            </button>
          )}
        </div>
      </div>

      {/* Read-Only Audit Logs Table */}
      <div className="bg-white dark:bg-[#1E293B] border border-[#D9E2EF] dark:border-[#334155] rounded-xl shadow-xs overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-[#F5F7FB] dark:bg-[#0F172A]/60 border-b border-[#D9E2EF] dark:border-[#334155] text-xs font-bold text-[#64748B] dark:text-slate-400 uppercase tracking-wider">
                <th className="py-4 px-5">Activity</th>
                <th className="py-4 px-5">User Name</th>
                <th className="py-4 px-5">User Role</th>
                <th className="py-4 px-5">Relevant Examination</th>
                <th className="py-4 px-5">Relevant Student USN</th>
                <th className="py-4 px-5">Date &amp; Time</th>
                <th className="py-4 px-5">Action Status</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-[#D9E2EF] dark:divide-[#334155] text-sm">
              {filteredLogs.map((log, idx) => (
                <tr
                  key={`${log.id}-${idx}`}
                  className="hover:bg-[#F5F7FB]/60 dark:hover:bg-slate-800/50"
                >
                  <td className="py-4 px-5 text-[#1F2937] dark:text-slate-100 max-w-lg leading-relaxed">
                    {log.activity}
                  </td>
                  <td className="py-4 px-5 font-bold text-[#1F2937] dark:text-slate-200 whitespace-nowrap">
                    {log.userName}
                  </td>
                  <td className="py-4 px-5 whitespace-nowrap">
                    <span className="px-2.5 py-1 rounded-md text-xs font-semibold bg-slate-100 dark:bg-slate-800 text-[#1F2937] dark:text-slate-200">
                      {log.userRole}
                    </span>
                  </td>
                  <td className="py-4 px-5 font-medium text-[#1F2937] dark:text-slate-200 whitespace-nowrap">
                    {log.examinationRef}
                  </td>
                  <td className="py-4 px-5 font-mono text-[#64748B] dark:text-slate-300 whitespace-nowrap">
                    {log.studentUsn || '—'}
                  </td>
                  <td className="py-4 px-5 font-mono text-[13px] text-[#64748B] dark:text-slate-400 whitespace-nowrap">
                    {log.timestamp}
                  </td>
                  <td className="py-4 px-5 whitespace-nowrap">
                    <StatusIndicator
                      tone={getStatusTone(log.actionStatus)}
                      label={log.actionStatus}
                    />
                  </td>
                </tr>
              ))}
              {filteredLogs.length === 0 && (
                <tr>
                  <td
                    colSpan={7}
                    className="py-10 text-center text-sm text-[#64748B] dark:text-slate-400"
                  >
                    No audit log entries match the current search or filter criteria.
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};
