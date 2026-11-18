export const DEPT_USN_BRANCH_PREFIXES: Record<string, string[]> = {
  CSE: ['CS', 'CSE'],
  ISE: ['IS', 'ISE'],
  ECE: ['EC', 'ECE'],
  ME: ['ME', 'MECH'],
  CV: ['CV', 'CIVIL', 'CIV'],
  EEE: ['EE', 'EEE'],
  AIML: ['AI', 'AM', 'AL', 'CI', 'AIML'],
  AIDS: ['AD', 'AI', 'DS', 'AIDS'],
};

export function getAllowedDeptBranchPrefixes(deptCode: string): string[] {
  const upper = deptCode.trim().toUpperCase();
  if (!upper) return [];
  return DEPT_USN_BRANCH_PREFIXES[upper] || [upper.slice(0, 2)];
}

export interface UsnValidationResult {
  valid: boolean;
  normalized: string;
  branchToken?: string;
  departmentMismatch?: boolean;
  error?: string;
}

/**
 * Validates MIT Mysore / VTU institutional USN patterns:
 * - Standard regular / lateral admission: 4MH{YY}{BRANCH}{ROLL} (e.g. 4MH24CS001, 4MH23AIML012, 4MH24CS401)
 */
export function validateInstitutionalUsn(
  rawUsn: string,
  expectedDepartmentCode?: string
): UsnValidationResult {
  const normalized = rawUsn.trim().toUpperCase();
  if (!normalized || normalized.includes('?') || normalized.includes('_')) {
    return {
      valid: false,
      normalized,
      error: 'Missing or unreadable USN.',
    };
  }

  const match = normalized.match(/^4MH\d{2}([A-Z]{2,4})\d{2,4}$/);
  if (!match) {
    const samplePrefix = expectedDepartmentCode
      ? getAllowedDeptBranchPrefixes(expectedDepartmentCode)[0] || 'CS'
      : 'CS';
    return {
      valid: false,
      normalized,
      error: `Invalid MIT Mysore USN format "${normalized}" (expected e.g. 4MH24${samplePrefix}001).`,
    };
  }

  const branchToken = match[1];
  if (expectedDepartmentCode) {
    const allowed = getAllowedDeptBranchPrefixes(expectedDepartmentCode);
    if (allowed.length > 0 && !allowed.includes(branchToken)) {
      return {
        valid: false,
        normalized,
        branchToken,
        departmentMismatch: true,
        error: `Department-prefix mismatch ("${branchToken}" does not belong to ${expectedDepartmentCode}).`,
      };
    }
  }

  return {
    valid: true,
    normalized,
    branchToken,
  };
}
