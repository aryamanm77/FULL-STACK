-- MIT Mysore Examination System Schema
-- Maharaja Institute of Technology Mysore Examination Management Platform

CREATE TABLE IF NOT EXISTS department (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code text NOT NULL UNIQUE,
    name text NOT NULL,
    created_at timestamptz NOT NULL DEFAULT clock_timestamp()
);

CREATE TABLE IF NOT EXISTS academic_group (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    department text NOT NULL,
    academic_session text NOT NULL,
    study_year int NOT NULL CHECK (study_year > 0),
    semester int NOT NULL CHECK (semester > 0),
    section text NOT NULL,
    department_id bigint REFERENCES department(id),
    UNIQUE(department, academic_session, study_year, semester, section)
);
ALTER TABLE academic_group ADD COLUMN IF NOT EXISTS department_id bigint REFERENCES department(id);
ALTER TABLE academic_group ADD COLUMN IF NOT EXISTS year integer;
ALTER TABLE academic_group ALTER COLUMN study_year DROP NOT NULL;
ALTER TABLE academic_group ALTER COLUMN study_year SET DEFAULT 1;

CREATE TABLE IF NOT EXISTS subject (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code text UNIQUE,
    name text NOT NULL,
    department_id bigint REFERENCES department(id),
    semester int DEFAULT 1
);
ALTER TABLE subject ADD COLUMN IF NOT EXISTS code text;
ALTER TABLE subject ADD COLUMN IF NOT EXISTS department_id bigint REFERENCES department(id);
ALTER TABLE subject ADD COLUMN IF NOT EXISTS semester int DEFAULT 1;
ALTER TABLE subject ADD COLUMN IF NOT EXISTS applicable_sections text[] DEFAULT ARRAY['Section A', 'Section B'];

CREATE TABLE IF NOT EXISTS account (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    username text NOT NULL UNIQUE,
    password_hash text NOT NULL,
    role text NOT NULL,
    group_id bigint REFERENCES academic_group(id),
    department_id bigint REFERENCES department(id),
    full_name text,
    email text,
    contact_number text,
    employee_id text,
    designation text,
    status text NOT NULL DEFAULT 'ACTIVE',
    last_login_at timestamptz,
    theme_preference text DEFAULT 'system',
    created_at timestamptz NOT NULL DEFAULT clock_timestamp()
);
ALTER TABLE account DROP CONSTRAINT IF EXISTS account_role_check;
ALTER TABLE account DROP CONSTRAINT IF EXISTS account_check;
ALTER TABLE account ADD COLUMN IF NOT EXISTS department_id bigint REFERENCES department(id);
ALTER TABLE account ADD COLUMN IF NOT EXISTS full_name text;
ALTER TABLE account ADD COLUMN IF NOT EXISTS email text;
ALTER TABLE account ADD COLUMN IF NOT EXISTS contact_number text;
ALTER TABLE account ADD COLUMN IF NOT EXISTS employee_id text;
ALTER TABLE account ADD COLUMN IF NOT EXISTS designation text;
ALTER TABLE account ADD COLUMN IF NOT EXISTS status text NOT NULL DEFAULT 'ACTIVE';
ALTER TABLE account ADD COLUMN IF NOT EXISTS last_login_at timestamptz;
ALTER TABLE account ADD COLUMN IF NOT EXISTS theme_preference text DEFAULT 'system';
ALTER TABLE account ADD COLUMN IF NOT EXISTS created_at timestamptz NOT NULL DEFAULT clock_timestamp();
ALTER TABLE account DROP CONSTRAINT IF EXISTS chk_account_status;
ALTER TABLE account ADD CONSTRAINT chk_account_status CHECK (status IN ('ACTIVE', 'INACTIVE', 'SUSPENDED'));

CREATE TABLE IF NOT EXISTS session_token (
    token_hash text PRIMARY KEY,
    account_id bigint NOT NULL REFERENCES account(id) ON DELETE CASCADE,
    expires timestamptz NOT NULL
);

-- Student Roster for offline examination verification
CREATE TABLE IF NOT EXISTS student_roster (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    usn text NOT NULL UNIQUE,
    full_name text NOT NULL,
    date_of_birth date NOT NULL,
    group_id bigint NOT NULL REFERENCES academic_group(id),
    department_id bigint NOT NULL REFERENCES department(id),
    semester int NOT NULL,
    section text NOT NULL,
    created_at timestamptz NOT NULL DEFAULT clock_timestamp()
);
CREATE INDEX IF NOT EXISTS idx_student_roster_dept_sem ON student_roster(department_id, semester, section);

-- Question Bank Header & Revisions (5 Modules, 60 Qs/Module = 300 Qs total)
CREATE TABLE IF NOT EXISTS question_bank (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    department_id bigint NOT NULL REFERENCES department(id),
    subject_id bigint NOT NULL REFERENCES subject(id),
    academic_session text NOT NULL,
    semester int NOT NULL,
    title text NOT NULL,
    created_by bigint NOT NULL REFERENCES account(id),
    revision_number int NOT NULL DEFAULT 1,
    state text NOT NULL DEFAULT 'DRAFT' CHECK(state IN ('DRAFT','SUBMITTED','FINALIZED','REOPENED','ARCHIVED')),
    total_questions int NOT NULL DEFAULT 0,
    finalized_at timestamptz,
    finalized_by bigint REFERENCES account(id),
    created_at timestamptz NOT NULL DEFAULT clock_timestamp()
);

-- Question Bank Items (MCQ with Module 1-5, 4 options, stable Question ID)
CREATE TABLE IF NOT EXISTS question_bank_item (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    bank_id bigint NOT NULL REFERENCES question_bank(id) ON DELETE CASCADE,
    question_uid text NOT NULL,
    module_number int NOT NULL CHECK(module_number BETWEEN 1 AND 5),
    prompt text NOT NULL,
    options text[] NOT NULL CHECK(cardinality(options)=4),
    correct int NOT NULL CHECK(correct BETWEEN 1 AND 4),
    explanation text,
    marks numeric(8,2) NOT NULL DEFAULT 1.00,
    created_at timestamptz NOT NULL DEFAULT clock_timestamp(),
    UNIQUE(bank_id, question_uid)
);
CREATE INDEX IF NOT EXISTS idx_qb_item_bank_mod ON question_bank_item(bank_id, module_number);

-- Stage A: Numbered Prepared Paper Sets (Papers 1, 2, 3, 4; 30 Qs each: 6 from each of 5 modules)
CREATE TABLE IF NOT EXISTS generated_paper (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    bank_id bigint NOT NULL REFERENCES question_bank(id),
    paper_number int NOT NULL CHECK(paper_number BETWEEN 1 AND 4),
    title text NOT NULL,
    status text NOT NULL DEFAULT 'READY' CHECK(status IN ('READY','SELECTED','CONSUMED','RETIRED')),
    created_at timestamptz NOT NULL DEFAULT clock_timestamp(),
    UNIQUE(bank_id, paper_number)
);

CREATE TABLE IF NOT EXISTS generated_paper_question (
    paper_id bigint NOT NULL REFERENCES generated_paper(id) ON DELETE CASCADE,
    question_id bigint NOT NULL REFERENCES question_bank_item(id),
    module_number int NOT NULL,
    paper_position int NOT NULL CHECK(paper_position BETWEEN 1 AND 30),
    PRIMARY KEY(paper_id, paper_position)
);

-- Examination Cycles (e.g. IA-1, IA-2, Semester Exams)
CREATE TABLE IF NOT EXISTS examination_cycle (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title text NOT NULL,
    academic_session text NOT NULL,
    cycle_type text NOT NULL,
    created_by bigint NOT NULL REFERENCES account(id),
    created_at timestamptz NOT NULL DEFAULT clock_timestamp()
);

-- Examination Sessions / Sittings (Morning / Afternoon, assigned laboratory, schedule)
CREATE TABLE IF NOT EXISTS examination_session (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cycle_id bigint NOT NULL REFERENCES examination_cycle(id),
    subject_id bigint NOT NULL REFERENCES subject(id),
    department_id bigint NOT NULL REFERENCES department(id),
    group_id bigint NOT NULL REFERENCES academic_group(id),
    session_date date NOT NULL,
    sitting text NOT NULL CHECK(sitting IN ('MORNING','AFTERNOON')),
    start_time time NOT NULL,
    end_time time NOT NULL,
    duration_minutes int NOT NULL CHECK(duration_minutes > 0),
    assigned_lab text NOT NULL,
    selected_paper_id bigint REFERENCES generated_paper(id),
    status text NOT NULL DEFAULT 'SCHEDULED' CHECK(status IN ('SCHEDULED','FROZEN','PACKAGE_EXPORTED','RESULTS_IMPORTED','APPROVED','RELEASED')),
    created_by bigint NOT NULL REFERENCES account(id),
    frozen_at timestamptz,
    created_at timestamptz NOT NULL DEFAULT clock_timestamp()
);
CREATE INDEX IF NOT EXISTS idx_exam_session_sched ON examination_session(session_date, sitting, assigned_lab);

-- Stage B: Four Lettered Versions (A, B, C, D) for the Selected Paper
CREATE TABLE IF NOT EXISTS paper_version (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    session_id bigint NOT NULL REFERENCES examination_session(id) ON DELETE CASCADE,
    paper_id bigint NOT NULL REFERENCES generated_paper(id),
    version_letter text NOT NULL CHECK(version_letter IN ('A','B','C','D')),
    created_at timestamptz NOT NULL DEFAULT clock_timestamp(),
    UNIQUE(session_id, version_letter)
);

CREATE TABLE IF NOT EXISTS paper_version_question (
    version_id bigint NOT NULL REFERENCES paper_version(id) ON DELETE CASCADE,
    question_id bigint NOT NULL REFERENCES question_bank_item(id),
    question_uid text NOT NULL,
    display_position int NOT NULL CHECK(display_position BETWEEN 1 AND 30),
    shuffled_options text[] NOT NULL,
    shuffled_correct int NOT NULL CHECK(shuffled_correct BETWEEN 1 AND 4),
    marks numeric(8,2) NOT NULL DEFAULT 1.00,
    PRIMARY KEY(version_id, display_position)
);

-- Session Roster Snapshot (Frozen eligible students)
CREATE TABLE IF NOT EXISTS session_roster_snapshot (
    session_id bigint NOT NULL REFERENCES examination_session(id) ON DELETE CASCADE,
    student_id bigint NOT NULL REFERENCES student_roster(id),
    usn text NOT NULL,
    full_name text NOT NULL,
    date_of_birth date NOT NULL,
    PRIMARY KEY(session_id, student_id)
);

-- Lab Computer to Version Assignment (e.g. PC-01 -> Version A)
CREATE TABLE IF NOT EXISTS computer_assignment (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    session_id bigint NOT NULL REFERENCES examination_session(id) ON DELETE CASCADE,
    computer_number text NOT NULL,
    assigned_version_letter text NOT NULL CHECK(assigned_version_letter IN ('A','B','C','D')),
    UNIQUE(session_id, computer_number)
);

-- Secure Session Package (Encrypted for lab server, digitally signed by central backend)
CREATE TABLE IF NOT EXISTS secure_package (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    session_id bigint NOT NULL UNIQUE REFERENCES examination_session(id),
    package_uid text NOT NULL UNIQUE,
    encrypted_payload text NOT NULL,
    encrypted_key_hex text NOT NULL,
    iv_hex text NOT NULL,
    signature_hex text NOT NULL,
    digest_hex text NOT NULL,
    status text NOT NULL DEFAULT 'PREPARED' CHECK(status IN ('PREPARED','EXPORTED','RECEIVED','VERIFIED','ACCEPTED')),
    exported_at timestamptz,
    exported_by bigint REFERENCES account(id),
    created_at timestamptz NOT NULL DEFAULT clock_timestamp()
);

-- Results Import & Review (COE Verification and Approval)
CREATE TABLE IF NOT EXISTS lab_result_import (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    session_id bigint NOT NULL UNIQUE REFERENCES examination_session(id),
    raw_payload_json text NOT NULL,
    signature_hex text NOT NULL,
    total_candidates int NOT NULL,
    attended int NOT NULL,
    absent int NOT NULL,
    highest_marks numeric(8,2) NOT NULL DEFAULT 0,
    average_marks numeric(8,2) NOT NULL DEFAULT 0,
    pass_percentage numeric(5,2) NOT NULL DEFAULT 0,
    status text NOT NULL DEFAULT 'IMPORTED' CHECK(status IN ('IMPORTED','APPROVED','RELEASED')),
    imported_at timestamptz NOT NULL DEFAULT clock_timestamp(),
    imported_by bigint NOT NULL REFERENCES account(id),
    approved_at timestamptz,
    approved_by bigint REFERENCES account(id),
    released_at timestamptz,
    released_by bigint REFERENCES account(id)
);

-- Detailed Student Results from Session
CREATE TABLE IF NOT EXISTS student_session_result (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    import_id bigint NOT NULL REFERENCES lab_result_import(id) ON DELETE CASCADE,
    session_id bigint NOT NULL REFERENCES examination_session(id),
    usn text NOT NULL,
    full_name text NOT NULL,
    assigned_version text NOT NULL,
    total_questions int NOT NULL,
    correct_count int NOT NULL,
    incorrect_count int NOT NULL,
    unanswered_count int NOT NULL,
    score numeric(8,2) NOT NULL,
    passed boolean NOT NULL,
    submission_status text NOT NULL,
    UNIQUE(session_id, usn)
);

-- Audit Records (Append-only)
CREATE TABLE IF NOT EXISTS audit (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    happened timestamptz NOT NULL DEFAULT clock_timestamp(),
    actor bigint REFERENCES account(id),
    action text NOT NULL,
    entity text NOT NULL,
    detail text NOT NULL DEFAULT ''
);
ALTER TABLE audit ALTER COLUMN entity TYPE text;


-- Compatibility / Legacy Support Tables
CREATE TABLE IF NOT EXISTS faculty_scope (
    faculty_id bigint REFERENCES account(id),
    group_id bigint REFERENCES academic_group(id),
    subject_id bigint REFERENCES subject(id),
    PRIMARY KEY(faculty_id, group_id, subject_id)
);
CREATE TABLE IF NOT EXISTS bank (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    owner_id bigint NOT NULL REFERENCES account(id),
    subject_id bigint NOT NULL REFERENCES subject(id),
    title text NOT NULL,
    state text NOT NULL DEFAULT 'DRAFT' CHECK(state IN ('DRAFT','SUBMITTED','APPROVED','REJECTED','ARCHIVED'))
);
CREATE TABLE IF NOT EXISTS bank_scope (
    bank_id bigint REFERENCES bank(id),
    group_id bigint REFERENCES academic_group(id),
    PRIMARY KEY(bank_id, group_id)
);
CREATE TABLE IF NOT EXISTS question (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    bank_id bigint NOT NULL REFERENCES bank(id),
    prompt text NOT NULL,
    options text[] NOT NULL CHECK(cardinality(options)=4),
    correct int NOT NULL CHECK(correct BETWEEN 1 AND 4),
    explanation text NOT NULL,
    topic text NOT NULL,
    difficulty text NOT NULL CHECK(difficulty IN ('EASY','MEDIUM','HARD')),
    marks numeric(8,2) NOT NULL CHECK(marks>0),
    penalty numeric(8,2) NOT NULL CHECK(penalty>=0 AND penalty<=marks)
);
CREATE UNIQUE INDEX IF NOT EXISTS question_prompt_key ON question(bank_id,lower(btrim(prompt)));
CREATE TABLE IF NOT EXISTS exam (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title text NOT NULL,
    instructions text NOT NULL,
    bank_id bigint NOT NULL REFERENCES bank(id),
    mode text NOT NULL CHECK(mode IN ('OFFICIAL','PRACTICE')),
    duration int NOT NULL CHECK(duration BETWEEN 1 AND 28800),
    attempt_limit int NOT NULL CHECK(attempt_limit BETWEEN 1 AND 100),
    opens timestamptz NOT NULL,
    closes timestamptz NOT NULL CHECK(closes>opens),
    pass_marks numeric(12,2) NOT NULL CHECK(pass_marks>=0),
    released boolean NOT NULL DEFAULT false
);
CREATE TABLE IF NOT EXISTS exam_question (
    exam_id bigint REFERENCES exam(id),
    position int CHECK(position>0),
    prompt text NOT NULL,
    options text[] NOT NULL,
    correct int NOT NULL,
    explanation text NOT NULL,
    topic text NOT NULL,
    difficulty text NOT NULL,
    marks numeric(8,2) NOT NULL,
    penalty numeric(8,2) NOT NULL,
    PRIMARY KEY(exam_id, position)
);
CREATE TABLE IF NOT EXISTS assignment (
    exam_id bigint REFERENCES exam(id),
    student_id bigint REFERENCES account(id),
    PRIMARY KEY(exam_id, student_id)
);
CREATE TABLE IF NOT EXISTS attempt (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    exam_id bigint NOT NULL,
    student_id bigint NOT NULL,
    started timestamptz NOT NULL,
    deadline timestamptz NOT NULL,
    last_seen timestamptz NOT NULL,
    submitted timestamptz,
    reason text,
    score numeric(12,2),
    pending int NOT NULL DEFAULT 0,
    UNIQUE(id, exam_id),
    FOREIGN KEY(exam_id, student_id) REFERENCES assignment(exam_id, student_id)
);
CREATE UNIQUE INDEX IF NOT EXISTS one_active_attempt ON attempt(exam_id, student_id) WHERE submitted IS NULL;
CREATE INDEX IF NOT EXISTS attempt_due ON attempt(deadline) WHERE submitted IS NULL;
CREATE TABLE IF NOT EXISTS answer (
    attempt_id bigint,
    exam_id bigint NOT NULL,
    position int,
    choice int CHECK(choice BETWEEN 1 AND 4),
    review boolean NOT NULL,
    version bigint NOT NULL CHECK(version>0),
    PRIMARY KEY(attempt_id, position),
    FOREIGN KEY(attempt_id, exam_id) REFERENCES attempt(id, exam_id),
    FOREIGN KEY(exam_id, position) REFERENCES exam_question(exam_id, position)
);

-- -------------------------------------------------------------------------------------
-- Portal Extensions & Multi-Portal Architecture Support
-- -------------------------------------------------------------------------------------

-- Question Bank Item Extensions
ALTER TABLE question_bank_item ADD COLUMN IF NOT EXISTS has_images boolean NOT NULL DEFAULT false;
ALTER TABLE question_bank_item ADD COLUMN IF NOT EXISTS stem_images jsonb DEFAULT '[]'::jsonb;
ALTER TABLE question_bank_item ADD COLUMN IF NOT EXISTS option_images jsonb DEFAULT '[]'::jsonb;

-- Examination Session Extensions
ALTER TABLE examination_session ADD COLUMN IF NOT EXISTS total_marks numeric(8,2) NOT NULL DEFAULT 30.00;
ALTER TABLE examination_session ADD COLUMN IF NOT EXISTS passing_marks numeric(8,2);
UPDATE examination_session SET passing_marks = ROUND(total_marks * 0.40, 2) WHERE passing_marks IS NULL;
ALTER TABLE examination_session ALTER COLUMN passing_marks SET NOT NULL;

ALTER TABLE examination_session DROP CONSTRAINT IF EXISTS chk_passing_marks_range;
ALTER TABLE examination_session ADD CONSTRAINT chk_passing_marks_range CHECK (passing_marks > 0 AND passing_marks <= total_marks);

ALTER TABLE examination_session ADD COLUMN IF NOT EXISTS cancellation_reason text;
ALTER TABLE examination_session ADD COLUMN IF NOT EXISTS is_cancelled boolean NOT NULL DEFAULT false;
ALTER TABLE examination_session ADD COLUMN IF NOT EXISTS package_revision int NOT NULL DEFAULT 1;

ALTER TABLE examination_session DROP CONSTRAINT IF EXISTS examination_session_status_check;
ALTER TABLE examination_session ADD CONSTRAINT examination_session_status_check CHECK (
    status IN ('SCHEDULED', 'FROZEN', 'PACKAGE_EXPORTED', 'RESULTS_IMPORTED', 'APPROVED', 'RELEASED', 'CANCELLED', 'RETIRED')
);

-- Course Outcome Submission Master
CREATE TABLE IF NOT EXISTS course_outcome_submission (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    subject_id bigint NOT NULL REFERENCES subject(id) ON DELETE CASCADE,
    department_id bigint NOT NULL REFERENCES department(id),
    academic_session text NOT NULL,
    semester int NOT NULL CHECK (semester BETWEEN 1 AND 8),
    current_revision int NOT NULL DEFAULT 1,
    status text NOT NULL DEFAULT 'Under Review' CHECK (status IN ('Under Review', 'Reviewed', 'Clarification Requested')),
    created_by bigint NOT NULL REFERENCES account(id),
    created_at timestamptz NOT NULL DEFAULT clock_timestamp(),
    updated_at timestamptz NOT NULL DEFAULT clock_timestamp(),
    UNIQUE(subject_id, academic_session)
);

-- Course Outcome Document Revision
CREATE TABLE IF NOT EXISTS course_outcome_revision (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    submission_id bigint NOT NULL REFERENCES course_outcome_submission(id) ON DELETE CASCADE,
    revision_number int NOT NULL,
    file_name text NOT NULL,
    file_size_bytes bigint NOT NULL,
    file_hash_sha256 text NOT NULL,
    pdf_blob bytea,
    uploaded_by bigint NOT NULL REFERENCES account(id),
    uploaded_at timestamptz NOT NULL DEFAULT clock_timestamp(),
    UNIQUE(submission_id, revision_number)
);

-- Course Outcome Discrete Statements
CREATE TABLE IF NOT EXISTS course_outcome_statement (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    revision_id bigint NOT NULL REFERENCES course_outcome_revision(id) ON DELETE CASCADE,
    co_code text NOT NULL,
    description text NOT NULL,
    bloom_level text NOT NULL,
    target_percentage numeric(5,2),
    UNIQUE(revision_id, co_code)
);

-- Course Outcome Formal Review Audit Log
CREATE TABLE IF NOT EXISTS course_outcome_review (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    submission_id bigint NOT NULL REFERENCES course_outcome_submission(id) ON DELETE CASCADE,
    reviewed_by bigint NOT NULL REFERENCES account(id),
    decision text NOT NULL CHECK (decision IN ('REVIEWED_OK', 'CLARIFICATION_REQUESTED')),
    comments text NOT NULL,
    reviewed_at timestamptz NOT NULL DEFAULT clock_timestamp()
);

-- Answer Key Correction Disputes
CREATE TABLE IF NOT EXISTS answer_key_correction (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    session_id bigint NOT NULL REFERENCES examination_session(id) ON DELETE CASCADE,
    subject_id bigint NOT NULL REFERENCES subject(id),
    question_uid text NOT NULL,
    question_text text NOT NULL,
    original_correct text NOT NULL CHECK (original_correct IN ('A', 'B', 'C', 'D')),
    proposed_correct text NOT NULL CHECK (proposed_correct IN ('A', 'B', 'C', 'D', 'ALL_CORRECT', 'SCRAP_QUESTION')),
    reason text NOT NULL,
    status text NOT NULL DEFAULT 'PENDING' CHECK (status IN ('PENDING', 'APPROVED', 'REJECTED')),
    submitted_by bigint NOT NULL REFERENCES account(id),
    submitted_at timestamptz NOT NULL DEFAULT clock_timestamp(),
    decided_by bigint REFERENCES account(id),
    decided_at timestamptz,
    decision_reason text
);

-- Session Unlock Credential Verifiers
CREATE TABLE IF NOT EXISTS session_unlock_credential (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    session_id bigint NOT NULL REFERENCES examination_session(id) ON DELETE CASCADE,
    sitting_name text NOT NULL CHECK (sitting_name IN ('MORNING', 'AFTERNOON')),
    masked_preview text NOT NULL,
    verifier_hash text NOT NULL,
    salt text NOT NULL,
    iterations int NOT NULL DEFAULT 600000,
    revision int NOT NULL DEFAULT 1,
    status text NOT NULL DEFAULT 'Active' CHECK (status IN ('Active', 'Revoked', 'Expired', 'Superseded')),
    generated_by bigint NOT NULL REFERENCES account(id),
    generated_at timestamptz NOT NULL DEFAULT clock_timestamp(),
    expires_at timestamptz NOT NULL,
    last_synced_at timestamptz,
    UNIQUE(session_id, sitting_name, revision)
);

-- Security Violation & Proctored Telemetry Log
CREATE TABLE IF NOT EXISTS security_violation_log (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    session_id bigint NOT NULL REFERENCES examination_session(id) ON DELETE CASCADE,
    student_usn text NOT NULL,
    workstation_id text,
    violation_type text NOT NULL CHECK (violation_type IN ('TAB_SWITCH', 'WINDOW_BLUR', 'SHORTCUT_KEY', 'FULLSCREEN_EXIT', 'DEVTOOLS_ATTEMPT')),
    label text NOT NULL,
    description text NOT NULL,
    current_question_index int,
    remaining_seconds int,
    answered_count int,
    logged_at timestamptz NOT NULL DEFAULT clock_timestamp()
);

-- Re-Login Authorization Tokens
CREATE TABLE IF NOT EXISTS relogin_authorization (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    session_id bigint NOT NULL REFERENCES examination_session(id) ON DELETE CASCADE,
    student_usn text NOT NULL,
    assigned_workstation_id text NOT NULL,
    target_workstation_id text DEFAULT 'Any Available PC',
    token_id text NOT NULL UNIQUE,
    token_hash text NOT NULL UNIQUE,
    reason text NOT NULL,
    status text NOT NULL DEFAULT 'PENDING' CHECK (status IN ('PENDING', 'APPROVED', 'USED', 'EXPIRED')),
    authorized_by bigint REFERENCES account(id),
    authorized_at timestamptz,
    expires_at timestamptz NOT NULL,
    is_one_time_used boolean NOT NULL DEFAULT false,
    created_at timestamptz NOT NULL DEFAULT clock_timestamp()
);

-- Workstation Migration & Session Transfer Audit History
CREATE TABLE IF NOT EXISTS session_transfer_history (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    session_id bigint NOT NULL REFERENCES examination_session(id) ON DELETE CASCADE,
    student_usn text NOT NULL,
    from_workstation text NOT NULL,
    to_workstation text NOT NULL,
    authorization_id bigint REFERENCES relogin_authorization(id),
    reason text NOT NULL,
    transferred_by bigint NOT NULL REFERENCES account(id),
    transferred_at timestamptz NOT NULL DEFAULT clock_timestamp()
);

-- Performance & Integrity Indexes
CREATE UNIQUE INDEX IF NOT EXISTS uq_active_unlock_credential ON session_unlock_credential(session_id, sitting_name) WHERE status = 'Active';
CREATE INDEX IF NOT EXISTS idx_account_dept_role ON account(department_id, role);
CREATE INDEX IF NOT EXISTS idx_co_submission_dept_sem ON course_outcome_submission(department_id, semester);
CREATE INDEX IF NOT EXISTS idx_key_corr_session ON answer_key_correction(session_id, status);
CREATE INDEX IF NOT EXISTS idx_unlock_cred_session ON session_unlock_credential(session_id, status);
CREATE INDEX IF NOT EXISTS idx_sec_violation_session_usn ON security_violation_log(session_id, student_usn);
CREATE INDEX IF NOT EXISTS idx_relogin_auth_session_usn ON relogin_authorization(session_id, student_usn, status);
CREATE INDEX IF NOT EXISTS idx_session_transfer_session_usn ON session_transfer_history(session_id, student_usn);

