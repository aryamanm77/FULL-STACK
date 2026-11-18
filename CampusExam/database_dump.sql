--
-- PostgreSQL database dump
--

\restrict mxiTuDsqcmILNh1v8k6eVDy57OzcWV3s8BMauuSoEARfZtaNmBLtOFa2fD1GDKT

-- Dumped from database version 16.16
-- Dumped by pg_dump version 16.16

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.subject DROP CONSTRAINT IF EXISTS subject_department_id_fkey;
ALTER TABLE IF EXISTS ONLY public.student_session_result DROP CONSTRAINT IF EXISTS student_session_result_session_id_fkey;
ALTER TABLE IF EXISTS ONLY public.student_session_result DROP CONSTRAINT IF EXISTS student_session_result_import_id_fkey;
ALTER TABLE IF EXISTS ONLY public.student_roster DROP CONSTRAINT IF EXISTS student_roster_group_id_fkey;
ALTER TABLE IF EXISTS ONLY public.student_roster DROP CONSTRAINT IF EXISTS student_roster_department_id_fkey;
ALTER TABLE IF EXISTS ONLY public.session_unlock_credential DROP CONSTRAINT IF EXISTS session_unlock_credential_session_id_fkey;
ALTER TABLE IF EXISTS ONLY public.session_unlock_credential DROP CONSTRAINT IF EXISTS session_unlock_credential_generated_by_fkey;
ALTER TABLE IF EXISTS ONLY public.session_transfer_history DROP CONSTRAINT IF EXISTS session_transfer_history_transferred_by_fkey;
ALTER TABLE IF EXISTS ONLY public.session_transfer_history DROP CONSTRAINT IF EXISTS session_transfer_history_session_id_fkey;
ALTER TABLE IF EXISTS ONLY public.session_transfer_history DROP CONSTRAINT IF EXISTS session_transfer_history_authorization_id_fkey;
ALTER TABLE IF EXISTS ONLY public.session_token DROP CONSTRAINT IF EXISTS session_token_account_id_fkey;
ALTER TABLE IF EXISTS ONLY public.session_roster_snapshot DROP CONSTRAINT IF EXISTS session_roster_snapshot_student_id_fkey;
ALTER TABLE IF EXISTS ONLY public.session_roster_snapshot DROP CONSTRAINT IF EXISTS session_roster_snapshot_session_id_fkey;
ALTER TABLE IF EXISTS ONLY public.security_violation_log DROP CONSTRAINT IF EXISTS security_violation_log_session_id_fkey;
ALTER TABLE IF EXISTS ONLY public.secure_package DROP CONSTRAINT IF EXISTS secure_package_session_id_fkey;
ALTER TABLE IF EXISTS ONLY public.secure_package DROP CONSTRAINT IF EXISTS secure_package_exported_by_fkey;
ALTER TABLE IF EXISTS ONLY public.relogin_authorization DROP CONSTRAINT IF EXISTS relogin_authorization_session_id_fkey;
ALTER TABLE IF EXISTS ONLY public.relogin_authorization DROP CONSTRAINT IF EXISTS relogin_authorization_authorized_by_fkey;
ALTER TABLE IF EXISTS ONLY public.question_bank DROP CONSTRAINT IF EXISTS question_bank_subject_id_fkey;
ALTER TABLE IF EXISTS ONLY public.question_bank_item DROP CONSTRAINT IF EXISTS question_bank_item_bank_id_fkey;
ALTER TABLE IF EXISTS ONLY public.question DROP CONSTRAINT IF EXISTS question_bank_id_fkey;
ALTER TABLE IF EXISTS ONLY public.question_bank DROP CONSTRAINT IF EXISTS question_bank_finalized_by_fkey;
ALTER TABLE IF EXISTS ONLY public.question_bank DROP CONSTRAINT IF EXISTS question_bank_department_id_fkey;
ALTER TABLE IF EXISTS ONLY public.question_bank DROP CONSTRAINT IF EXISTS question_bank_created_by_fkey;
ALTER TABLE IF EXISTS ONLY public.paper_version DROP CONSTRAINT IF EXISTS paper_version_session_id_fkey;
ALTER TABLE IF EXISTS ONLY public.paper_version_question DROP CONSTRAINT IF EXISTS paper_version_question_version_id_fkey;
ALTER TABLE IF EXISTS ONLY public.paper_version_question DROP CONSTRAINT IF EXISTS paper_version_question_question_id_fkey;
ALTER TABLE IF EXISTS ONLY public.paper_version DROP CONSTRAINT IF EXISTS paper_version_paper_id_fkey;
ALTER TABLE IF EXISTS ONLY public.lab_result_import DROP CONSTRAINT IF EXISTS lab_result_import_session_id_fkey;
ALTER TABLE IF EXISTS ONLY public.lab_result_import DROP CONSTRAINT IF EXISTS lab_result_import_released_by_fkey;
ALTER TABLE IF EXISTS ONLY public.lab_result_import DROP CONSTRAINT IF EXISTS lab_result_import_imported_by_fkey;
ALTER TABLE IF EXISTS ONLY public.lab_result_import DROP CONSTRAINT IF EXISTS lab_result_import_approved_by_fkey;
ALTER TABLE IF EXISTS ONLY public.generated_paper_question DROP CONSTRAINT IF EXISTS generated_paper_question_question_id_fkey;
ALTER TABLE IF EXISTS ONLY public.generated_paper_question DROP CONSTRAINT IF EXISTS generated_paper_question_paper_id_fkey;
ALTER TABLE IF EXISTS ONLY public.generated_paper DROP CONSTRAINT IF EXISTS generated_paper_bank_id_fkey;
ALTER TABLE IF EXISTS ONLY public.faculty_scope DROP CONSTRAINT IF EXISTS faculty_scope_subject_id_fkey;
ALTER TABLE IF EXISTS ONLY public.faculty_scope DROP CONSTRAINT IF EXISTS faculty_scope_group_id_fkey;
ALTER TABLE IF EXISTS ONLY public.faculty_scope DROP CONSTRAINT IF EXISTS faculty_scope_faculty_id_fkey;
ALTER TABLE IF EXISTS ONLY public.examination_session DROP CONSTRAINT IF EXISTS examination_session_subject_id_fkey;
ALTER TABLE IF EXISTS ONLY public.examination_session DROP CONSTRAINT IF EXISTS examination_session_selected_paper_id_fkey;
ALTER TABLE IF EXISTS ONLY public.examination_session DROP CONSTRAINT IF EXISTS examination_session_group_id_fkey;
ALTER TABLE IF EXISTS ONLY public.examination_session DROP CONSTRAINT IF EXISTS examination_session_department_id_fkey;
ALTER TABLE IF EXISTS ONLY public.examination_session DROP CONSTRAINT IF EXISTS examination_session_cycle_id_fkey;
ALTER TABLE IF EXISTS ONLY public.examination_session DROP CONSTRAINT IF EXISTS examination_session_created_by_fkey;
ALTER TABLE IF EXISTS ONLY public.examination_cycle DROP CONSTRAINT IF EXISTS examination_cycle_created_by_fkey;
ALTER TABLE IF EXISTS ONLY public.exam_question DROP CONSTRAINT IF EXISTS exam_question_exam_id_fkey;
ALTER TABLE IF EXISTS ONLY public.exam DROP CONSTRAINT IF EXISTS exam_bank_id_fkey;
ALTER TABLE IF EXISTS ONLY public.course_outcome_submission DROP CONSTRAINT IF EXISTS course_outcome_submission_subject_id_fkey;
ALTER TABLE IF EXISTS ONLY public.course_outcome_submission DROP CONSTRAINT IF EXISTS course_outcome_submission_department_id_fkey;
ALTER TABLE IF EXISTS ONLY public.course_outcome_submission DROP CONSTRAINT IF EXISTS course_outcome_submission_created_by_fkey;
ALTER TABLE IF EXISTS ONLY public.course_outcome_statement DROP CONSTRAINT IF EXISTS course_outcome_statement_revision_id_fkey;
ALTER TABLE IF EXISTS ONLY public.course_outcome_revision DROP CONSTRAINT IF EXISTS course_outcome_revision_uploaded_by_fkey;
ALTER TABLE IF EXISTS ONLY public.course_outcome_revision DROP CONSTRAINT IF EXISTS course_outcome_revision_submission_id_fkey;
ALTER TABLE IF EXISTS ONLY public.course_outcome_review DROP CONSTRAINT IF EXISTS course_outcome_review_submission_id_fkey;
ALTER TABLE IF EXISTS ONLY public.course_outcome_review DROP CONSTRAINT IF EXISTS course_outcome_review_reviewed_by_fkey;
ALTER TABLE IF EXISTS ONLY public.computer_assignment DROP CONSTRAINT IF EXISTS computer_assignment_session_id_fkey;
ALTER TABLE IF EXISTS ONLY public.bank DROP CONSTRAINT IF EXISTS bank_subject_id_fkey;
ALTER TABLE IF EXISTS ONLY public.bank_scope DROP CONSTRAINT IF EXISTS bank_scope_group_id_fkey;
ALTER TABLE IF EXISTS ONLY public.bank_scope DROP CONSTRAINT IF EXISTS bank_scope_bank_id_fkey;
ALTER TABLE IF EXISTS ONLY public.bank DROP CONSTRAINT IF EXISTS bank_owner_id_fkey;
ALTER TABLE IF EXISTS ONLY public.audit DROP CONSTRAINT IF EXISTS audit_actor_fkey;
ALTER TABLE IF EXISTS ONLY public.attempt DROP CONSTRAINT IF EXISTS attempt_exam_id_student_id_fkey;
ALTER TABLE IF EXISTS ONLY public.assignment DROP CONSTRAINT IF EXISTS assignment_student_id_fkey;
ALTER TABLE IF EXISTS ONLY public.assignment DROP CONSTRAINT IF EXISTS assignment_exam_id_fkey;
ALTER TABLE IF EXISTS ONLY public.answer_key_correction DROP CONSTRAINT IF EXISTS answer_key_correction_submitted_by_fkey;
ALTER TABLE IF EXISTS ONLY public.answer_key_correction DROP CONSTRAINT IF EXISTS answer_key_correction_subject_id_fkey;
ALTER TABLE IF EXISTS ONLY public.answer_key_correction DROP CONSTRAINT IF EXISTS answer_key_correction_session_id_fkey;
ALTER TABLE IF EXISTS ONLY public.answer_key_correction DROP CONSTRAINT IF EXISTS answer_key_correction_decided_by_fkey;
ALTER TABLE IF EXISTS ONLY public.answer DROP CONSTRAINT IF EXISTS answer_exam_id_position_fkey;
ALTER TABLE IF EXISTS ONLY public.answer DROP CONSTRAINT IF EXISTS answer_attempt_id_exam_id_fkey;
ALTER TABLE IF EXISTS ONLY public.account DROP CONSTRAINT IF EXISTS account_group_id_fkey;
ALTER TABLE IF EXISTS ONLY public.account DROP CONSTRAINT IF EXISTS account_department_id_fkey;
ALTER TABLE IF EXISTS ONLY public.academic_group DROP CONSTRAINT IF EXISTS academic_group_department_id_fkey;
DROP INDEX IF EXISTS public.uq_active_unlock_credential;
DROP INDEX IF EXISTS public.question_prompt_key;
DROP INDEX IF EXISTS public.one_active_attempt;
DROP INDEX IF EXISTS public.idx_unlock_cred_session;
DROP INDEX IF EXISTS public.idx_student_roster_dept_sem;
DROP INDEX IF EXISTS public.idx_session_transfer_session_usn;
DROP INDEX IF EXISTS public.idx_sec_violation_session_usn;
DROP INDEX IF EXISTS public.idx_relogin_auth_session_usn;
DROP INDEX IF EXISTS public.idx_qb_item_bank_mod;
DROP INDEX IF EXISTS public.idx_key_corr_session;
DROP INDEX IF EXISTS public.idx_exam_session_sched;
DROP INDEX IF EXISTS public.idx_co_submission_dept_sem;
DROP INDEX IF EXISTS public.idx_account_dept_role;
DROP INDEX IF EXISTS public.attempt_due;
ALTER TABLE IF EXISTS ONLY public.subject DROP CONSTRAINT IF EXISTS subject_pkey;
ALTER TABLE IF EXISTS ONLY public.subject DROP CONSTRAINT IF EXISTS subject_code_key;
ALTER TABLE IF EXISTS ONLY public.student_session_result DROP CONSTRAINT IF EXISTS student_session_result_session_id_usn_key;
ALTER TABLE IF EXISTS ONLY public.student_session_result DROP CONSTRAINT IF EXISTS student_session_result_pkey;
ALTER TABLE IF EXISTS ONLY public.student_roster DROP CONSTRAINT IF EXISTS student_roster_usn_key;
ALTER TABLE IF EXISTS ONLY public.student_roster DROP CONSTRAINT IF EXISTS student_roster_pkey;
ALTER TABLE IF EXISTS ONLY public.session_unlock_credential DROP CONSTRAINT IF EXISTS session_unlock_credential_session_id_sitting_name_revision_key;
ALTER TABLE IF EXISTS ONLY public.session_unlock_credential DROP CONSTRAINT IF EXISTS session_unlock_credential_pkey;
ALTER TABLE IF EXISTS ONLY public.session_transfer_history DROP CONSTRAINT IF EXISTS session_transfer_history_pkey;
ALTER TABLE IF EXISTS ONLY public.session_token DROP CONSTRAINT IF EXISTS session_token_pkey;
ALTER TABLE IF EXISTS ONLY public.session_roster_snapshot DROP CONSTRAINT IF EXISTS session_roster_snapshot_pkey;
ALTER TABLE IF EXISTS ONLY public.security_violation_log DROP CONSTRAINT IF EXISTS security_violation_log_pkey;
ALTER TABLE IF EXISTS ONLY public.secure_package DROP CONSTRAINT IF EXISTS secure_package_session_id_key;
ALTER TABLE IF EXISTS ONLY public.secure_package DROP CONSTRAINT IF EXISTS secure_package_pkey;
ALTER TABLE IF EXISTS ONLY public.secure_package DROP CONSTRAINT IF EXISTS secure_package_package_uid_key;
ALTER TABLE IF EXISTS ONLY public.relogin_authorization DROP CONSTRAINT IF EXISTS relogin_authorization_token_id_key;
ALTER TABLE IF EXISTS ONLY public.relogin_authorization DROP CONSTRAINT IF EXISTS relogin_authorization_token_hash_key;
ALTER TABLE IF EXISTS ONLY public.relogin_authorization DROP CONSTRAINT IF EXISTS relogin_authorization_pkey;
ALTER TABLE IF EXISTS ONLY public.question DROP CONSTRAINT IF EXISTS question_pkey;
ALTER TABLE IF EXISTS ONLY public.question_bank DROP CONSTRAINT IF EXISTS question_bank_pkey;
ALTER TABLE IF EXISTS ONLY public.question_bank_item DROP CONSTRAINT IF EXISTS question_bank_item_pkey;
ALTER TABLE IF EXISTS ONLY public.question_bank_item DROP CONSTRAINT IF EXISTS question_bank_item_bank_id_question_uid_key;
ALTER TABLE IF EXISTS ONLY public.paper_version DROP CONSTRAINT IF EXISTS paper_version_session_id_version_letter_key;
ALTER TABLE IF EXISTS ONLY public.paper_version_question DROP CONSTRAINT IF EXISTS paper_version_question_pkey;
ALTER TABLE IF EXISTS ONLY public.paper_version DROP CONSTRAINT IF EXISTS paper_version_pkey;
ALTER TABLE IF EXISTS ONLY public.lab_result_import DROP CONSTRAINT IF EXISTS lab_result_import_session_id_key;
ALTER TABLE IF EXISTS ONLY public.lab_result_import DROP CONSTRAINT IF EXISTS lab_result_import_pkey;
ALTER TABLE IF EXISTS ONLY public.generated_paper_question DROP CONSTRAINT IF EXISTS generated_paper_question_pkey;
ALTER TABLE IF EXISTS ONLY public.generated_paper DROP CONSTRAINT IF EXISTS generated_paper_pkey;
ALTER TABLE IF EXISTS ONLY public.generated_paper DROP CONSTRAINT IF EXISTS generated_paper_bank_id_paper_number_key;
ALTER TABLE IF EXISTS ONLY public.faculty_scope DROP CONSTRAINT IF EXISTS faculty_scope_pkey;
ALTER TABLE IF EXISTS ONLY public.examination_session DROP CONSTRAINT IF EXISTS examination_session_pkey;
ALTER TABLE IF EXISTS ONLY public.examination_cycle DROP CONSTRAINT IF EXISTS examination_cycle_pkey;
ALTER TABLE IF EXISTS ONLY public.exam_question DROP CONSTRAINT IF EXISTS exam_question_pkey;
ALTER TABLE IF EXISTS ONLY public.exam DROP CONSTRAINT IF EXISTS exam_pkey;
ALTER TABLE IF EXISTS ONLY public.department DROP CONSTRAINT IF EXISTS department_pkey;
ALTER TABLE IF EXISTS ONLY public.department DROP CONSTRAINT IF EXISTS department_code_key;
ALTER TABLE IF EXISTS ONLY public.course_outcome_submission DROP CONSTRAINT IF EXISTS course_outcome_submission_subject_id_academic_session_key;
ALTER TABLE IF EXISTS ONLY public.course_outcome_submission DROP CONSTRAINT IF EXISTS course_outcome_submission_pkey;
ALTER TABLE IF EXISTS ONLY public.course_outcome_statement DROP CONSTRAINT IF EXISTS course_outcome_statement_revision_id_co_code_key;
ALTER TABLE IF EXISTS ONLY public.course_outcome_statement DROP CONSTRAINT IF EXISTS course_outcome_statement_pkey;
ALTER TABLE IF EXISTS ONLY public.course_outcome_revision DROP CONSTRAINT IF EXISTS course_outcome_revision_submission_id_revision_number_key;
ALTER TABLE IF EXISTS ONLY public.course_outcome_revision DROP CONSTRAINT IF EXISTS course_outcome_revision_pkey;
ALTER TABLE IF EXISTS ONLY public.course_outcome_review DROP CONSTRAINT IF EXISTS course_outcome_review_pkey;
ALTER TABLE IF EXISTS ONLY public.computer_assignment DROP CONSTRAINT IF EXISTS computer_assignment_session_id_computer_number_key;
ALTER TABLE IF EXISTS ONLY public.computer_assignment DROP CONSTRAINT IF EXISTS computer_assignment_pkey;
ALTER TABLE IF EXISTS ONLY public.bank_scope DROP CONSTRAINT IF EXISTS bank_scope_pkey;
ALTER TABLE IF EXISTS ONLY public.bank DROP CONSTRAINT IF EXISTS bank_pkey;
ALTER TABLE IF EXISTS ONLY public.audit DROP CONSTRAINT IF EXISTS audit_pkey;
ALTER TABLE IF EXISTS ONLY public.attempt DROP CONSTRAINT IF EXISTS attempt_pkey;
ALTER TABLE IF EXISTS ONLY public.attempt DROP CONSTRAINT IF EXISTS attempt_id_exam_id_key;
ALTER TABLE IF EXISTS ONLY public.assignment DROP CONSTRAINT IF EXISTS assignment_pkey;
ALTER TABLE IF EXISTS ONLY public.answer DROP CONSTRAINT IF EXISTS answer_pkey;
ALTER TABLE IF EXISTS ONLY public.answer_key_correction DROP CONSTRAINT IF EXISTS answer_key_correction_pkey;
ALTER TABLE IF EXISTS ONLY public.account DROP CONSTRAINT IF EXISTS account_username_key;
ALTER TABLE IF EXISTS ONLY public.account DROP CONSTRAINT IF EXISTS account_pkey;
ALTER TABLE IF EXISTS ONLY public.academic_group DROP CONSTRAINT IF EXISTS academic_group_pkey;
ALTER TABLE IF EXISTS ONLY public.academic_group DROP CONSTRAINT IF EXISTS academic_group_department_academic_session_study_year_semes_key;
DROP TABLE IF EXISTS public.subject;
DROP TABLE IF EXISTS public.student_session_result;
DROP TABLE IF EXISTS public.student_roster;
DROP TABLE IF EXISTS public.session_unlock_credential;
DROP TABLE IF EXISTS public.session_transfer_history;
DROP TABLE IF EXISTS public.session_token;
DROP TABLE IF EXISTS public.session_roster_snapshot;
DROP TABLE IF EXISTS public.security_violation_log;
DROP TABLE IF EXISTS public.secure_package;
DROP TABLE IF EXISTS public.relogin_authorization;
DROP TABLE IF EXISTS public.question_bank_item;
DROP TABLE IF EXISTS public.question_bank;
DROP TABLE IF EXISTS public.question;
DROP TABLE IF EXISTS public.paper_version_question;
DROP TABLE IF EXISTS public.paper_version;
DROP TABLE IF EXISTS public.lab_result_import;
DROP TABLE IF EXISTS public.generated_paper_question;
DROP TABLE IF EXISTS public.generated_paper;
DROP TABLE IF EXISTS public.faculty_scope;
DROP TABLE IF EXISTS public.examination_session;
DROP TABLE IF EXISTS public.examination_cycle;
DROP TABLE IF EXISTS public.exam_question;
DROP TABLE IF EXISTS public.exam;
DROP TABLE IF EXISTS public.department;
DROP TABLE IF EXISTS public.course_outcome_submission;
DROP TABLE IF EXISTS public.course_outcome_statement;
DROP TABLE IF EXISTS public.course_outcome_revision;
DROP TABLE IF EXISTS public.course_outcome_review;
DROP TABLE IF EXISTS public.computer_assignment;
DROP TABLE IF EXISTS public.bank_scope;
DROP TABLE IF EXISTS public.bank;
DROP TABLE IF EXISTS public.audit;
DROP TABLE IF EXISTS public.attempt;
DROP TABLE IF EXISTS public.assignment;
DROP TABLE IF EXISTS public.answer_key_correction;
DROP TABLE IF EXISTS public.answer;
DROP TABLE IF EXISTS public.account;
DROP TABLE IF EXISTS public.academic_group;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: academic_group; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.academic_group (
    id bigint NOT NULL,
    department text NOT NULL,
    academic_session text NOT NULL,
    study_year integer DEFAULT 1,
    semester integer NOT NULL,
    section text NOT NULL,
    department_id bigint,
    year integer,
    CONSTRAINT academic_group_semester_check CHECK ((semester > 0)),
    CONSTRAINT academic_group_study_year_check CHECK ((study_year > 0))
);


ALTER TABLE public.academic_group OWNER TO campusexam;

--
-- Name: academic_group_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.academic_group ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.academic_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: account; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.account (
    id bigint NOT NULL,
    username text NOT NULL,
    password_hash text NOT NULL,
    role text NOT NULL,
    group_id bigint,
    department_id bigint,
    full_name text,
    email text,
    contact_number text,
    employee_id text,
    designation text,
    status text DEFAULT 'ACTIVE'::text NOT NULL,
    last_login_at timestamp with time zone,
    theme_preference text DEFAULT 'system'::text,
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    CONSTRAINT chk_account_status CHECK ((status = ANY (ARRAY['ACTIVE'::text, 'INACTIVE'::text, 'SUSPENDED'::text])))
);


ALTER TABLE public.account OWNER TO campusexam;

--
-- Name: account_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.account ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: answer; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.answer (
    attempt_id bigint NOT NULL,
    exam_id bigint NOT NULL,
    "position" integer NOT NULL,
    choice integer,
    review boolean NOT NULL,
    version bigint NOT NULL,
    CONSTRAINT answer_choice_check CHECK (((choice >= 1) AND (choice <= 4))),
    CONSTRAINT answer_version_check CHECK ((version > 0))
);


ALTER TABLE public.answer OWNER TO campusexam;

--
-- Name: answer_key_correction; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.answer_key_correction (
    id bigint NOT NULL,
    session_id bigint NOT NULL,
    subject_id bigint NOT NULL,
    question_uid text NOT NULL,
    question_text text NOT NULL,
    original_correct text NOT NULL,
    proposed_correct text NOT NULL,
    reason text NOT NULL,
    status text DEFAULT 'PENDING'::text NOT NULL,
    submitted_by bigint NOT NULL,
    submitted_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    decided_by bigint,
    decided_at timestamp with time zone,
    decision_reason text,
    CONSTRAINT answer_key_correction_original_correct_check CHECK ((original_correct = ANY (ARRAY['A'::text, 'B'::text, 'C'::text, 'D'::text]))),
    CONSTRAINT answer_key_correction_proposed_correct_check CHECK ((proposed_correct = ANY (ARRAY['A'::text, 'B'::text, 'C'::text, 'D'::text, 'ALL_CORRECT'::text, 'SCRAP_QUESTION'::text]))),
    CONSTRAINT answer_key_correction_status_check CHECK ((status = ANY (ARRAY['PENDING'::text, 'APPROVED'::text, 'REJECTED'::text])))
);


ALTER TABLE public.answer_key_correction OWNER TO campusexam;

--
-- Name: answer_key_correction_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.answer_key_correction ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.answer_key_correction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: assignment; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.assignment (
    exam_id bigint NOT NULL,
    student_id bigint NOT NULL
);


ALTER TABLE public.assignment OWNER TO campusexam;

--
-- Name: attempt; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.attempt (
    id bigint NOT NULL,
    exam_id bigint NOT NULL,
    student_id bigint NOT NULL,
    started timestamp with time zone NOT NULL,
    deadline timestamp with time zone NOT NULL,
    last_seen timestamp with time zone NOT NULL,
    submitted timestamp with time zone,
    reason text,
    score numeric(12,2),
    pending integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.attempt OWNER TO campusexam;

--
-- Name: attempt_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.attempt ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.attempt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: audit; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.audit (
    id bigint NOT NULL,
    happened timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    actor bigint,
    action text NOT NULL,
    entity text NOT NULL,
    detail text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.audit OWNER TO campusexam;

--
-- Name: audit_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.audit ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bank; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.bank (
    id bigint NOT NULL,
    owner_id bigint NOT NULL,
    subject_id bigint NOT NULL,
    title text NOT NULL,
    state text DEFAULT 'DRAFT'::text NOT NULL,
    CONSTRAINT bank_state_check CHECK ((state = ANY (ARRAY['DRAFT'::text, 'SUBMITTED'::text, 'APPROVED'::text, 'REJECTED'::text, 'ARCHIVED'::text])))
);


ALTER TABLE public.bank OWNER TO campusexam;

--
-- Name: bank_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.bank ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.bank_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bank_scope; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.bank_scope (
    bank_id bigint NOT NULL,
    group_id bigint NOT NULL
);


ALTER TABLE public.bank_scope OWNER TO campusexam;

--
-- Name: computer_assignment; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.computer_assignment (
    id bigint NOT NULL,
    session_id bigint NOT NULL,
    computer_number text NOT NULL,
    assigned_version_letter text NOT NULL,
    CONSTRAINT computer_assignment_assigned_version_letter_check CHECK ((assigned_version_letter = ANY (ARRAY['A'::text, 'B'::text, 'C'::text, 'D'::text])))
);


ALTER TABLE public.computer_assignment OWNER TO campusexam;

--
-- Name: computer_assignment_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.computer_assignment ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.computer_assignment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: course_outcome_review; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.course_outcome_review (
    id bigint NOT NULL,
    submission_id bigint NOT NULL,
    reviewed_by bigint NOT NULL,
    decision text NOT NULL,
    comments text NOT NULL,
    reviewed_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    CONSTRAINT course_outcome_review_decision_check CHECK ((decision = ANY (ARRAY['REVIEWED_OK'::text, 'CLARIFICATION_REQUESTED'::text])))
);


ALTER TABLE public.course_outcome_review OWNER TO campusexam;

--
-- Name: course_outcome_review_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.course_outcome_review ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.course_outcome_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: course_outcome_revision; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.course_outcome_revision (
    id bigint NOT NULL,
    submission_id bigint NOT NULL,
    revision_number integer NOT NULL,
    file_name text NOT NULL,
    file_size_bytes bigint NOT NULL,
    file_hash_sha256 text NOT NULL,
    pdf_blob bytea,
    uploaded_by bigint NOT NULL,
    uploaded_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL
);


ALTER TABLE public.course_outcome_revision OWNER TO campusexam;

--
-- Name: course_outcome_revision_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.course_outcome_revision ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.course_outcome_revision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: course_outcome_statement; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.course_outcome_statement (
    id bigint NOT NULL,
    revision_id bigint NOT NULL,
    co_code text NOT NULL,
    description text NOT NULL,
    bloom_level text NOT NULL,
    target_percentage numeric(5,2)
);


ALTER TABLE public.course_outcome_statement OWNER TO campusexam;

--
-- Name: course_outcome_statement_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.course_outcome_statement ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.course_outcome_statement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: course_outcome_submission; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.course_outcome_submission (
    id bigint NOT NULL,
    subject_id bigint NOT NULL,
    department_id bigint NOT NULL,
    academic_session text NOT NULL,
    semester integer NOT NULL,
    current_revision integer DEFAULT 1 NOT NULL,
    status text DEFAULT 'Under Review'::text NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    CONSTRAINT course_outcome_submission_semester_check CHECK (((semester >= 1) AND (semester <= 8))),
    CONSTRAINT course_outcome_submission_status_check CHECK ((status = ANY (ARRAY['Under Review'::text, 'Reviewed'::text, 'Clarification Requested'::text])))
);


ALTER TABLE public.course_outcome_submission OWNER TO campusexam;

--
-- Name: course_outcome_submission_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.course_outcome_submission ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.course_outcome_submission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: department; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.department (
    id bigint NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL
);


ALTER TABLE public.department OWNER TO campusexam;

--
-- Name: department_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.department ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: exam; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.exam (
    id bigint NOT NULL,
    title text NOT NULL,
    instructions text NOT NULL,
    bank_id bigint NOT NULL,
    mode text NOT NULL,
    duration integer NOT NULL,
    attempt_limit integer NOT NULL,
    opens timestamp with time zone NOT NULL,
    closes timestamp with time zone NOT NULL,
    pass_marks numeric(12,2) NOT NULL,
    released boolean DEFAULT false NOT NULL,
    CONSTRAINT exam_attempt_limit_check CHECK (((attempt_limit >= 1) AND (attempt_limit <= 100))),
    CONSTRAINT exam_check CHECK ((closes > opens)),
    CONSTRAINT exam_duration_check CHECK (((duration >= 1) AND (duration <= 28800))),
    CONSTRAINT exam_mode_check CHECK ((mode = ANY (ARRAY['OFFICIAL'::text, 'PRACTICE'::text]))),
    CONSTRAINT exam_pass_marks_check CHECK ((pass_marks >= (0)::numeric))
);


ALTER TABLE public.exam OWNER TO campusexam;

--
-- Name: exam_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.exam ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.exam_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: exam_question; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.exam_question (
    exam_id bigint NOT NULL,
    "position" integer NOT NULL,
    prompt text NOT NULL,
    options text[] NOT NULL,
    correct integer NOT NULL,
    explanation text NOT NULL,
    topic text NOT NULL,
    difficulty text NOT NULL,
    marks numeric(8,2) NOT NULL,
    penalty numeric(8,2) NOT NULL,
    CONSTRAINT exam_question_position_check CHECK (("position" > 0))
);


ALTER TABLE public.exam_question OWNER TO campusexam;

--
-- Name: examination_cycle; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.examination_cycle (
    id bigint NOT NULL,
    title text NOT NULL,
    academic_session text NOT NULL,
    cycle_type text NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL
);


ALTER TABLE public.examination_cycle OWNER TO campusexam;

--
-- Name: examination_cycle_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.examination_cycle ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.examination_cycle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: examination_session; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.examination_session (
    id bigint NOT NULL,
    cycle_id bigint NOT NULL,
    subject_id bigint NOT NULL,
    department_id bigint NOT NULL,
    group_id bigint NOT NULL,
    session_date date NOT NULL,
    sitting text NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    duration_minutes integer NOT NULL,
    assigned_lab text NOT NULL,
    selected_paper_id bigint,
    status text DEFAULT 'SCHEDULED'::text NOT NULL,
    created_by bigint NOT NULL,
    frozen_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    total_marks numeric(8,2) DEFAULT 30.00 NOT NULL,
    passing_marks numeric(8,2) NOT NULL,
    cancellation_reason text,
    is_cancelled boolean DEFAULT false NOT NULL,
    package_revision integer DEFAULT 1 NOT NULL,
    CONSTRAINT chk_passing_marks_range CHECK (((passing_marks > (0)::numeric) AND (passing_marks <= total_marks))),
    CONSTRAINT examination_session_duration_minutes_check CHECK ((duration_minutes > 0)),
    CONSTRAINT examination_session_sitting_check CHECK ((sitting = ANY (ARRAY['MORNING'::text, 'AFTERNOON'::text]))),
    CONSTRAINT examination_session_status_check CHECK ((status = ANY (ARRAY['SCHEDULED'::text, 'FROZEN'::text, 'PACKAGE_EXPORTED'::text, 'RESULTS_IMPORTED'::text, 'APPROVED'::text, 'RELEASED'::text, 'CANCELLED'::text, 'RETIRED'::text])))
);


ALTER TABLE public.examination_session OWNER TO campusexam;

--
-- Name: examination_session_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.examination_session ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.examination_session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: faculty_scope; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.faculty_scope (
    faculty_id bigint NOT NULL,
    group_id bigint NOT NULL,
    subject_id bigint NOT NULL
);


ALTER TABLE public.faculty_scope OWNER TO campusexam;

--
-- Name: generated_paper; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.generated_paper (
    id bigint NOT NULL,
    bank_id bigint NOT NULL,
    paper_number integer NOT NULL,
    title text NOT NULL,
    status text DEFAULT 'READY'::text NOT NULL,
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    CONSTRAINT generated_paper_paper_number_check CHECK (((paper_number >= 1) AND (paper_number <= 4))),
    CONSTRAINT generated_paper_status_check CHECK ((status = ANY (ARRAY['READY'::text, 'SELECTED'::text, 'CONSUMED'::text, 'RETIRED'::text])))
);


ALTER TABLE public.generated_paper OWNER TO campusexam;

--
-- Name: generated_paper_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.generated_paper ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.generated_paper_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: generated_paper_question; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.generated_paper_question (
    paper_id bigint NOT NULL,
    question_id bigint NOT NULL,
    module_number integer NOT NULL,
    paper_position integer NOT NULL,
    CONSTRAINT generated_paper_question_paper_position_check CHECK (((paper_position >= 1) AND (paper_position <= 30)))
);


ALTER TABLE public.generated_paper_question OWNER TO campusexam;

--
-- Name: lab_result_import; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.lab_result_import (
    id bigint NOT NULL,
    session_id bigint NOT NULL,
    raw_payload_json text NOT NULL,
    signature_hex text NOT NULL,
    total_candidates integer NOT NULL,
    attended integer NOT NULL,
    absent integer NOT NULL,
    highest_marks numeric(8,2) DEFAULT 0 NOT NULL,
    average_marks numeric(8,2) DEFAULT 0 NOT NULL,
    pass_percentage numeric(5,2) DEFAULT 0 NOT NULL,
    status text DEFAULT 'IMPORTED'::text NOT NULL,
    imported_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    imported_by bigint NOT NULL,
    approved_at timestamp with time zone,
    approved_by bigint,
    released_at timestamp with time zone,
    released_by bigint,
    CONSTRAINT lab_result_import_status_check CHECK ((status = ANY (ARRAY['IMPORTED'::text, 'APPROVED'::text, 'RELEASED'::text])))
);


ALTER TABLE public.lab_result_import OWNER TO campusexam;

--
-- Name: lab_result_import_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.lab_result_import ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.lab_result_import_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: paper_version; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.paper_version (
    id bigint NOT NULL,
    session_id bigint NOT NULL,
    paper_id bigint NOT NULL,
    version_letter text NOT NULL,
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    CONSTRAINT paper_version_version_letter_check CHECK ((version_letter = ANY (ARRAY['A'::text, 'B'::text, 'C'::text, 'D'::text])))
);


ALTER TABLE public.paper_version OWNER TO campusexam;

--
-- Name: paper_version_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.paper_version ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.paper_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: paper_version_question; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.paper_version_question (
    version_id bigint NOT NULL,
    question_id bigint NOT NULL,
    question_uid text NOT NULL,
    display_position integer NOT NULL,
    shuffled_options text[] NOT NULL,
    shuffled_correct integer NOT NULL,
    marks numeric(8,2) DEFAULT 1.00 NOT NULL,
    CONSTRAINT paper_version_question_display_position_check CHECK (((display_position >= 1) AND (display_position <= 30))),
    CONSTRAINT paper_version_question_shuffled_correct_check CHECK (((shuffled_correct >= 1) AND (shuffled_correct <= 4)))
);


ALTER TABLE public.paper_version_question OWNER TO campusexam;

--
-- Name: question; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.question (
    id bigint NOT NULL,
    bank_id bigint NOT NULL,
    prompt text NOT NULL,
    options text[] NOT NULL,
    correct integer NOT NULL,
    explanation text NOT NULL,
    topic text NOT NULL,
    difficulty text NOT NULL,
    marks numeric(8,2) NOT NULL,
    penalty numeric(8,2) NOT NULL,
    CONSTRAINT question_check CHECK (((penalty >= (0)::numeric) AND (penalty <= marks))),
    CONSTRAINT question_correct_check CHECK (((correct >= 1) AND (correct <= 4))),
    CONSTRAINT question_difficulty_check CHECK ((difficulty = ANY (ARRAY['EASY'::text, 'MEDIUM'::text, 'HARD'::text]))),
    CONSTRAINT question_marks_check CHECK ((marks > (0)::numeric)),
    CONSTRAINT question_options_check CHECK ((cardinality(options) = 4))
);


ALTER TABLE public.question OWNER TO campusexam;

--
-- Name: question_bank; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.question_bank (
    id bigint NOT NULL,
    department_id bigint NOT NULL,
    subject_id bigint NOT NULL,
    academic_session text NOT NULL,
    semester integer NOT NULL,
    title text NOT NULL,
    created_by bigint NOT NULL,
    revision_number integer DEFAULT 1 NOT NULL,
    state text DEFAULT 'DRAFT'::text NOT NULL,
    total_questions integer DEFAULT 0 NOT NULL,
    finalized_at timestamp with time zone,
    finalized_by bigint,
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    CONSTRAINT question_bank_state_check CHECK ((state = ANY (ARRAY['DRAFT'::text, 'SUBMITTED'::text, 'FINALIZED'::text, 'REOPENED'::text, 'ARCHIVED'::text])))
);


ALTER TABLE public.question_bank OWNER TO campusexam;

--
-- Name: question_bank_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.question_bank ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.question_bank_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: question_bank_item; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.question_bank_item (
    id bigint NOT NULL,
    bank_id bigint NOT NULL,
    question_uid text NOT NULL,
    module_number integer NOT NULL,
    prompt text NOT NULL,
    options text[] NOT NULL,
    correct integer NOT NULL,
    explanation text,
    marks numeric(8,2) DEFAULT 1.00 NOT NULL,
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    has_images boolean DEFAULT false NOT NULL,
    stem_images jsonb DEFAULT '[]'::jsonb,
    option_images jsonb DEFAULT '[]'::jsonb,
    CONSTRAINT question_bank_item_correct_check CHECK (((correct >= 1) AND (correct <= 4))),
    CONSTRAINT question_bank_item_module_number_check CHECK (((module_number >= 1) AND (module_number <= 5))),
    CONSTRAINT question_bank_item_options_check CHECK ((cardinality(options) = 4))
);


ALTER TABLE public.question_bank_item OWNER TO campusexam;

--
-- Name: question_bank_item_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.question_bank_item ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.question_bank_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: question_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.question ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: relogin_authorization; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.relogin_authorization (
    id bigint NOT NULL,
    session_id bigint NOT NULL,
    student_usn text NOT NULL,
    assigned_workstation_id text NOT NULL,
    target_workstation_id text DEFAULT 'Any Available PC'::text,
    token_id text NOT NULL,
    token_hash text NOT NULL,
    reason text NOT NULL,
    status text DEFAULT 'PENDING'::text NOT NULL,
    authorized_by bigint,
    authorized_at timestamp with time zone,
    expires_at timestamp with time zone NOT NULL,
    is_one_time_used boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    CONSTRAINT relogin_authorization_status_check CHECK ((status = ANY (ARRAY['PENDING'::text, 'APPROVED'::text, 'USED'::text, 'EXPIRED'::text])))
);


ALTER TABLE public.relogin_authorization OWNER TO campusexam;

--
-- Name: relogin_authorization_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.relogin_authorization ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.relogin_authorization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: secure_package; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.secure_package (
    id bigint NOT NULL,
    session_id bigint NOT NULL,
    package_uid text NOT NULL,
    encrypted_payload text NOT NULL,
    encrypted_key_hex text NOT NULL,
    iv_hex text NOT NULL,
    signature_hex text NOT NULL,
    digest_hex text NOT NULL,
    status text DEFAULT 'PREPARED'::text NOT NULL,
    exported_at timestamp with time zone,
    exported_by bigint,
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    CONSTRAINT secure_package_status_check CHECK ((status = ANY (ARRAY['PREPARED'::text, 'EXPORTED'::text, 'RECEIVED'::text, 'VERIFIED'::text, 'ACCEPTED'::text])))
);


ALTER TABLE public.secure_package OWNER TO campusexam;

--
-- Name: secure_package_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.secure_package ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.secure_package_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: security_violation_log; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.security_violation_log (
    id bigint NOT NULL,
    session_id bigint NOT NULL,
    student_usn text NOT NULL,
    workstation_id text,
    violation_type text NOT NULL,
    label text NOT NULL,
    description text NOT NULL,
    current_question_index integer,
    remaining_seconds integer,
    answered_count integer,
    logged_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    CONSTRAINT security_violation_log_violation_type_check CHECK ((violation_type = ANY (ARRAY['TAB_SWITCH'::text, 'WINDOW_BLUR'::text, 'SHORTCUT_KEY'::text, 'FULLSCREEN_EXIT'::text, 'DEVTOOLS_ATTEMPT'::text])))
);


ALTER TABLE public.security_violation_log OWNER TO campusexam;

--
-- Name: security_violation_log_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.security_violation_log ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.security_violation_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: session_roster_snapshot; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.session_roster_snapshot (
    session_id bigint NOT NULL,
    student_id bigint NOT NULL,
    usn text NOT NULL,
    full_name text NOT NULL,
    date_of_birth date NOT NULL
);


ALTER TABLE public.session_roster_snapshot OWNER TO campusexam;

--
-- Name: session_token; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.session_token (
    token_hash text NOT NULL,
    account_id bigint NOT NULL,
    expires timestamp with time zone NOT NULL
);


ALTER TABLE public.session_token OWNER TO campusexam;

--
-- Name: session_transfer_history; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.session_transfer_history (
    id bigint NOT NULL,
    session_id bigint NOT NULL,
    student_usn text NOT NULL,
    from_workstation text NOT NULL,
    to_workstation text NOT NULL,
    authorization_id bigint,
    reason text NOT NULL,
    transferred_by bigint NOT NULL,
    transferred_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL
);


ALTER TABLE public.session_transfer_history OWNER TO campusexam;

--
-- Name: session_transfer_history_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.session_transfer_history ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.session_transfer_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: session_unlock_credential; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.session_unlock_credential (
    id bigint NOT NULL,
    session_id bigint NOT NULL,
    sitting_name text NOT NULL,
    masked_preview text NOT NULL,
    verifier_hash text NOT NULL,
    salt text NOT NULL,
    iterations integer DEFAULT 600000 NOT NULL,
    revision integer DEFAULT 1 NOT NULL,
    status text DEFAULT 'Active'::text NOT NULL,
    generated_by bigint NOT NULL,
    generated_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    last_synced_at timestamp with time zone,
    CONSTRAINT session_unlock_credential_sitting_name_check CHECK ((sitting_name = ANY (ARRAY['MORNING'::text, 'AFTERNOON'::text]))),
    CONSTRAINT session_unlock_credential_status_check CHECK ((status = ANY (ARRAY['Active'::text, 'Revoked'::text, 'Expired'::text, 'Superseded'::text])))
);


ALTER TABLE public.session_unlock_credential OWNER TO campusexam;

--
-- Name: session_unlock_credential_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.session_unlock_credential ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.session_unlock_credential_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: student_roster; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.student_roster (
    id bigint NOT NULL,
    usn text NOT NULL,
    full_name text NOT NULL,
    date_of_birth date NOT NULL,
    group_id bigint NOT NULL,
    department_id bigint NOT NULL,
    semester integer NOT NULL,
    section text NOT NULL,
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL
);


ALTER TABLE public.student_roster OWNER TO campusexam;

--
-- Name: student_roster_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.student_roster ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.student_roster_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: student_session_result; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.student_session_result (
    id bigint NOT NULL,
    import_id bigint NOT NULL,
    session_id bigint NOT NULL,
    usn text NOT NULL,
    full_name text NOT NULL,
    assigned_version text NOT NULL,
    total_questions integer NOT NULL,
    correct_count integer NOT NULL,
    incorrect_count integer NOT NULL,
    unanswered_count integer NOT NULL,
    score numeric(8,2) NOT NULL,
    passed boolean NOT NULL,
    submission_status text NOT NULL
);


ALTER TABLE public.student_session_result OWNER TO campusexam;

--
-- Name: student_session_result_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.student_session_result ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.student_session_result_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: subject; Type: TABLE; Schema: public; Owner: campusexam
--

CREATE TABLE public.subject (
    id bigint NOT NULL,
    code text,
    name text NOT NULL,
    department_id bigint,
    semester integer DEFAULT 1,
    applicable_sections text[] DEFAULT ARRAY['Section A'::text, 'Section B'::text]
);


ALTER TABLE public.subject OWNER TO campusexam;

--
-- Name: subject_id_seq; Type: SEQUENCE; Schema: public; Owner: campusexam
--

ALTER TABLE public.subject ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.subject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: academic_group; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.academic_group (id, department, academic_session, study_year, semester, section, department_id, year) FROM stdin;
1	CIVIL	2025-26	3	5	Section A	1	3
2	CSE	2025-26	3	5	Section A	2	3
3	CSE-AI	2025-26	3	5	Section A	3	3
4	CSE-DS	2025-26	3	5	Section A	4	3
5	CSE-BS	2025-26	3	5	Section A	5	3
6	CSE-AIML	2025-26	3	5	Section A	6	3
7	CSE-IOTCS	2025-26	3	5	Section A	7	3
8	COMP	2025-26	3	5	Section A	8	3
9	ECE	2025-26	3	5	Section A	9	3
10	ISE	2025-26	3	5	Section A	10	3
11	MECH	2025-26	3	5	Section A	11	3
12	CIVIL	2025-26	3	5	Section B	1	3
13	CSE	2025-26	3	5	Section B	2	3
14	CSE-AI	2025-26	3	5	Section B	3	3
15	CSE-DS	2025-26	3	5	Section B	4	3
16	CSE-BS	2025-26	3	5	Section B	5	3
17	CSE-AIML	2025-26	3	5	Section B	6	3
18	CSE-IOTCS	2025-26	3	5	Section B	7	3
19	COMP	2025-26	3	5	Section B	8	3
20	ECE	2025-26	3	5	Section B	9	3
21	ISE	2025-26	3	5	Section B	10	3
22	MECH	2025-26	3	5	Section B	11	3
45	CSE	2026-27	3	5	C	2	3
68	CSE	2026-27	3	5	E	2	3
\.


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.account (id, username, password_hash, role, group_id, department_id, full_name, email, contact_number, employee_id, designation, status, last_login_at, theme_preference, created_at) FROM stdin;
16	4mh24cs001	68a0f0ba28ccd12a6d03de4567c16bea:6ced247c906ca284cfe364d02b53d412b595edca6c02d659d41bc5d670880705	STUDENT	\N	\N	Test Student 1	\N	\N	\N	\N	ACTIVE	\N	system	2026-11-19 01:21:24.947486+05:30
1	admin	f60a8b5d13bcb2e9c1aad90f68e5bc78:a517284f550d23160e7e15da1a4b806b19cf8bdb72793a799b04187b28286255	ADMIN	\N	\N	System Administrator	\N	\N	\N	Central Administrator	ACTIVE	2026-11-19 01:12:04.404029+05:30	system	2026-11-18 21:25:19.233514+05:30
2	principal	91ee2907725c4719c85812431e24fecb:0f1f6660a2e271f82829b1d8d29022638fc97d76213104a68bc7ea842f5241e7	PRINCIPAL	\N	\N	Principal	principal@mitmysore.in	\N	EMP-PRINCIPAL	Principal & Chief Academic Officer	ACTIVE	2026-11-18 23:30:52.234637+05:30	system	2026-11-18 23:29:52.311311+05:30
5	hod.cse	ceba97290090ddd894d5cd32c01813a7:3b862b17b22abb164208a0194496de771636bae5c655fbe0b23d3134f36d65aa	HOD	\N	2	HOD Computer Science & Engineering	hod.cse@mitmysore.in	\N	EMP-HOD.CSE	Head of Department	ACTIVE	2026-11-19 02:35:28.287216+05:30	light	2026-11-18 23:29:57.089766+05:30
15	4mh25cs021	8d7720cba38bd795a85377e9c0ba0860:3522b145100da225f239e01e91abc2940e6efabd1a5c4fb39c9b6adee38dfab2	STUDENT	\N	\N	Candidate 4MH25CS021	\N	\N	\N	\N	ACTIVE	\N	system	2026-11-18 23:31:31.200232+05:30
4	hod.civil	e33a8e01c825c6c97a60d61031f64ce7:61a4f2bc37f877a6e22b825827f9dea25a3173b007a1e8a697ce1f8598e6cf53	HOD	\N	1	HOD Civil Engineering	hod.civil@mitmysore.in	\N	EMP-HOD.CIVIL	Head of Department	ACTIVE	2026-11-18 23:30:59.87361+05:30	system	2026-11-18 23:29:55.461976+05:30
3	coe	049985b43915e23cf3f4b3f36b50d41e:46168c831086a9cd82b2dc85cf3c2312d59f971956156afafbcfd8cf1b9b921e	COE	\N	\N	Controller of Examinations	coe@mitmysore.in	\N	EMP-COE	Controller of Examinations	ACTIVE	2026-11-19 01:48:50.057558+05:30	system	2026-11-18 23:29:53.926311+05:30
6	hod.cse.ai	f72c17683e4108419715b14a61ffd379:7361681d602391210a06436ee1dc1618063d711c4d3c8b9d273e104612acdefd	HOD	\N	3	HOD CSE - Artificial Intelligence	hod.cse.ai@mitmysore.in	\N	EMP-HOD.CSE.AI	Head of Department	ACTIVE	\N	system	2026-11-18 23:29:58.721186+05:30
7	hod.cse.ds	371af489f73ce4c972033fdfc0f2a81f:fd8146ff9108acb0ca638677ab700ee18ea4c55bd548c593fe355349a09fd370	HOD	\N	4	HOD CSE - Data Science	hod.cse.ds@mitmysore.in	\N	EMP-HOD.CSE.DS	Head of Department	ACTIVE	\N	system	2026-11-18 23:30:00.385168+05:30
8	hod.cse.bs	068250d27378ad321c8860ba57c9ef90:c3e35b8a772ff994a91bd238e67dc2cf3855d388f049050ff98fd7ba2c061b44	HOD	\N	5	HOD CSE - Business Systems	hod.cse.bs@mitmysore.in	\N	EMP-HOD.CSE.BS	Head of Department	ACTIVE	\N	system	2026-11-18 23:30:01.927133+05:30
9	hod.cse.aiml	dac96064d6ae4a0abc0e1391eb282cb6:0a4395955f3fa17ffa5c17039d6d509765b771f12525acc45709809d0c8db326	HOD	\N	6	HOD CSE - AI & ML	hod.cse.aiml@mitmysore.in	\N	EMP-HOD.CSE.AIML	Head of Department	ACTIVE	\N	system	2026-11-18 23:30:03.47731+05:30
10	hod.cse.iotcs	d6ac3ae6a1d6659e270a2d543e7b1fa7:d7ee27836e45115957da10056fca49386af10684d1b3f5b2c8ddc1f3185cc497	HOD	\N	7	HOD CSE - IoT & Cyber Security	hod.cse.iotcs@mitmysore.in	\N	EMP-HOD.CSE.IOTCS	Head of Department	ACTIVE	\N	system	2026-11-18 23:30:05.247832+05:30
11	hod.comp	fc03673b9f76675e8b1e6c67e8d6055d:2ee4ceee56cf2baab5ed967253138c8e56a0b46ece67e42282d8c362b1f15bd4	HOD	\N	8	HOD Computer Engineering	hod.comp@mitmysore.in	\N	EMP-HOD.COMP	Head of Department	ACTIVE	\N	system	2026-11-18 23:30:07.441466+05:30
12	hod.ece	aa9613522c2d14f1a3ff9cf8e8ee3a49:be66097e51057a9db1db1e12bcd35efd69913b0498d011aed93e827afca9e12a	HOD	\N	9	HOD Electronics & Communication Engineering	hod.ece@mitmysore.in	\N	EMP-HOD.ECE	Head of Department	ACTIVE	\N	system	2026-11-18 23:30:09.134398+05:30
13	hod.ise	0821622af46eaa62854eda28f8239084:c57a8fae7b82161937769bec5e9385f6f351cbe32308ed66366e0f154654e39c	HOD	\N	10	HOD Information Science & Engineering	hod.ise@mitmysore.in	\N	EMP-HOD.ISE	Head of Department	ACTIVE	\N	system	2026-11-18 23:30:10.721548+05:30
14	hod.mech	b353f9f3c792483b3569c88e23379d6f:7d54c7c6230f0ea1dd2803513c1e09ad2a5292bcdd26c97534e098114f02e156	HOD	\N	11	HOD Mechanical Engineering	hod.mech@mitmysore.in	\N	EMP-HOD.MECH	Head of Department	ACTIVE	\N	system	2026-11-18 23:30:12.506505+05:30
\.


--
-- Data for Name: answer; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.answer (attempt_id, exam_id, "position", choice, review, version) FROM stdin;
\.


--
-- Data for Name: answer_key_correction; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.answer_key_correction (id, session_id, subject_id, question_uid, question_text, original_correct, proposed_correct, reason, status, submitted_by, submitted_at, decided_by, decided_at, decision_reason) FROM stdin;
\.


--
-- Data for Name: assignment; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.assignment (exam_id, student_id) FROM stdin;
\.


--
-- Data for Name: attempt; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.attempt (id, exam_id, student_id, started, deadline, last_seen, submitted, reason, score, pending) FROM stdin;
\.


--
-- Data for Name: audit; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.audit (id, happened, actor, action, entity, detail) FROM stdin;
1	2026-11-18 23:22:58.081717+05:30	1	COE_LOGIN_V1	account:1	COE logged in via V1 Auth API
2	2026-11-18 23:30:44.870621+05:30	3	COE_LOGIN_V1	account:3	COE logged in via V1 Auth API
3	2026-11-18 23:30:48.582044+05:30	1	USER_LOGIN_V1	account:1	Logged in via V1 Auth API
4	2026-11-18 23:30:52.240653+05:30	2	USER_LOGIN_V1	account:2	Logged in via V1 Auth API
5	2026-11-18 23:30:55.916103+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
6	2026-11-18 23:30:59.881332+05:30	4	USER_LOGIN_V1	account:4	Logged in via V1 Auth API
7	2026-11-18 23:32:57.854857+05:30	15	SECURITY_UNLOCK_APPROVED	session:11:student:4MH25CS021	Invigilator override approved (total violations: 0)
8	2026-11-18 23:36:26.475672+05:30	15	SECURITY_UNLOCK_APPROVED	session:11:student:4MH25CS021	Invigilator override approved (total violations: 0)
9	2026-11-18 23:36:52.903811+05:30	15	SECURITY_UNLOCK_APPROVED	session:11:student:4MH25CS021	Invigilator override approved (total violations: 0)
10	2026-11-18 23:37:02.993424+05:30	15	STUDENT_EXAM_SUBMITTED	exam_submission:11:4MH25CS021	{"success":true,"status":"SUBMITTED","completionState":"COMPLETED","confirmationReference":"CONF-MITM-47972B4D","confirmationCode":"CONF-MITM-47972B4D","examinationId":"11","sessionId":"11","studentUsn":"4MH25CS021","studentName":"Candidate 4MH25CS021","department":"Civil Engineering","semester":"4","section":"A","subjectCode":"CS401","subjectName":"Database Management Systems","examinationType":"Main Lab Examination","assignedWorkstationId":"PC-01","submittedAt":"2026-11-18T18:07:02.990703200Z","submissionTrigger":"MANUAL","totalQuestions":30,"answeredCount":0,"totalAnswered":0,"unansweredCount":30}
11	2026-11-18 23:38:46.079245+05:30	1	USER_LOGIN_V1	account:1	Logged in via V1 Auth API
12	2026-11-18 23:42:09.353764+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
13	2026-11-18 23:43:48.794327+05:30	5	CREATE_SUBJECT	subject:1	Created MH25CS003 - OS
14	2026-11-18 23:44:16.685095+05:30	5	ADD_SECTION	academic_group:45	Added Section C to Sem 5
15	2026-11-18 23:45:20.301751+05:30	5	UPLOAD_STUDENT_LIST	academic_group:45	Uploaded 30 students
16	2026-11-18 23:54:56.384906+05:30	3	COE_LOGIN_V1	account:3	COE logged in via V1 Auth API
17	2026-11-19 00:12:55.594525+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
18	2026-11-19 00:13:03.681663+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
19	2026-11-19 00:13:28.35855+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
20	2026-11-19 00:13:38.086768+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
21	2026-11-19 00:14:36.931259+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
22	2026-11-19 00:21:30.16329+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
23	2026-11-19 00:21:41.61131+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
24	2026-11-19 00:31:07.997619+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
25	2026-11-19 00:32:56.327212+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
26	2026-11-19 00:55:09.81498+05:30	1	USER_LOGIN_V1	account:1	Logged in via V1 Auth API
27	2026-11-19 00:55:38.538809+05:30	1	USER_LOGIN_V1	account:1	Logged in via V1 Auth API
28	2026-11-19 00:59:45.722118+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
29	2026-11-19 01:00:01.513323+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
30	2026-11-19 01:00:12.228726+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
31	2026-11-19 01:00:28.375747+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
32	2026-11-19 01:00:28.624963+05:30	5	ADD_INDIVIDUAL_STUDENT	student_roster:4MH24CS001	Added student 4MH24CS001 to Section A
33	2026-11-19 01:00:59.834152+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
34	2026-11-19 01:02:10.025593+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
35	2026-11-19 01:04:38.87601+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
36	2026-11-19 01:06:38.659029+05:30	5	ADD_INDIVIDUAL_STUDENT	student_roster:4MH24CS099	Added student 4MH24CS099 to Section A
37	2026-11-19 01:08:25.359705+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
38	2026-11-19 01:08:25.613364+05:30	5	UPLOAD_STUDENT_LIST	academic_group:2	Uploaded 2 students
39	2026-11-19 01:12:04.422545+05:30	1	USER_LOGIN_V1	account:1	Logged in via V1 Auth API
40	2026-11-19 01:12:55.77982+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
41	2026-11-19 01:12:56.108992+05:30	5	ADD_SECTION	academic_group:68	Added Section E to Sem 5
42	2026-11-19 01:16:59.604588+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
45	2026-11-19 01:20:29.231766+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
46	2026-11-19 01:20:29.919699+05:30	5	HOD_QUESTION_SET_PUBLISHED	subject_publication:3	{"id":"PUB-3-1","generationId":"GEN-3-1795031429724","subjectId":"3","subjectCode":"21CS52","subjectName":"Data Structures and Algorithms","departmentId":"2","semesterNumber":5,"revisionNumber":"R1","questionBankRevisionId":"QBR-1-150","blueprintRevisionId":"BPR-30","blueprint":{"totalQuestions":30,"totalQuestionsPerSet":30,"moduleDistribution":{"1":6,"2":6,"3":6,"4":6,"5":6}},"poolQuestionCount":150,"setsGeneratedCount":5,"totalUniqueQuestionsAllocated":150,"setStatuses":[{"setNumber":1,"setLabel":"Set 1","questionCount":30,"totalQuestions":30,"status":"Available","publicationStatus":"Published"},{"setNumber":2,"setLabel":"Set 2","questionCount":30,"totalQuestions":30,"status":"Available","publicationStatus":"Published"},{"setNumber":3,"setLabel":"Set 3","questionCount":30,"totalQuestions":30,"status":"Available","publicationStatus":"Published"},{"setNumber":4,"setLabel":"Set 4","questionCount":30,"totalQuestions":30,"status":"Available","publicationStatus":"Published"},{"setNumber":5,"setLabel":"Set 5","questionCount":30,"totalQuestions":30,"status":"Available","publicationStatus":"Published"}],"status":"Published","publishedBy":"hod.cse","publishedAt":"2026-11-18T19:50:29.914230100Z","notes":"Board of Studies approved sets for 21CS52"}
47	2026-11-19 01:20:29.924495+05:30	5	PUBLISH_QUESTION_SETS	question_bank:1	Published 5 Disjoint Question Sets (R1) to COE
48	2026-11-19 01:38:12.868224+05:30	16	STUDENT_EXAM_SUBMITTED	exam_submission:4:4MH24CS001	{"success":true,"status":"SUBMITTED","completionState":"COMPLETED","confirmationReference":"CONF-MITM-38EC3C6B","confirmationCode":"CONF-MITM-38EC3C6B","examinationId":"4","sessionId":"4","studentUsn":"4MH24CS001","studentName":"Test Student 1","department":"Computer Science & Engineering","semester":"5","section":"A","subjectCode":"21CS52","subjectName":"Data Structures and Algorithms","examinationType":"Main Lab Examination","assignedWorkstationId":"PC-01","submittedAt":"2026-11-18T20:08:12.864913100Z","submissionTrigger":"MANUAL","totalQuestions":30,"answeredCount":1,"totalAnswered":1,"unansweredCount":29}
49	2026-11-19 01:38:53.989319+05:30	16	POST_SUBMISSION_RELOGIN_BLOCKED	exam_submission:4:4MH24CS001	Blocked post-submission re-login attempt by 4MH24CS001 on workstation PC-01
50	2026-11-19 01:42:13.377992+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
51	2026-11-19 01:43:06.065995+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
52	2026-11-19 01:48:13.584223+05:30	3	COE_LOGIN_V1	account:3	COE logged in via V1 Auth API
53	2026-11-19 01:48:50.065985+05:30	3	COE_LOGIN_V1	account:3	COE logged in via V1 Auth API
54	2026-11-19 01:56:30.31807+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
55	2026-11-19 02:03:02.811101+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
56	2026-11-19 02:03:31.055563+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
57	2026-11-19 02:03:51.374296+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
58	2026-11-19 02:04:21.424288+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
59	2026-11-19 02:04:37.919116+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
60	2026-11-19 02:05:29.167412+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
61	2026-11-19 02:11:39.307765+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
62	2026-11-19 02:12:33.100186+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
63	2026-11-19 02:14:08.319994+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
64	2026-11-19 02:14:20.131063+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
65	2026-11-19 02:14:34.558951+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
66	2026-11-19 02:14:46.104786+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
67	2026-11-19 02:15:05.904999+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
68	2026-11-19 02:15:10.744386+05:30	5	BULK_UPLOAD_QUESTIONS	question_bank:4	Imported 0 questions into question bank (60 skipped duplicates)
69	2026-11-19 02:15:57.829541+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
70	2026-11-19 02:30:45.193427+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
71	2026-11-19 02:34:35.038647+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
72	2026-11-19 02:34:52.650862+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
73	2026-11-19 02:35:28.295751+05:30	5	USER_LOGIN_V1	account:5	Logged in via V1 Auth API
74	2026-11-19 02:38:44.049192+05:30	5	BULK_UPLOAD_QUESTIONS	question_bank:1	Imported 600 questions into question bank (0 skipped duplicates)
\.


--
-- Data for Name: bank; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.bank (id, owner_id, subject_id, title, state) FROM stdin;
\.


--
-- Data for Name: bank_scope; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.bank_scope (bank_id, group_id) FROM stdin;
\.


--
-- Data for Name: computer_assignment; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.computer_assignment (id, session_id, computer_number, assigned_version_letter) FROM stdin;
\.


--
-- Data for Name: course_outcome_review; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.course_outcome_review (id, submission_id, reviewed_by, decision, comments, reviewed_at) FROM stdin;
\.


--
-- Data for Name: course_outcome_revision; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.course_outcome_revision (id, submission_id, revision_number, file_name, file_size_bytes, file_hash_sha256, pdf_blob, uploaded_by, uploaded_at) FROM stdin;
\.


--
-- Data for Name: course_outcome_statement; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.course_outcome_statement (id, revision_id, co_code, description, bloom_level, target_percentage) FROM stdin;
\.


--
-- Data for Name: course_outcome_submission; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.course_outcome_submission (id, subject_id, department_id, academic_session, semester, current_revision, status, created_by, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.department (id, code, name, created_at) FROM stdin;
1	CIVIL	Civil Engineering	2026-11-18 23:27:40.634783+05:30
2	CSE	Computer Science & Engineering	2026-11-18 23:27:40.638235+05:30
3	CSE-AI	CSE - Artificial Intelligence	2026-11-18 23:27:40.639084+05:30
4	CSE-DS	CSE - Data Science	2026-11-18 23:27:40.639142+05:30
5	CSE-BS	CSE - Business Systems	2026-11-18 23:27:40.639188+05:30
6	CSE-AIML	CSE - AI & ML	2026-11-18 23:27:40.639234+05:30
7	CSE-IOTCS	CSE - IoT & Cyber Security incl. Blockchain	2026-11-18 23:27:40.639272+05:30
8	COMP	Computer Engineering	2026-11-18 23:27:40.639321+05:30
9	ECE	Electronics & Communication Engineering	2026-11-18 23:27:40.639374+05:30
10	ISE	Information Science & Engineering	2026-11-18 23:27:40.639414+05:30
11	MECH	Mechanical Engineering	2026-11-18 23:27:40.639477+05:30
\.


--
-- Data for Name: exam; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.exam (id, title, instructions, bank_id, mode, duration, attempt_limit, opens, closes, pass_marks, released) FROM stdin;
\.


--
-- Data for Name: exam_question; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.exam_question (exam_id, "position", prompt, options, correct, explanation, topic, difficulty, marks, penalty) FROM stdin;
\.


--
-- Data for Name: examination_cycle; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.examination_cycle (id, title, academic_session, cycle_type, created_by, created_at) FROM stdin;
1	Odd Semester Main Examination 2026-27	2026-27	REGULAR	5	2026-11-19 01:20:29.930507+05:30
\.


--
-- Data for Name: examination_session; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.examination_session (id, cycle_id, subject_id, department_id, group_id, session_date, sitting, start_time, end_time, duration_minutes, assigned_lab, selected_paper_id, status, created_by, frozen_at, created_at, total_marks, passing_marks, cancellation_reason, is_cancelled, package_revision) FROM stdin;
1	1	3	2	2	2026-11-19	MORNING	00:00:00	23:59:59	45	Lab 1	5	SCHEDULED	5	\N	2026-11-19 01:20:29.950851+05:30	30.00	12.00	\N	f	1
2	1	3	2	13	2026-11-19	MORNING	00:00:00	23:59:59	45	Lab 1	5	SCHEDULED	5	\N	2026-11-19 01:20:29.963008+05:30	30.00	12.00	\N	f	1
3	1	3	2	45	2026-11-19	MORNING	00:00:00	23:59:59	45	Lab 1	5	SCHEDULED	5	\N	2026-11-19 01:20:29.966811+05:30	30.00	12.00	\N	f	1
4	1	3	2	68	2026-11-19	MORNING	00:00:00	23:59:59	45	Lab 1	5	SCHEDULED	5	\N	2026-11-19 01:20:29.970381+05:30	30.00	12.00	\N	f	1
\.


--
-- Data for Name: faculty_scope; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.faculty_scope (faculty_id, group_id, subject_id) FROM stdin;
\.


--
-- Data for Name: generated_paper; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.generated_paper (id, bank_id, paper_number, title, status, created_at) FROM stdin;
5	1	1	Set 1	READY	2026-11-19 01:20:29.756774+05:30
6	1	2	Set 2	READY	2026-11-19 01:20:29.827424+05:30
7	1	3	Set 3	READY	2026-11-19 01:20:29.849442+05:30
8	1	4	Set 4	READY	2026-11-19 01:20:29.870472+05:30
\.


--
-- Data for Name: generated_paper_question; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.generated_paper_question (paper_id, question_id, module_number, paper_position) FROM stdin;
5	1	1	1
5	2	1	2
5	3	1	3
5	4	1	4
5	5	1	5
5	6	1	6
5	31	2	7
5	32	2	8
5	33	2	9
5	34	2	10
5	35	2	11
5	36	2	12
5	61	3	13
5	62	3	14
5	63	3	15
5	64	3	16
5	65	3	17
5	66	3	18
5	91	4	19
5	92	4	20
5	93	4	21
5	94	4	22
5	95	4	23
5	96	4	24
5	121	5	25
5	122	5	26
5	123	5	27
5	124	5	28
5	125	5	29
5	126	5	30
6	7	1	1
6	8	1	2
6	9	1	3
6	10	1	4
6	11	1	5
6	12	1	6
6	37	2	7
6	38	2	8
6	39	2	9
6	40	2	10
6	41	2	11
6	42	2	12
6	67	3	13
6	68	3	14
6	69	3	15
6	70	3	16
6	71	3	17
6	72	3	18
6	97	4	19
6	98	4	20
6	99	4	21
6	100	4	22
6	101	4	23
6	102	4	24
6	127	5	25
6	128	5	26
6	129	5	27
6	130	5	28
6	131	5	29
6	132	5	30
7	13	1	1
7	14	1	2
7	15	1	3
7	16	1	4
7	17	1	5
7	18	1	6
7	43	2	7
7	44	2	8
7	45	2	9
7	46	2	10
7	47	2	11
7	48	2	12
7	73	3	13
7	74	3	14
7	75	3	15
7	76	3	16
7	77	3	17
7	78	3	18
7	103	4	19
7	104	4	20
7	105	4	21
7	106	4	22
7	107	4	23
7	108	4	24
7	133	5	25
7	134	5	26
7	135	5	27
7	136	5	28
7	137	5	29
7	138	5	30
8	19	1	1
8	20	1	2
8	21	1	3
8	22	1	4
8	23	1	5
8	24	1	6
8	49	2	7
8	50	2	8
8	51	2	9
8	52	2	10
8	53	2	11
8	54	2	12
8	79	3	13
8	80	3	14
8	81	3	15
8	82	3	16
8	83	3	17
8	84	3	18
8	109	4	19
8	110	4	20
8	111	4	21
8	112	4	22
8	113	4	23
8	114	4	24
8	139	5	25
8	140	5	26
8	141	5	27
8	142	5	28
8	143	5	29
8	144	5	30
\.


--
-- Data for Name: lab_result_import; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.lab_result_import (id, session_id, raw_payload_json, signature_hex, total_candidates, attended, absent, highest_marks, average_marks, pass_percentage, status, imported_at, imported_by, approved_at, approved_by, released_at, released_by) FROM stdin;
\.


--
-- Data for Name: paper_version; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.paper_version (id, session_id, paper_id, version_letter, created_at) FROM stdin;
\.


--
-- Data for Name: paper_version_question; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.paper_version_question (version_id, question_id, question_uid, display_position, shuffled_options, shuffled_correct, marks) FROM stdin;
\.


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.question (id, bank_id, prompt, options, correct, explanation, topic, difficulty, marks, penalty) FROM stdin;
\.


--
-- Data for Name: question_bank; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.question_bank (id, department_id, subject_id, academic_session, semester, title, created_by, revision_number, state, total_questions, finalized_at, finalized_by, created_at) FROM stdin;
2	2	5	2025-26	3	Data Structures & Algorithms Question Bank (150 MCQs)	5	1	FINALIZED	150	\N	\N	2026-11-19 00:19:39.65031+05:30
3	2	4	2025-26	5	Logic Design & Computer Organization Question Bank (60 MCQs)	5	1	FINALIZED	60	\N	\N	2026-11-19 00:19:39.715696+05:30
5	2	1	2025-26	5	Operating Systems Complete Question Bank (150 MCQs)	5	1	FINALIZED	150	\N	\N	2026-11-19 00:19:39.771029+05:30
4	2	6	2025-26	3	Logic Design & Computer Organization Question Bank (60 MCQs)	5	1	FINALIZED	60	\N	\N	2026-11-19 00:19:39.74002+05:30
1	2	3	2025-26	5	Data Structures & Algorithms Question Bank (150 MCQs)	5	1	FINALIZED	750	2026-11-19 01:20:29.912711+05:30	5	2026-11-19 00:19:39.561257+05:30
\.


--
-- Data for Name: question_bank_item; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.question_bank_item (id, bank_id, question_uid, module_number, prompt, options, correct, explanation, marks, created_at, has_images, stem_images, option_images) FROM stdin;
1	1	DSA-M1-Q001	1	According to the notes, a data structure can be expressed as:	{"Data Structure = Organized data + Allowed operations","Data Structure = Algorithm + Flowchart","Data Structure = Program + Compiler","Data Structure = Input + Output"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.565758+05:30	f	[]	[]
2	1	DSA-M1-Q002	1	A field K whose values uniquely determine a record in a file is called a:	{"Primary key","Group item","Entity set","Variable-length record"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.573135+05:30	f	[]	[]
3	1	DSA-M1-Q003	1	Which of the following is a primitive data structure?	{Array,Integer,Tree,Graph}	2	Official answer key: B	1.00	2026-11-19 00:19:39.573528+05:30	f	[]	[]
4	1	DSA-M1-Q004	1	Which of the following is a non-linear data structure?	{Stack,Queue,"Linked list",Tree}	4	Official answer key: D	1.00	2026-11-19 00:19:39.573928+05:30	f	[]	[]
5	1	DSA-M1-Q005	1	In data structure operations, merging means:	{"Arranging all data items in ascending or descending order","Combining the data items of two sorted lists into a single list","Finding whether a desired data item is present in a list","Reserving memory for the program elements"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.574407+05:30	f	[]	[]
6	1	DSA-M1-Q006	1	A pointer is:	{"A variable that can store only integer constants","A special variable that contains the address of a memory location","A function that allocates memory at run time","A data type that stores a sequence of characters"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.574823+05:30	f	[]	[]
7	1	DSA-M1-Q007	1	A pointer that has not been initialized with a valid address is known as a:	{"NULL pointer","Void pointer","Dangling (wild) pointer","Pointer to pointer"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.575194+05:30	f	[]	[]
8	1	DSA-M1-Q008	1	Memory requested at run time using malloc() and calloc() is allocated from the:	{Stack,"Static (compile-time) data area","CPU registers",Heap}	4	Official answer key: D	1.00	2026-11-19 00:19:39.575457+05:30	f	[]	[]
9	1	DSA-M1-Q009	1	Which dynamic memory allocation function initializes every allocated block to zero?	{malloc(),realloc(),calloc(),free()}	3	Official answer key: C	1.00	2026-11-19 00:19:39.575712+05:30	f	[]	[]
10	1	DSA-M1-Q010	1	Which statement correctly distinguishes calloc() from malloc()?	{"calloc() takes one argument and leaves the allocated memory uninitialized","calloc() takes two arguments (number of elements, element size) and initializes the memory to zero","calloc() releases previously allocated memory, while malloc() allocates it","calloc() allocates memory at compile time, while malloc() does it at run time"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.576036+05:30	f	[]	[]
11	1	DSA-M1-Q011	1	If realloc() cannot extend an existing memory block in place, it:	{"Leaves the old block unchanged and returns a pointer to its first byte","Frees the old block and returns an uninitialized block without copying any data","Allocates a new block, copies the old contents into it and frees the old block","Always terminates the program with a run-time error"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.576329+05:30	f	[]	[]
12	1	DSA-M1-Q012	1	What is the output of the following code? int a[5] = {10, 20, 30, 40, 50}; int *p = a; printf("%d %d", *(p + 2), 3[a]);	{"20 40","30 30","Compilation error","30 40"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.576665+05:30	f	[]	[]
13	1	DSA-M1-Q013	1	Which declaration creates an array of 5 pointers to integers?	{"int *a;","int a[5];","int *a[5];","int **a;"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.576959+05:30	f	[]	[]
14	1	DSA-M1-Q014	1	Binary search is applied on the sorted array {2, 5, 8, 12, 16, 23, 38, 56, 72, 91} with low = 0, high = 9 and mid = (low + high)/2 to find the key 23. How many times is mid computed before the key is found?	{3,2,4,5}	1	Official answer key: A	1.00	2026-11-19 00:19:39.577223+05:30	f	[]	[]
15	1	DSA-M1-Q015	1	What is the output of the following code that inserts an item into an array? int a[10] = {5, 10, 15, 20}, n = 4, pos = 2, item = 12, i; for (i = n - 1; i >= pos; i--) a[i + 1] = a[i]; a[pos] = item; n = n + 1; for (i = 0; i < n; i++) printf("%d ", a[i]);	{"5 10 15 12 20","5 10 12 15 20","12 5 10 15 20","5 10 12 20 20"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.577487+05:30	f	[]	[]
16	1	DSA-M1-Q016	1	What is the output of the following code? int m[2][3] = { {1, 4, 2}, {3, 6, 8} }; int i, j, s = 0; for (i = 0; i < 2; i++) for (j = 0; j < 3; j++) if (i != j) s += m[i][j]; printf("%d", s);	{24,7,21,17}	4	Official answer key: D	1.00	2026-11-19 00:19:39.577751+05:30	f	[]	[]
17	1	DSA-M1-Q017	1	To create a 2-D integer array of rows x cols dynamically using the pointer-to-pointer method of the notes, how many MALLOC (malloc) calls are needed in total?	{1,"rows x cols","rows + 1","cols + 1"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.578028+05:30	f	[]	[]
18	1	DSA-M1-Q018	1	What is the output of the following code? int a = 10; int *p1 = &a; int **p2 = &p1; **p2 = **p2 + 5; printf("%d %d", a, *p1);	{"10 15","15 10","10 10","15 15"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.578305+05:30	f	[]	[]
19	1	DSA-M1-Q019	1	Which of the following structure definitions results in a syntax error?	{"struct str1 { int i; char c; } var1 = {10, 'A'};","struct str1 { int i = 10; char c = 'A'; };","struct str1 { int i; char c; }; struct str1 var1 = {10, 'A'};","struct str1 { int i; char c; float f; } s1, s2;"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.578568+05:30	f	[]	[]
20	1	DSA-M1-Q020	1	Which of the following is a self-referential structure?	{"struct node { int data; struct node next; };","struct node { int data; int *next; };","struct node { int data; };","struct node { int data; struct node *next; };"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.578835+05:30	f	[]	[]
21	1	DSA-M1-Q021	1	The size of a union is equal to the size of its:	{"Largest member","Smallest member","Sum of all members","First member"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.579093+05:30	f	[]	[]
22	1	DSA-M1-Q022	1	Which statement about structures and unions is correct?	{"Altering one member of a structure alters the other members, but not in a union","In a structure each member has its own storage, whereas all members of a union share the same memory","A union allocates memory equal to the sum of the sizes of its members","All members of a union can be initialized at once, but only the first member of a structure can be"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.579399+05:30	f	[]	[]
23	1	DSA-M1-Q023	1	Using the addpolynomial() logic of the notes (terms are stored in decreasing order of exponent and a term is attached only when its coefficient is non-zero), the sum of A(x) = 5x^3 + 4x^2 + 2 and B(x) = 3x^3 - 4x^2 + 7x is:	{"8x^3 + 0x^2 + 7x + 2","8x^3 + 8x^2 + 7x + 2","2x^3 + 8x^2 + 7x + 2","8x^3 + 7x + 2"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.579832+05:30	f	[]	[]
24	1	DSA-M1-Q024	1	A sparse matrix is a matrix that has:	{"A greater number of zero elements than non-zero elements","Only non-zero elements","More rows than columns","Non-zero elements only on its diagonal"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.583066+05:30	f	[]	[]
25	1	DSA-M1-Q025	1	In the (row, column, value) triple representation of a sparse matrix, the first entry A[0] stores:	{"The first non-zero element of the matrix","The number of zero elements, rows and columns","The number of rows, the number of columns and the number of non-zero terms","The largest element and its row and column"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.583578+05:30	f	[]	[]
26	1	DSA-M1-Q026	1	The 4 x 4 sparse matrix A shown below is stored as triples with B[0] = (4, 4, 5) for its transpose. Using the column-by-column transpose algorithm of the notes, what is B[4]? | 0  0  3  0 | A = | 0  0  0  8 | | 1  0  3  0 | | 0  0  7  0 |	{"(3, 1, 8)","(2, 3, 7)","(2, 2, 3)","(0, 2, 1)"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.584129+05:30	f	[]	[]
27	1	DSA-M1-Q027	1	For a sparse matrix with c columns and t non-zero terms, the transpose function of the notes (which scans all t terms once for every column) runs in time:	{"O(c x t)","O(c + t)",O(t),O(c)}	1	Official answer key: A	1.00	2026-11-19 00:19:39.584592+05:30	f	[]	[]
28	1	DSA-M1-Q028	1	A string in C is a sequence of characters terminated by the:	{"Null character '\\\\0'","Newline character '\\\\n'","Space character","Tab character '\\\\t'"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.585168+05:30	f	[]	[]
29	1	DSA-M1-Q029	1	What is the output of the following code? #include <string.h> char s[] = "Hello"; printf("%d", (int)(sizeof(s) + strlen(s)));	{10,12,11,5}	3	Official answer key: C	1.00	2026-11-19 00:19:39.585647+05:30	f	[]	[]
30	1	DSA-M1-Q030	1	What is the output of the following code? char a[20] = "Data"; char b[] = "Struct"; strcat(a, b); printf("%s %d", a, (int)strlen(a));	{"DataStruct 10","DataStruct 11","StructData 10","Data 4"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.586076+05:30	f	[]	[]
31	1	DSA-M2-Q031	2	In a stack, insertions (push) and deletions (pop) are made at one end called the:	{Top,Front,Rear,Base}	1	Official answer key: A	1.00	2026-11-19 00:19:39.586517+05:30	f	[]	[]
32	1	DSA-M2-Q032	2	Trying to push an element onto a stack that is already full is called:	{Overflow,Underflow,Deadlock,Wrap-around}	1	Official answer key: A	1.00	2026-11-19 00:19:39.586933+05:30	f	[]	[]
33	1	DSA-M2-Q033	2	Which auxiliary stack operation returns the last inserted element without removing it?	{Pop(),Push(),Top(),Size()}	3	Official answer key: C	1.00	2026-11-19 00:19:39.587343+05:30	f	[]	[]
34	1	DSA-M2-Q034	2	When a stack is implemented using an array, the value of top for an empty stack is initialized to:	{-1,0,1,MAX_STACK_SIZE}	1	Official answer key: A	1.00	2026-11-19 00:19:39.587738+05:30	f	[]	[]
35	1	DSA-M2-Q035	2	When a function is invoked, its stack frame placed on the system stack initially contains:	{"Only the local variables of the invoking function","The source code of the invoked function","A pointer to the previous stack frame and the return address","The final return value and an overflow flag"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.588222+05:30	f	[]	[]
36	1	DSA-M2-Q036	2	For an array-based stack of size MAX_STACK_SIZE, the stack is full when:	{"top < 0","top >= MAX_STACK_SIZE - 1","top == MAX_STACK_SIZE","top == 0"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.58863+05:30	f	[]	[]
37	1	DSA-M2-Q037	2	In the array-doubling strategy for a stack stored in a dynamic array, the total time spent on all array doublings over n push operations is:	{O(n^2),"O(log n)",O(n),"O(n log n)"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.589159+05:30	f	[]	[]
38	1	DSA-M2-Q038	2	In the infix-to-postfix algorithm using in-stack precedence (isp) and incoming precedence (icp), the left parenthesis has:	{"High in-stack precedence and low incoming precedence","Low in-stack precedence (isp = 0) but high incoming precedence (icp = 20)","Equal in-stack and incoming precedence of 0","Equal in-stack and incoming precedence of 20"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.589548+05:30	f	[]	[]
39	1	DSA-M2-Q039	2	In which notation does the operator appear after its operands, as in A B +?	{"Postfix (reverse Polish) notation","Prefix (Polish) notation","Infix notation","Parenthesized infix notation"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.589984+05:30	f	[]	[]
40	1	DSA-M2-Q040	2	The postfix form of the infix expression a*(b+c)*d is:	{ab*c+d*,abcd+**,abc+*d*,abc*+d*}	3	Official answer key: C	1.00	2026-11-19 00:19:39.590468+05:30	f	[]	[]
41	1	DSA-M2-Q041	2	The postfix form of the infix expression a+b*c-d/e is:	{ab+c*de/-,abc*de/+-,abcde*/+-,abc*+de/-}	4	Official answer key: D	1.00	2026-11-19 00:19:39.591045+05:30	f	[]	[]
42	1	DSA-M2-Q042	2	What is the value of the postfix expression 5 6 2 + * 12 4 / -?	{37,-37,43,3}	1	Official answer key: A	1.00	2026-11-19 00:19:39.591443+05:30	f	[]	[]
43	1	DSA-M2-Q043	2	The prefix form of the infix expression (A + B) * C is:	{"+ A * B C","A B + C *","* A + B C","* + A B C"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.591863+05:30	f	[]	[]
44	1	DSA-M2-Q044	2	Starting with an empty stack, the operations push(3), push(6), push(9), pop(), push(12), pop(), pop() are performed. What are the values returned by Top() and Size() now?	{"Top = 6, Size = 2","Top = 3, Size = 1","Top = 12, Size = 2","Top = 9, Size = 1"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.592227+05:30	f	[]	[]
45	1	DSA-M2-Q045	2	What is the output of the following code? int stack[10], top = -1, x, y; stack[++top] = 4; stack[++top] = 7; stack[++top] = 2; x = stack[top--]; y = stack[top--]; stack[++top] = x * y; printf("%d %d", stack[top], top);	{"28 1","14 1","14 2","14 0"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.592627+05:30	f	[]	[]
68	1	DSA-M3-Q068	3	In a circular linked list, the last node points to:	{"NULL","The previous node","The first node","Itself, in every list"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.601249+05:30	f	[]	[]
46	1	DSA-M2-Q046	2	A stack uses a dynamically allocated array with an initial capacity of 1 and doubles the capacity (using realloc) whenever a push arrives while the array is full. What is the capacity after 9 pushes?	{16,9,8,18}	1	Official answer key: A	1.00	2026-11-19 00:19:39.593044+05:30	f	[]	[]
47	1	DSA-M2-Q047	2	A queue works on which of the following principles?	{"Last-In-First-Out (LIFO)",Highest-priority-last,"Random access","First-In-First-Out (FIFO)"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.593662+05:30	f	[]	[]
48	1	DSA-M2-Q048	2	In the array implementation of a linear queue (with f initialized to 0 and r to -1), the queue is empty when:	{"f < r","f > r","r == QUEUESIZE - 1","f == QUEUESIZE - 1"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.594097+05:30	f	[]	[]
49	1	DSA-M2-Q049	2	The figure shows a linear queue stored in an array with QUEUESIZE = 5, f = 2 and r = 4. What happens when insertQ(60, &r, q) is executed? q[ ] 0 1 30 2 40 3 50 4 f r	{"60 is stored at index 0","60 is stored at index 5","It prints \\"Queue Empty\\"","It prints \\"queue overflow\\" even though locations 0 and 1 are empty"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.594473+05:30	f	[]	[]
50	1	DSA-M2-Q050	2	In a circular queue implemented with an array of size QUEUESIZE, the rear is advanced during insertion using:	{"rear = rear + 1","rear = (rear - 1) % QUEUESIZE","rear = rear % QUEUESIZE + 1","rear = (rear + 1) % QUEUESIZE"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.594847+05:30	f	[]	[]
51	1	DSA-M2-Q051	2	A circular queue (QUEUESIZE = 5) uses the variables f, r and count, initially f = 0, r = -1, count = 0. The operations performed are: insert 10, 20, 30, 40; delete twice; insert 50, 60, 70. The final values of f, r and count are:	{"f = 2, r = 1, count = 5","f = 2, r = 2, count = 5","f = 0, r = 1, count = 5","f = 2, r = 1, count = 3"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.595254+05:30	f	[]	[]
52	1	DSA-M2-Q052	2	Elements 9, 4 and 6 are inserted, in this order, into an ascending priority queue. The order in which they are deleted is:	{"4, 6, 9","9, 4, 6","6, 4, 9","9, 6, 4"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.595662+05:30	f	[]	[]
53	1	DSA-M2-Q053	2	A priority queue is mainly used to implement:	{Recursion,"CPU scheduling algorithms","Binary search","Matrix multiplication"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.59607+05:30	f	[]	[]
54	1	DSA-M2-Q054	2	In a deque (double-ended queue), insertion and deletion can be performed:	{"Only at the front end","At both the front and the rear ends","Only at the rear end","Only in the middle of the queue"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.596507+05:30	f	[]	[]
55	1	DSA-M2-Q055	2	In an input-restricted deque:	{"Deletion is allowed at only one end, while insertion is allowed at both ends","Both insertion and deletion are allowed at only one end","Insertion is allowed at only one end, while deletion is allowed at both ends","Insertion is not allowed at any end"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.59688+05:30	f	[]	[]
56	1	DSA-M2-Q056	2	A deque is initially empty. The operations insertFront(1), insertRear(2), insertFront(3), insertRear(4), deleteFront(), deleteRear() are performed in order. The contents of the deque from front to rear are:	{"3, 1","2, 4","1, 2, 4","1, 2"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.597299+05:30	f	[]	[]
57	1	DSA-M2-Q057	2	In the maze problem of the notes, the maze is represented by a two-dimensional array in which:	{"Ones represent open paths and zeros represent barriers","Zeros represent open paths and ones represent barriers","Zeros represent the exit and ones the entrance","Every position stores the number of its neighbours"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.59768+05:30	f	[]	[]
58	1	DSA-M2-Q058	2	To avoid checking border conditions in the maze program, the maze is surrounded by a border of ones. An m x p maze therefore requires an array of size:	{"m x p","(m + 1) x (p + 1)","(m + 2) x (p + 2)","(m + 2) x p"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.59805+05:30	f	[]	[]
59	1	DSA-M2-Q059	2	A 6 x 8 maze is stored in an array with a border of ones. If the entrance is at maze[1][1], the exit is at:	{maze[7][9],maze[5][7],maze[8][10],maze[6][8]}	4	Official answer key: D	1.00	2026-11-19 00:19:39.598646+05:30	f	[]	[]
60	1	DSA-M2-Q060	2	Since each position of an m x p maze is visited no more than once, the worst-case computing time of the maze-path algorithm is:	{"O(m + p)",O((mp)^2),O(mp),"O(log mp)"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.599077+05:30	f	[]	[]
61	1	DSA-M3-Q061	3	Each node of a singly linked list consists of:	{"A data field, a prev field and a next field","Only a data field","Two data fields and a counter","A data field and a next (link) field"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.599401+05:30	f	[]	[]
62	1	DSA-M3-Q062	3	In a singly linked list, the next field of the last node contains:	{"The address of the first node","The address of the previous node","NULL","The value zero as data"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.599673+05:30	f	[]	[]
63	1	DSA-M3-Q063	3	Which disadvantage of arrays is overcome by using linked lists?	{"Slow random access to the i-th element","Use of a common name for all the elements","Inability to store more than one data type","Fixed size, and costly insertion and deletion at a given position"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.599931+05:30	f	[]	[]
64	1	DSA-M3-Q064	3	While traversing a singly linked list with a pointer current that starts at head, the traversal loop stops when:	{"current becomes NULL","current becomes equal to head again","current->data becomes zero","current->next points to head"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.600188+05:30	f	[]	[]
65	1	DSA-M3-Q065	3	How many types of linked lists are listed in the notes?	{"2 (singly and doubly)","4 (singly, doubly, circular singly and circular doubly)","3 (singly, doubly and circular)",5}	2	Official answer key: B	1.00	2026-11-19 00:19:39.600448+05:30	f	[]	[]
66	1	DSA-M3-Q066	3	Each node of a doubly linked list consists of:	{"Data and a pointer to the next node","Data and a pointer to the previous node","Data, a pointer to the head and a pointer to the tail","Data, a pointer to the previous node and a pointer to the next node"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.600713+05:30	f	[]	[]
67	1	DSA-M3-Q067	3	Which linked list supports traversal in both the forward and backward directions?	{"Singly linked list","Doubly linked list","Circular singly linked list","Singly linked list with a tail pointer"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.600982+05:30	f	[]	[]
69	1	DSA-M3-Q069	3	In a stack implemented using a singly linked list, push() inserts the new node at the:	{"End of the list","Beginning of the list (top)","Middle of the list","Position given by the data value"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.601622+05:30	f	[]	[]
70	1	DSA-M3-Q070	3	Elements of a linked list are accessed:	{"Randomly using an index","Sequentially, starting from the head","Only from the tail","Using the memory address of the array base"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.602126+05:30	f	[]	[]
71	1	DSA-M3-Q071	3	Which of the following correctly compares arrays and linked lists?	{"Array: non-contiguous memory and sequential access; Linked list: contiguous memory and random access","Both arrays and linked lists use contiguous memory and random access","Array: contiguous memory and random access; Linked list: non-contiguous memory and sequential access","Both arrays and linked lists use non-contiguous memory and sequential access"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.602393+05:30	f	[]	[]
72	1	DSA-M3-Q072	3	In the memory representation of a linked list, the nodes and the pointer variable head declared inside main() are stored, respectively, in the:	{"Heap and stack","Stack and heap","Heap and heap","Stack and stack"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.6027+05:30	f	[]	[]
73	1	DSA-M3-Q073	3	The time required to insert a new node at the end of a singly linked list when only the head pointer is available is:	{O(1),"O(log n)",O(n^2),O(n)}	4	Official answer key: D	1.00	2026-11-19 00:19:39.603002+05:30	f	[]	[]
74	1	DSA-M3-Q074	3	The main advantage of implementing a stack with a linked list instead of an array is that:	{"Elements can be accessed randomly using an index","Memory is allocated contiguously","No pointer is needed for the top","The stack can grow and shrink dynamically without a fixed maximum capacity"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.603327+05:30	f	[]	[]
75	1	DSA-M3-Q075	3	While inserting a new node at the beginning of a non-empty doubly linked list, which statement is required in addition to new_node->next = head?	{"head->next = new_node","new_node->prev = head","head->prev = new_node","head->prev = NULL"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.603602+05:30	f	[]	[]
76	1	DSA-M3-Q076	3	When only a pointer to the node to be deleted is given, the time for deletion in a singly linked list and in a doubly linked list is, respectively:	{"O(n) and O(1)","O(1) and O(n)","O(1) and O(1)","O(n) and O(n)"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.60387+05:30	f	[]	[]
77	1	DSA-M3-Q077	3	Which of the following is a disadvantage of a doubly linked list compared with a singly linked list?	{"It cannot be traversed in the backward direction","Insertion at the beginning requires traversing the whole list","Every node needs extra memory for the additional prev pointer","It cannot be used to implement a stack or a queue"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.604138+05:30	f	[]	[]
78	1	DSA-M3-Q078	3	In a circular singly linked list represented by a pointer last to its last node, the first node is accessed as:	{last->prev,last->next->next,last,last->next}	4	Official answer key: D	1.00	2026-11-19 00:19:39.604405+05:30	f	[]	[]
79	1	DSA-M3-Q079	3	In a circular doubly linked list, the prev pointer of the first node stores the address of:	{"The last node","NULL","The second node","The first node itself"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.60468+05:30	f	[]	[]
80	1	DSA-M3-Q080	3	Which of the following is a disadvantage of circular linked lists?	{"Traversal may enter an infinite loop unless a proper stopping condition is used","Insertion at the beginning is impossible","They cannot be used to implement a circular queue","The last node always contains NULL"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.604948+05:30	f	[]	[]
81	1	DSA-M3-Q081	3	Assume the functions of the notes are available. What is the output of the following code? struct Node* head = NULL; head = insertAtBeginning(head, 10); head = insertAtBeginning(head, 20); head = insertAtBeginning(head, 30); head = insertAtEnd(head, 40); traverseLinkedList(head);	{"10 20 30 40","40 30 20 10","30 20 10 40","30 20 40 10"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.605209+05:30	f	[]	[]
82	1	DSA-M3-Q082	3	The singly linked list in the figure is modified by the code below. What does traverseLinkedList(head) print? head = removeLastNode(head); head = removeFirstNode(head); head = deleteAtPosition(head, 2); traverseLinkedList(head); head 12 25 7 40 NULL	{"25 7",25,7,12}	2	Official answer key: B	1.00	2026-11-19 00:19:39.605473+05:30	f	[]	[]
83	1	DSA-M3-Q083	3	A stack is implemented using a singly linked list as in the notes. Starting from an empty stack, the operations push(11), push(22), push(33), pop(), push(44), push(55), pop(), pop() are performed. What does peek() return?	{11,22,33,44}	2	Official answer key: B	1.00	2026-11-19 00:19:39.605732+05:30	f	[]	[]
84	1	DSA-M3-Q084	3	Let tail point to the last node of the final list. What does backwardTraversal(tail) print after the following operations on a doubly linked list? struct Node* head = createNode(10); head = insertEnd(head, 20); head = insertEnd(head, 30); head = insertAtPosition(head, 3, 25);	{"10 20 25 30","30 20 25 10","30 25 10 20","30 25 20 10"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.605996+05:30	f	[]	[]
85	1	DSA-M3-Q085	3	A doubly linked list contains 1, 2, 3, 4, 5. The following statements are executed. If tail points to the last node of the resulting list, what does backwardTraversal(tail) print? head = delPos(head, 3); head = delLast(head); head = delHead(head);	{"4 2","2 4","5 4 2","4 2 1"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.606416+05:30	f	[]	[]
86	1	DSA-M3-Q086	3	What is the output of the following code on a circular singly linked list (insertion functions of the notes)? struct Node *last = NULL; last = insertAtBeginning(last, 10); last = insertEnd(last, 20); last = insertAtBeginning(last, 5); last = insertEnd(last, 30); printf("%d %d", last->data, last->next->data);	{"30 5","30 10","5 30","20 5"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.606687+05:30	f	[]	[]
87	1	DSA-M3-Q087	3	A circular singly linked list contains 5, 10, 20, 30 with last pointing to the node 30. After last = deleteFirstNode(last); last = deleteLastNode(last); what does printf("%d %d", last->data, last->next->data) print?	{"20 5","30 10","20 10","10 20"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.606997+05:30	f	[]	[]
88	1	DSA-M3-Q088	3	Inserting a new node between two existing nodes in the middle of a doubly linked list requires updating how many pointer fields in total?	{2,4,3,1}	2	Official answer key: B	1.00	2026-11-19 00:19:39.607271+05:30	f	[]	[]
89	1	DSA-M3-Q089	3	A singly linked list contains the two nodes 7 -> 9 -> NULL. What is the state of the list after head = removeLastNode(head); (the function of the notes)?	{"An empty list","A single node 7 whose next is NULL","A single node 9 whose next is NULL","The list is unchanged because the loop never executes"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.607541+05:30	f	[]	[]
90	1	DSA-M3-Q090	3	A singly linked list has 4 nodes. For which value of pos does insertPos(head, pos, data) of the notes print "Invalid position!"?	{6,5,3,1}	1	Official answer key: A	1.00	2026-11-19 00:19:39.608014+05:30	f	[]	[]
91	1	DSA-M4-Q091	4	Which node of a tree has no parent?	{"Root node","Leaf node","Sibling node","Internal node"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.608282+05:30	f	[]	[]
92	1	DSA-M4-Q092	4	A node with no children (a node of degree zero) is called a:	{"Root node","Internal node","Sibling node","Leaf (external or terminal) node"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.608541+05:30	f	[]	[]
93	1	DSA-M4-Q093	4	A tree with N nodes has how many edges?	{"N - 1",N,"N + 1","2N - 1"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.608804+05:30	f	[]	[]
94	1	DSA-M4-Q094	4	In the tree shown in the figure, what is the degree of node D? A B C D E F G H I J K L M	{2,4,3,1}	3	Official answer key: C	1.00	2026-11-19 00:19:39.609063+05:30	f	[]	[]
95	1	DSA-M4-Q095	4	For the tree shown in the figure, using the convention of the notes (levels, heights and depths counted in edges, with the root at level 0), the depth of node M and the height of node B are, respectively: A B C D E F G H I J K L M	{"2 and 3","4 and 2","3 and 3","3 and 2"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.609321+05:30	f	[]	[]
96	1	DSA-M4-Q096	4	In the left child - right sibling representation of a tree, each node contains:	{"A data field, a reference to its left (first) child and a reference to its right sibling","A data field and references to all of its children","A data field, a parent reference and a degree field","A data field and a reference to the root"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.609586+05:30	f	[]	[]
97	1	DSA-M4-Q097	4	A tree in which every node can have at most two children (a left child and a right child) is called a:	{"Threaded tree","General tree","Binary tree",Forest}	3	Official answer key: C	1.00	2026-11-19 00:19:39.609863+05:30	f	[]	[]
98	1	DSA-M4-Q098	4	In a strictly binary tree (full binary tree), every node has:	{"Exactly one child","Either zero or two children","At most one child","Exactly two children, with all leaves at the same level"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.61012+05:30	f	[]	[]
99	1	DSA-M4-Q099	4	In a binary tree whose root is on level 1, the maximum number of nodes on level i is:	{2^i,2^(i-1),"2i - 1",i^2}	2	Official answer key: B	1.00	2026-11-19 00:19:39.610384+05:30	f	[]	[]
100	1	DSA-M4-Q100	4	A non-empty binary tree has 7 leaf nodes. The number of nodes having two children is:	{6,7,8,3}	1	Official answer key: A	1.00	2026-11-19 00:19:39.61065+05:30	f	[]	[]
101	1	DSA-M4-Q101	4	A strictly binary tree has 15 internal nodes (all of degree 2). The total number of nodes in the tree is:	{31,30,32,16}	1	Official answer key: A	1.00	2026-11-19 00:19:39.611011+05:30	f	[]	[]
102	1	DSA-M4-Q102	4	A complete binary tree is stored in a one-dimensional array with the root at index 1. For the node at index 6, which statement is correct?	{"Parent at index 2, left child at index 12 and right child at index 13","Parent at index 3, left child at index 11 and right child at index 12","Parent at index 5, left child at index 7 and right child at index 8","Parent at index 3, left child at index 12 and right child at index 13"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.611283+05:30	f	[]	[]
103	1	DSA-M4-Q103	4	A complete binary tree with 12 nodes is stored in an array with the root at index 1. Which statement is true?	{"Node 6 has no children","Node 6 has a left child (index 12) but no right child","Node 5 has no right child","The parent of node 12 is node 5"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.611595+05:30	f	[]	[]
104	1	DSA-M4-Q104	4	The inorder traversal of a binary tree visits the nodes in the order:	{"Root, left subtree, right subtree","Left subtree, root, right subtree","Left subtree, right subtree, root","Right subtree, root, left subtree"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.611868+05:30	f	[]	[]
105	1	DSA-M4-Q105	4	Which traversal visits the root node after both of its subtrees have been visited?	{Preorder,Inorder,Postorder,Level-order}	3	Official answer key: C	1.00	2026-11-19 00:19:39.612335+05:30	f	[]	[]
106	1	DSA-M4-Q106	4	What is the postorder traversal of the binary tree shown in the figure? A B C D F G H I J K	{"I J D F B K G H C A","A B D I J F C G K H","I D J B F A G K C H","I J D F B G K H C A"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.612721+05:30	f	[]	[]
107	1	DSA-M4-Q107	4	The preorder traversal of a binary tree is A B D E C F and its inorder traversal is D B E A F C. Its postorder traversal is:	{"D B E F C A","D E B F C A","E D B F C A","D E B C F A"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.613157+05:30	f	[]	[]
108	1	DSA-M4-Q108	4	An expression tree is built from the postfix expression A B / C * D * E +. Its level-order traversal is:	{"+ * * / A B C D E","+ * E * D / C A B","A B / C * D * E +","+ * E * D C / A B"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.613546+05:30	f	[]	[]
109	1	DSA-M4-Q109	4	A binary tree has root 4 with a left child 2 and a right child 6 (both leaves). What is the output of the following function when called as trav(root)? void trav(tree_pointer p) { if (p) { printf("%d ", p->data); trav(p->left_child); trav(p->right_child); printf("%d ", p->data); } }	{"4 2 6 6 2 4","4 2 6 4","2 6 4 4 2 6","4 2 2 6 6 4"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.613907+05:30	f	[]	[]
110	1	DSA-M4-Q110	4	Level-order traversal of a binary tree is implemented using a:	{Stack,Queue,"Linked list sorted by key","Hash table"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.614728+05:30	f	[]	[]
111	1	DSA-M4-Q111	4	In the iterative inorder traversal (iter_inorder) of an n-node binary tree, each node is placed on and removed from the stack:	{"Exactly once, giving O(n) time","Exactly twice, giving O(n^2) time","log n times, giving O(n log n) time","Only if it is a leaf, giving O(log n) time"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.615108+05:30	f	[]	[]
112	1	DSA-M4-Q112	4	In a threaded binary tree node, if ptr->leftThread = TRUE, then ptr->leftChild contains:	{"A pointer to the left child","The address of the right sibling","A thread, not a pointer to the left child","Always NULL"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.615816+05:30	f	[]	[]
113	1	DSA-M4-Q113	4	A header node is assumed for all threaded binary trees in order to:	{"Store the total number of nodes of the tree","Convert the tree into a complete binary tree","Make the tree a binary search tree","Avoid loose (dangling) threads; the original tree becomes the left subtree of the header node"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.616399+05:30	f	[]	[]
114	1	DSA-M4-Q114	4	In a binary search tree, for every node:	{"Keys in its left subtree are larger and keys in its right subtree are smaller than its key","All keys in the tree are equal","Keys in its left subtree are smaller and keys in its right subtree are larger than its key","The left child is always a leaf"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.616825+05:30	f	[]	[]
115	1	DSA-M4-Q115	4	If h is the height of a binary search tree, searching for a key (recursively or iteratively) takes:	{"O(1) time","O(h) time","O(h^2) time","O(n^2) time"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.61727+05:30	f	[]	[]
116	1	DSA-M4-Q116	4	In a binary search tree, a new node is always inserted as a:	{"Root node","Internal node","Left child of the root","Leaf node"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.617743+05:30	f	[]	[]
117	1	DSA-M4-Q117	4	The keys 10, 12, 5, 4, 20, 8, 7, 15, 13 are inserted, in this order, into an initially empty binary search tree. Taking the height of a tree with a single node as 0, the height of the resulting tree is:	{3,5,4,6}	3	Official answer key: C	1.00	2026-11-19 00:19:39.618279+05:30	f	[]	[]
118	1	DSA-M4-Q118	4	The keys 10, 12, 5, 4, 20, 8, 7, 15, 13 are inserted, in this order, into an initially empty binary search tree. Its preorder traversal is:	{"10 5 4 8 7 12 20 15 13","4 5 7 8 10 12 13 15 20","10 5 12 4 8 20 7 15 13","10 12 5 4 20 8 7 15 13"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.618777+05:30	f	[]	[]
119	1	DSA-M4-Q119	4	To delete a node having two children from a binary search tree, the node is replaced by:	{"Its parent node","The smallest key in its left subtree or the largest key in its right subtree","Either the largest key in its left subtree or the smallest key in its right subtree","The root of the tree"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.619208+05:30	f	[]	[]
120	1	DSA-M4-Q120	4	In the binary search tree built from the keys 10, 12, 5, 4, 20, 8, 7, 15, 13, the root 10 is deleted by replacing it with the largest key of its left subtree. Which key becomes the replacement?	{7,12,5,8}	4	Official answer key: D	1.00	2026-11-19 00:19:39.619638+05:30	f	[]	[]
121	1	DSA-M5-Q121	5	The length of a path in a graph is:	{"The number of vertices in the path","The number of edges in the path","The sum of the degrees of its vertices","The number of cycles in the path"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.620148+05:30	f	[]	[]
122	1	DSA-M5-Q122	5	A graph G = (V, E) consists of:	{"A set of edges only","A set of vertices only, with no relation between them","A finite non-empty set of vertices V and a set E of pairs of vertices called edges","A set of nodes arranged in levels"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.620582+05:30	f	[]	[]
123	1	DSA-M5-Q123	5	In an undirected graph, the pairs (u, v) and (v, u):	{"Represent two different edges","Represent the same edge","Represent a self loop","Cannot both be present in the graph"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.621005+05:30	f	[]	[]
124	1	DSA-M5-Q124	5	How many edges does a complete undirected graph with 6 vertices have?	{30,12,21,15}	4	Official answer key: D	1.00	2026-11-19 00:19:39.621428+05:30	f	[]	[]
125	1	DSA-M5-Q125	5	An edge of the form (v, v), which starts and ends at the same vertex, is called a:	{Multi-edge,"Cycle of length two","Weighted edge","Self loop (self edge)"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.621846+05:30	f	[]	[]
126	1	DSA-M5-Q126	5	For the directed graph shown in the figure, the in-degree and the out-degree of vertex c are, respectively: a b d c	{"1 and 2","2 and 1","2 and 2","3 and 1"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.622262+05:30	f	[]	[]
127	1	DSA-M5-Q127	5	A directed graph G is said to be strongly connected if:	{"For every pair of distinct vertices u and v there is a directed path from u to v and from v to u","It contains no cycles","Every vertex has at least one outgoing edge","Every vertex has in-degree equal to its out-degree"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.62268+05:30	f	[]	[]
128	1	DSA-M5-Q128	5	The adjacency matrix of an undirected graph is always:	{Symmetric,"Upper triangular","A diagonal matrix","An identity matrix"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.623078+05:30	f	[]	[]
129	1	DSA-M5-Q129	5	For an undirected graph with n vertices and e edges, the adjacency list representation requires an array of size n and how many chain nodes?	{e,"n + e",n^2,2e}	4	Official answer key: D	1.00	2026-11-19 00:19:39.623431+05:30	f	[]	[]
130	1	DSA-M5-Q130	5	In the adjacency multilist representation of a graph:	{"Each edge is represented by two nodes, one in each end vertex's list","Each vertex is represented by n nodes","Only the edge weights are stored, not the vertices","Each edge is represented by exactly one node, which appears in the lists of both of its end vertices"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.623797+05:30	f	[]	[]
131	1	DSA-M5-Q131	5	Which data structure is used to maintain the current position in the adjacency lists during depth first search?	{Queue,"Priority queue",Stack,"Hash table"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.624212+05:30	f	[]	[]
132	1	DSA-M5-Q132	5	Breadth first search of a graph uses which data structure to hold the visited vertices whose adjacency lists are yet to be examined?	{Stack,Queue,"Binary tree","Array of weights"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.624626+05:30	f	[]	[]
133	1	DSA-M5-Q133	5	For a graph with n vertices and e edges, the time taken by depth first search when the graph is represented by an adjacency list and by an adjacency matrix is, respectively:	{"O(e) and O(n^2)","O(n^2) and O(e)","O(n) and O(n)","O(e) and O(e)"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.625169+05:30	f	[]	[]
134	1	DSA-M5-Q134	5	A depth first search is started from vertex 0 of the undirected graph in the figure. The adjacency lists are 0: 1, 2; 1: 0, 3, 4; 2: 0, 4; 3: 1; 4: 1, 2, and the vertices of each list are examined in the given order. The vertices are visited in the order: 0 1 2 3 4	{"0 1 3 4 2","0 1 2 3 4","0 2 4 1 3","0 1 4 2 3"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.62561+05:30	f	[]	[]
135	1	DSA-M5-Q135	5	A directed graph has the adjacency lists 0: 2, 1, 3; 1: 4; 2: 5, 4; 3: 5; 4: 6; 5: 6; 6: (none). A breadth first search is started from vertex 0 and the adjacency lists are scanned in the given order. The vertices are visited in the order:	{"0 1 2 3 4 5 6","0 2 1 3 5 4 6","0 2 5 6 4 1 3","0 2 1 3 4 5 6"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.626283+05:30	f	[]	[]
136	1	DSA-M5-Q136	5	Insertion sort (as given in the notes) is applied to the list 5, 2, 4, 6, 1, 3. The total number of times an element is shifted one position to the right (a[i+1] = a[i]) during the sort is:	{9,10,8,15}	1	Official answer key: A	1.00	2026-11-19 00:19:39.626895+05:30	f	[]	[]
137	1	DSA-M5-Q137	5	Radix sort (least significant digit first, with each bucket preserving the input order) is applied to 348, 143, 361, 423, 538, 128, 321, 543, 366. The list after the first pass (units digit) is:	{"321 361 143 423 543 366 538 348 128","128 143 321 348 361 366 423 538 543","361 321 143 423 543 366 348 538 128","348 143 361 423 538 128 321 543 366"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.627326+05:30	f	[]	[]
138	1	DSA-M5-Q138	5	If each number in a list has s digits (radix d), the radix sort algorithm requires:	{"d passes","s passes","n passes","log n passes"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.627731+05:30	f	[]	[]
139	1	DSA-M5-Q139	5	The function f used in address calculation sort must be order preserving, which means:	{"If x <= y then f(x) <= f(y)","If x <= y then f(x) >= f(y)","f(x) is different for every key x","f(x) is chosen randomly for every key"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.62815+05:30	f	[]	[]
140	1	DSA-M5-Q140	5	In hashing, a collision occurs when:	{"A key is not found in the hash table","The hash table becomes empty","Two or more keys map to the same memory location","The hash function returns a negative value"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.628547+05:30	f	[]	[]
141	1	DSA-M5-Q141	5	In the division method of hashing, the hash function is:	{"h(x) = x div M","h(x) = x * M","h(x) = M - x","h(x) = x mod M"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.628902+05:30	f	[]	[]
142	1	DSA-M5-Q142	5	A hash table of size 10 uses H(k) = k mod 10 with linear probing. The keys 72, 27, 36, 24, 63, 81, 92, 101 are inserted in this order. At which index is the key 101 stored?	{5,8,1,9}	2	Official answer key: B	1.00	2026-11-19 00:19:39.629269+05:30	f	[]	[]
143	1	DSA-M5-Q143	5	The keys 72, 27, 36, 24, 63, 81, 92, 101 are stored, in this order, in a hash table of size 10 using H(k) = k mod 10 and linear probing. The average search length (total probes needed to find all 8 keys divided by 8) is:	{2.0,1.5,2.25,3.0}	3	Official answer key: C	1.00	2026-11-19 00:19:39.629701+05:30	f	[]	[]
144	1	DSA-M5-Q144	5	A hash table of size 10 uses H(k) = k mod 10 with quadratic probing (probes h, h+1, h+4, h+9, ...). The keys 22, 32 and 42 are inserted in this order. At which index is 42 stored?	{4,3,5,6}	4	Official answer key: D	1.00	2026-11-19 00:19:39.630137+05:30	f	[]	[]
145	1	DSA-M5-Q145	5	Double hashing with H1(key) = key % 10 and H2(key) = 7 - (key % 7) is used, and a collision is resolved with (H1(key) + i x H2(key)) % 10. The keys 37, 90, 45, 22, 17, 49, 55 are inserted in this order. At which index is the key 17 stored?	{1,8,4,7}	1	Official answer key: A	1.00	2026-11-19 00:19:39.630561+05:30	f	[]	[]
146	1	DSA-M5-Q146	5	Using the folding method for a hash table with 100 locations, the key 123456 is divided into the parts 12, 34 and 56, which are added, ignoring any carry. The hash value is:	{102,12,56,"2 (that is, 02)"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.631254+05:30	f	[]	[]
147	1	DSA-M5-Q147	5	Words are stored using chaining in a table of size 5 with H(str) = (sum of the positions of its letters in the English alphabet) % 5. The words like, a, tree, you, first, a, place, to are inserted in this order at the rear of their chains. The words in the chain of index 2 are:	{"a, you, a","tree, first, place","like, first, place","like, tree, place"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.631947+05:30	f	[]	[]
148	1	DSA-M5-Q148	5	In rehashing, when the hash table becomes nearly full:	{"The entries are copied to the same positions of a bigger table","A new table of double the size is created and every entry is re-inserted using its newly computed hash value","The size of the table is halved and the entries are rehashed","All the chains are deleted and the table is emptied"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.632382+05:30	f	[]	[]
149	1	DSA-M5-Q149	5	Which of the following is a drawback of static hashing?	{"The table size is fixed, so it cannot accommodate data growth and collisions increase as the data grows","It requires a directory of pointers that must be doubled","It cannot use chaining or linear probing","The hash function cannot be computed in constant time"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.632806+05:30	f	[]	[]
150	1	DSA-M5-Q150	5	Which statement about dynamic hashing is correct?	{"Linear hashing uses a directory that is doubled, whereas extendible hashing splits buckets in round-robin order","Both extendible and linear hashing use a table of fixed size","Extendible hashing uses a directory that is doubled, splitting only the bucket that overflowed, whereas linear hashing uses no directory and splits buckets in round-robin order","Extendible hashing needs overflow pages, whereas linear hashing needs none"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.633351+05:30	f	[]	[]
151	2	DSA-M1-Q001	1	According to the notes, a data structure can be expressed as:	{"Data Structure = Organized data + Allowed operations","Data Structure = Algorithm + Flowchart","Data Structure = Program + Compiler","Data Structure = Input + Output"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.651305+05:30	f	[]	[]
152	2	DSA-M1-Q002	1	A field K whose values uniquely determine a record in a file is called a:	{"Primary key","Group item","Entity set","Variable-length record"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.651779+05:30	f	[]	[]
153	2	DSA-M1-Q003	1	Which of the following is a primitive data structure?	{Array,Integer,Tree,Graph}	2	Official answer key: B	1.00	2026-11-19 00:19:39.652206+05:30	f	[]	[]
154	2	DSA-M1-Q004	1	Which of the following is a non-linear data structure?	{Stack,Queue,"Linked list",Tree}	4	Official answer key: D	1.00	2026-11-19 00:19:39.652613+05:30	f	[]	[]
155	2	DSA-M1-Q005	1	In data structure operations, merging means:	{"Arranging all data items in ascending or descending order","Combining the data items of two sorted lists into a single list","Finding whether a desired data item is present in a list","Reserving memory for the program elements"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.653358+05:30	f	[]	[]
156	2	DSA-M1-Q006	1	A pointer is:	{"A variable that can store only integer constants","A special variable that contains the address of a memory location","A function that allocates memory at run time","A data type that stores a sequence of characters"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.653785+05:30	f	[]	[]
157	2	DSA-M1-Q007	1	A pointer that has not been initialized with a valid address is known as a:	{"NULL pointer","Void pointer","Dangling (wild) pointer","Pointer to pointer"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.654175+05:30	f	[]	[]
158	2	DSA-M1-Q008	1	Memory requested at run time using malloc() and calloc() is allocated from the:	{Stack,"Static (compile-time) data area","CPU registers",Heap}	4	Official answer key: D	1.00	2026-11-19 00:19:39.654599+05:30	f	[]	[]
159	2	DSA-M1-Q009	1	Which dynamic memory allocation function initializes every allocated block to zero?	{malloc(),realloc(),calloc(),free()}	3	Official answer key: C	1.00	2026-11-19 00:19:39.65497+05:30	f	[]	[]
160	2	DSA-M1-Q010	1	Which statement correctly distinguishes calloc() from malloc()?	{"calloc() takes one argument and leaves the allocated memory uninitialized","calloc() takes two arguments (number of elements, element size) and initializes the memory to zero","calloc() releases previously allocated memory, while malloc() allocates it","calloc() allocates memory at compile time, while malloc() does it at run time"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.655479+05:30	f	[]	[]
161	2	DSA-M1-Q011	1	If realloc() cannot extend an existing memory block in place, it:	{"Leaves the old block unchanged and returns a pointer to its first byte","Frees the old block and returns an uninitialized block without copying any data","Allocates a new block, copies the old contents into it and frees the old block","Always terminates the program with a run-time error"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.655934+05:30	f	[]	[]
162	2	DSA-M1-Q012	1	What is the output of the following code? int a[5] = {10, 20, 30, 40, 50}; int *p = a; printf("%d %d", *(p + 2), 3[a]);	{"20 40","30 30","Compilation error","30 40"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.656348+05:30	f	[]	[]
163	2	DSA-M1-Q013	1	Which declaration creates an array of 5 pointers to integers?	{"int *a;","int a[5];","int *a[5];","int **a;"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.656859+05:30	f	[]	[]
164	2	DSA-M1-Q014	1	Binary search is applied on the sorted array {2, 5, 8, 12, 16, 23, 38, 56, 72, 91} with low = 0, high = 9 and mid = (low + high)/2 to find the key 23. How many times is mid computed before the key is found?	{3,2,4,5}	1	Official answer key: A	1.00	2026-11-19 00:19:39.657402+05:30	f	[]	[]
165	2	DSA-M1-Q015	1	What is the output of the following code that inserts an item into an array? int a[10] = {5, 10, 15, 20}, n = 4, pos = 2, item = 12, i; for (i = n - 1; i >= pos; i--) a[i + 1] = a[i]; a[pos] = item; n = n + 1; for (i = 0; i < n; i++) printf("%d ", a[i]);	{"5 10 15 12 20","5 10 12 15 20","12 5 10 15 20","5 10 12 20 20"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.657867+05:30	f	[]	[]
166	2	DSA-M1-Q016	1	What is the output of the following code? int m[2][3] = { {1, 4, 2}, {3, 6, 8} }; int i, j, s = 0; for (i = 0; i < 2; i++) for (j = 0; j < 3; j++) if (i != j) s += m[i][j]; printf("%d", s);	{24,7,21,17}	4	Official answer key: D	1.00	2026-11-19 00:19:39.658307+05:30	f	[]	[]
167	2	DSA-M1-Q017	1	To create a 2-D integer array of rows x cols dynamically using the pointer-to-pointer method of the notes, how many MALLOC (malloc) calls are needed in total?	{1,"rows x cols","rows + 1","cols + 1"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.658725+05:30	f	[]	[]
168	2	DSA-M1-Q018	1	What is the output of the following code? int a = 10; int *p1 = &a; int **p2 = &p1; **p2 = **p2 + 5; printf("%d %d", a, *p1);	{"10 15","15 10","10 10","15 15"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.659125+05:30	f	[]	[]
169	2	DSA-M1-Q019	1	Which of the following structure definitions results in a syntax error?	{"struct str1 { int i; char c; } var1 = {10, 'A'};","struct str1 { int i = 10; char c = 'A'; };","struct str1 { int i; char c; }; struct str1 var1 = {10, 'A'};","struct str1 { int i; char c; float f; } s1, s2;"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.659555+05:30	f	[]	[]
170	2	DSA-M1-Q020	1	Which of the following is a self-referential structure?	{"struct node { int data; struct node next; };","struct node { int data; int *next; };","struct node { int data; };","struct node { int data; struct node *next; };"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.660003+05:30	f	[]	[]
171	2	DSA-M1-Q021	1	The size of a union is equal to the size of its:	{"Largest member","Smallest member","Sum of all members","First member"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.660398+05:30	f	[]	[]
172	2	DSA-M1-Q022	1	Which statement about structures and unions is correct?	{"Altering one member of a structure alters the other members, but not in a union","In a structure each member has its own storage, whereas all members of a union share the same memory","A union allocates memory equal to the sum of the sizes of its members","All members of a union can be initialized at once, but only the first member of a structure can be"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.660832+05:30	f	[]	[]
173	2	DSA-M1-Q023	1	Using the addpolynomial() logic of the notes (terms are stored in decreasing order of exponent and a term is attached only when its coefficient is non-zero), the sum of A(x) = 5x^3 + 4x^2 + 2 and B(x) = 3x^3 - 4x^2 + 7x is:	{"8x^3 + 0x^2 + 7x + 2","8x^3 + 8x^2 + 7x + 2","2x^3 + 8x^2 + 7x + 2","8x^3 + 7x + 2"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.661241+05:30	f	[]	[]
174	2	DSA-M1-Q024	1	A sparse matrix is a matrix that has:	{"A greater number of zero elements than non-zero elements","Only non-zero elements","More rows than columns","Non-zero elements only on its diagonal"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.661642+05:30	f	[]	[]
332	3	LDCO-M2-Q032	2	Which of the following is NOT a combinational circuit?	{"Binary counter",Decoder,Adder,Multiplexer}	1	Official answer key: A	1.00	2026-11-19 00:19:39.725422+05:30	f	[]	[]
175	2	DSA-M1-Q025	1	In the (row, column, value) triple representation of a sparse matrix, the first entry A[0] stores:	{"The first non-zero element of the matrix","The number of zero elements, rows and columns","The number of rows, the number of columns and the number of non-zero terms","The largest element and its row and column"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.662115+05:30	f	[]	[]
176	2	DSA-M1-Q026	1	The 4 x 4 sparse matrix A shown below is stored as triples with B[0] = (4, 4, 5) for its transpose. Using the column-by-column transpose algorithm of the notes, what is B[4]? | 0  0  3  0 | A = | 0  0  0  8 | | 1  0  3  0 | | 0  0  7  0 |	{"(3, 1, 8)","(2, 3, 7)","(2, 2, 3)","(0, 2, 1)"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.663608+05:30	f	[]	[]
177	2	DSA-M1-Q027	1	For a sparse matrix with c columns and t non-zero terms, the transpose function of the notes (which scans all t terms once for every column) runs in time:	{"O(c x t)","O(c + t)",O(t),O(c)}	1	Official answer key: A	1.00	2026-11-19 00:19:39.66404+05:30	f	[]	[]
178	2	DSA-M1-Q028	1	A string in C is a sequence of characters terminated by the:	{"Null character '\\\\0'","Newline character '\\\\n'","Space character","Tab character '\\\\t'"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.664454+05:30	f	[]	[]
179	2	DSA-M1-Q029	1	What is the output of the following code? #include <string.h> char s[] = "Hello"; printf("%d", (int)(sizeof(s) + strlen(s)));	{10,12,11,5}	3	Official answer key: C	1.00	2026-11-19 00:19:39.665028+05:30	f	[]	[]
180	2	DSA-M1-Q030	1	What is the output of the following code? char a[20] = "Data"; char b[] = "Struct"; strcat(a, b); printf("%s %d", a, (int)strlen(a));	{"DataStruct 10","DataStruct 11","StructData 10","Data 4"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.665881+05:30	f	[]	[]
181	2	DSA-M2-Q031	2	In a stack, insertions (push) and deletions (pop) are made at one end called the:	{Top,Front,Rear,Base}	1	Official answer key: A	1.00	2026-11-19 00:19:39.666386+05:30	f	[]	[]
182	2	DSA-M2-Q032	2	Trying to push an element onto a stack that is already full is called:	{Overflow,Underflow,Deadlock,Wrap-around}	1	Official answer key: A	1.00	2026-11-19 00:19:39.666793+05:30	f	[]	[]
183	2	DSA-M2-Q033	2	Which auxiliary stack operation returns the last inserted element without removing it?	{Pop(),Push(),Top(),Size()}	3	Official answer key: C	1.00	2026-11-19 00:19:39.667208+05:30	f	[]	[]
184	2	DSA-M2-Q034	2	When a stack is implemented using an array, the value of top for an empty stack is initialized to:	{-1,0,1,MAX_STACK_SIZE}	1	Official answer key: A	1.00	2026-11-19 00:19:39.667623+05:30	f	[]	[]
185	2	DSA-M2-Q035	2	When a function is invoked, its stack frame placed on the system stack initially contains:	{"Only the local variables of the invoking function","The source code of the invoked function","A pointer to the previous stack frame and the return address","The final return value and an overflow flag"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.66802+05:30	f	[]	[]
186	2	DSA-M2-Q036	2	For an array-based stack of size MAX_STACK_SIZE, the stack is full when:	{"top < 0","top >= MAX_STACK_SIZE - 1","top == MAX_STACK_SIZE","top == 0"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.66843+05:30	f	[]	[]
187	2	DSA-M2-Q037	2	In the array-doubling strategy for a stack stored in a dynamic array, the total time spent on all array doublings over n push operations is:	{O(n^2),"O(log n)",O(n),"O(n log n)"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.66901+05:30	f	[]	[]
188	2	DSA-M2-Q038	2	In the infix-to-postfix algorithm using in-stack precedence (isp) and incoming precedence (icp), the left parenthesis has:	{"High in-stack precedence and low incoming precedence","Low in-stack precedence (isp = 0) but high incoming precedence (icp = 20)","Equal in-stack and incoming precedence of 0","Equal in-stack and incoming precedence of 20"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.669427+05:30	f	[]	[]
189	2	DSA-M2-Q039	2	In which notation does the operator appear after its operands, as in A B +?	{"Postfix (reverse Polish) notation","Prefix (Polish) notation","Infix notation","Parenthesized infix notation"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.669843+05:30	f	[]	[]
190	2	DSA-M2-Q040	2	The postfix form of the infix expression a*(b+c)*d is:	{ab*c+d*,abcd+**,abc+*d*,abc*+d*}	3	Official answer key: C	1.00	2026-11-19 00:19:39.670242+05:30	f	[]	[]
191	2	DSA-M2-Q041	2	The postfix form of the infix expression a+b*c-d/e is:	{ab+c*de/-,abc*de/+-,abcde*/+-,abc*+de/-}	4	Official answer key: D	1.00	2026-11-19 00:19:39.670624+05:30	f	[]	[]
192	2	DSA-M2-Q042	2	What is the value of the postfix expression 5 6 2 + * 12 4 / -?	{37,-37,43,3}	1	Official answer key: A	1.00	2026-11-19 00:19:39.671082+05:30	f	[]	[]
193	2	DSA-M2-Q043	2	The prefix form of the infix expression (A + B) * C is:	{"+ A * B C","A B + C *","* A + B C","* + A B C"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.671502+05:30	f	[]	[]
194	2	DSA-M2-Q044	2	Starting with an empty stack, the operations push(3), push(6), push(9), pop(), push(12), pop(), pop() are performed. What are the values returned by Top() and Size() now?	{"Top = 6, Size = 2","Top = 3, Size = 1","Top = 12, Size = 2","Top = 9, Size = 1"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.671976+05:30	f	[]	[]
195	2	DSA-M2-Q045	2	What is the output of the following code? int stack[10], top = -1, x, y; stack[++top] = 4; stack[++top] = 7; stack[++top] = 2; x = stack[top--]; y = stack[top--]; stack[++top] = x * y; printf("%d %d", stack[top], top);	{"28 1","14 1","14 2","14 0"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.672557+05:30	f	[]	[]
196	2	DSA-M2-Q046	2	A stack uses a dynamically allocated array with an initial capacity of 1 and doubles the capacity (using realloc) whenever a push arrives while the array is full. What is the capacity after 9 pushes?	{16,9,8,18}	1	Official answer key: A	1.00	2026-11-19 00:19:39.672971+05:30	f	[]	[]
197	2	DSA-M2-Q047	2	A queue works on which of the following principles?	{"Last-In-First-Out (LIFO)",Highest-priority-last,"Random access","First-In-First-Out (FIFO)"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.673259+05:30	f	[]	[]
198	2	DSA-M2-Q048	2	In the array implementation of a linear queue (with f initialized to 0 and r to -1), the queue is empty when:	{"f < r","f > r","r == QUEUESIZE - 1","f == QUEUESIZE - 1"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.673534+05:30	f	[]	[]
199	2	DSA-M2-Q049	2	The figure shows a linear queue stored in an array with QUEUESIZE = 5, f = 2 and r = 4. What happens when insertQ(60, &r, q) is executed? q[ ] 0 1 30 2 40 3 50 4 f r	{"60 is stored at index 0","60 is stored at index 5","It prints \\"Queue Empty\\"","It prints \\"queue overflow\\" even though locations 0 and 1 are empty"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.673814+05:30	f	[]	[]
200	2	DSA-M2-Q050	2	In a circular queue implemented with an array of size QUEUESIZE, the rear is advanced during insertion using:	{"rear = rear + 1","rear = (rear - 1) % QUEUESIZE","rear = rear % QUEUESIZE + 1","rear = (rear + 1) % QUEUESIZE"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.674215+05:30	f	[]	[]
201	2	DSA-M2-Q051	2	A circular queue (QUEUESIZE = 5) uses the variables f, r and count, initially f = 0, r = -1, count = 0. The operations performed are: insert 10, 20, 30, 40; delete twice; insert 50, 60, 70. The final values of f, r and count are:	{"f = 2, r = 1, count = 5","f = 2, r = 2, count = 5","f = 0, r = 1, count = 5","f = 2, r = 1, count = 3"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.674487+05:30	f	[]	[]
202	2	DSA-M2-Q052	2	Elements 9, 4 and 6 are inserted, in this order, into an ascending priority queue. The order in which they are deleted is:	{"4, 6, 9","9, 4, 6","6, 4, 9","9, 6, 4"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.674754+05:30	f	[]	[]
203	2	DSA-M2-Q053	2	A priority queue is mainly used to implement:	{Recursion,"CPU scheduling algorithms","Binary search","Matrix multiplication"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.675017+05:30	f	[]	[]
204	2	DSA-M2-Q054	2	In a deque (double-ended queue), insertion and deletion can be performed:	{"Only at the front end","At both the front and the rear ends","Only at the rear end","Only in the middle of the queue"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.675344+05:30	f	[]	[]
205	2	DSA-M2-Q055	2	In an input-restricted deque:	{"Deletion is allowed at only one end, while insertion is allowed at both ends","Both insertion and deletion are allowed at only one end","Insertion is allowed at only one end, while deletion is allowed at both ends","Insertion is not allowed at any end"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.67562+05:30	f	[]	[]
206	2	DSA-M2-Q056	2	A deque is initially empty. The operations insertFront(1), insertRear(2), insertFront(3), insertRear(4), deleteFront(), deleteRear() are performed in order. The contents of the deque from front to rear are:	{"3, 1","2, 4","1, 2, 4","1, 2"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.675901+05:30	f	[]	[]
207	2	DSA-M2-Q057	2	In the maze problem of the notes, the maze is represented by a two-dimensional array in which:	{"Ones represent open paths and zeros represent barriers","Zeros represent open paths and ones represent barriers","Zeros represent the exit and ones the entrance","Every position stores the number of its neighbours"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.676354+05:30	f	[]	[]
208	2	DSA-M2-Q058	2	To avoid checking border conditions in the maze program, the maze is surrounded by a border of ones. An m x p maze therefore requires an array of size:	{"m x p","(m + 1) x (p + 1)","(m + 2) x (p + 2)","(m + 2) x p"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.676634+05:30	f	[]	[]
209	2	DSA-M2-Q059	2	A 6 x 8 maze is stored in an array with a border of ones. If the entrance is at maze[1][1], the exit is at:	{maze[7][9],maze[5][7],maze[8][10],maze[6][8]}	4	Official answer key: D	1.00	2026-11-19 00:19:39.676897+05:30	f	[]	[]
210	2	DSA-M2-Q060	2	Since each position of an m x p maze is visited no more than once, the worst-case computing time of the maze-path algorithm is:	{"O(m + p)",O((mp)^2),O(mp),"O(log mp)"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.677367+05:30	f	[]	[]
211	2	DSA-M3-Q061	3	Each node of a singly linked list consists of:	{"A data field, a prev field and a next field","Only a data field","Two data fields and a counter","A data field and a next (link) field"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.677648+05:30	f	[]	[]
212	2	DSA-M3-Q062	3	In a singly linked list, the next field of the last node contains:	{"The address of the first node","The address of the previous node","NULL","The value zero as data"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.677912+05:30	f	[]	[]
213	2	DSA-M3-Q063	3	Which disadvantage of arrays is overcome by using linked lists?	{"Slow random access to the i-th element","Use of a common name for all the elements","Inability to store more than one data type","Fixed size, and costly insertion and deletion at a given position"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.678178+05:30	f	[]	[]
214	2	DSA-M3-Q064	3	While traversing a singly linked list with a pointer current that starts at head, the traversal loop stops when:	{"current becomes NULL","current becomes equal to head again","current->data becomes zero","current->next points to head"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.678457+05:30	f	[]	[]
215	2	DSA-M3-Q065	3	How many types of linked lists are listed in the notes?	{"2 (singly and doubly)","4 (singly, doubly, circular singly and circular doubly)","3 (singly, doubly and circular)",5}	2	Official answer key: B	1.00	2026-11-19 00:19:39.678723+05:30	f	[]	[]
216	2	DSA-M3-Q066	3	Each node of a doubly linked list consists of:	{"Data and a pointer to the next node","Data and a pointer to the previous node","Data, a pointer to the head and a pointer to the tail","Data, a pointer to the previous node and a pointer to the next node"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.678983+05:30	f	[]	[]
217	2	DSA-M3-Q067	3	Which linked list supports traversal in both the forward and backward directions?	{"Singly linked list","Doubly linked list","Circular singly linked list","Singly linked list with a tail pointer"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.67924+05:30	f	[]	[]
218	2	DSA-M3-Q068	3	In a circular linked list, the last node points to:	{"NULL","The previous node","The first node","Itself, in every list"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.679502+05:30	f	[]	[]
219	2	DSA-M3-Q069	3	In a stack implemented using a singly linked list, push() inserts the new node at the:	{"End of the list","Beginning of the list (top)","Middle of the list","Position given by the data value"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.680214+05:30	f	[]	[]
220	2	DSA-M3-Q070	3	Elements of a linked list are accessed:	{"Randomly using an index","Sequentially, starting from the head","Only from the tail","Using the memory address of the array base"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.68069+05:30	f	[]	[]
221	2	DSA-M3-Q071	3	Which of the following correctly compares arrays and linked lists?	{"Array: non-contiguous memory and sequential access; Linked list: contiguous memory and random access","Both arrays and linked lists use contiguous memory and random access","Array: contiguous memory and random access; Linked list: non-contiguous memory and sequential access","Both arrays and linked lists use non-contiguous memory and sequential access"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.681116+05:30	f	[]	[]
222	2	DSA-M3-Q072	3	In the memory representation of a linked list, the nodes and the pointer variable head declared inside main() are stored, respectively, in the:	{"Heap and stack","Stack and heap","Heap and heap","Stack and stack"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.681843+05:30	f	[]	[]
223	2	DSA-M3-Q073	3	The time required to insert a new node at the end of a singly linked list when only the head pointer is available is:	{O(1),"O(log n)",O(n^2),O(n)}	4	Official answer key: D	1.00	2026-11-19 00:19:39.68228+05:30	f	[]	[]
224	2	DSA-M3-Q074	3	The main advantage of implementing a stack with a linked list instead of an array is that:	{"Elements can be accessed randomly using an index","Memory is allocated contiguously","No pointer is needed for the top","The stack can grow and shrink dynamically without a fixed maximum capacity"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.682564+05:30	f	[]	[]
225	2	DSA-M3-Q075	3	While inserting a new node at the beginning of a non-empty doubly linked list, which statement is required in addition to new_node->next = head?	{"head->next = new_node","new_node->prev = head","head->prev = new_node","head->prev = NULL"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.682829+05:30	f	[]	[]
226	2	DSA-M3-Q076	3	When only a pointer to the node to be deleted is given, the time for deletion in a singly linked list and in a doubly linked list is, respectively:	{"O(n) and O(1)","O(1) and O(n)","O(1) and O(1)","O(n) and O(n)"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.683198+05:30	f	[]	[]
227	2	DSA-M3-Q077	3	Which of the following is a disadvantage of a doubly linked list compared with a singly linked list?	{"It cannot be traversed in the backward direction","Insertion at the beginning requires traversing the whole list","Every node needs extra memory for the additional prev pointer","It cannot be used to implement a stack or a queue"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.683473+05:30	f	[]	[]
228	2	DSA-M3-Q078	3	In a circular singly linked list represented by a pointer last to its last node, the first node is accessed as:	{last->prev,last->next->next,last,last->next}	4	Official answer key: D	1.00	2026-11-19 00:19:39.684388+05:30	f	[]	[]
229	2	DSA-M3-Q079	3	In a circular doubly linked list, the prev pointer of the first node stores the address of:	{"The last node","NULL","The second node","The first node itself"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.684665+05:30	f	[]	[]
230	2	DSA-M3-Q080	3	Which of the following is a disadvantage of circular linked lists?	{"Traversal may enter an infinite loop unless a proper stopping condition is used","Insertion at the beginning is impossible","They cannot be used to implement a circular queue","The last node always contains NULL"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.684932+05:30	f	[]	[]
231	2	DSA-M3-Q081	3	Assume the functions of the notes are available. What is the output of the following code? struct Node* head = NULL; head = insertAtBeginning(head, 10); head = insertAtBeginning(head, 20); head = insertAtBeginning(head, 30); head = insertAtEnd(head, 40); traverseLinkedList(head);	{"10 20 30 40","40 30 20 10","30 20 10 40","30 20 40 10"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.685216+05:30	f	[]	[]
232	2	DSA-M3-Q082	3	The singly linked list in the figure is modified by the code below. What does traverseLinkedList(head) print? head = removeLastNode(head); head = removeFirstNode(head); head = deleteAtPosition(head, 2); traverseLinkedList(head); head 12 25 7 40 NULL	{"25 7",25,7,12}	2	Official answer key: B	1.00	2026-11-19 00:19:39.685485+05:30	f	[]	[]
233	2	DSA-M3-Q083	3	A stack is implemented using a singly linked list as in the notes. Starting from an empty stack, the operations push(11), push(22), push(33), pop(), push(44), push(55), pop(), pop() are performed. What does peek() return?	{11,22,33,44}	2	Official answer key: B	1.00	2026-11-19 00:19:39.685747+05:30	f	[]	[]
234	2	DSA-M3-Q084	3	Let tail point to the last node of the final list. What does backwardTraversal(tail) print after the following operations on a doubly linked list? struct Node* head = createNode(10); head = insertEnd(head, 20); head = insertEnd(head, 30); head = insertAtPosition(head, 3, 25);	{"10 20 25 30","30 20 25 10","30 25 10 20","30 25 20 10"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.686012+05:30	f	[]	[]
235	2	DSA-M3-Q085	3	A doubly linked list contains 1, 2, 3, 4, 5. The following statements are executed. If tail points to the last node of the resulting list, what does backwardTraversal(tail) print? head = delPos(head, 3); head = delLast(head); head = delHead(head);	{"4 2","2 4","5 4 2","4 2 1"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.686358+05:30	f	[]	[]
236	2	DSA-M3-Q086	3	What is the output of the following code on a circular singly linked list (insertion functions of the notes)? struct Node *last = NULL; last = insertAtBeginning(last, 10); last = insertEnd(last, 20); last = insertAtBeginning(last, 5); last = insertEnd(last, 30); printf("%d %d", last->data, last->next->data);	{"30 5","30 10","5 30","20 5"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.686633+05:30	f	[]	[]
237	2	DSA-M3-Q087	3	A circular singly linked list contains 5, 10, 20, 30 with last pointing to the node 30. After last = deleteFirstNode(last); last = deleteLastNode(last); what does printf("%d %d", last->data, last->next->data) print?	{"20 5","30 10","20 10","10 20"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.686918+05:30	f	[]	[]
238	2	DSA-M3-Q088	3	Inserting a new node between two existing nodes in the middle of a doubly linked list requires updating how many pointer fields in total?	{2,4,3,1}	2	Official answer key: B	1.00	2026-11-19 00:19:39.687234+05:30	f	[]	[]
239	2	DSA-M3-Q089	3	A singly linked list contains the two nodes 7 -> 9 -> NULL. What is the state of the list after head = removeLastNode(head); (the function of the notes)?	{"An empty list","A single node 7 whose next is NULL","A single node 9 whose next is NULL","The list is unchanged because the loop never executes"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.687513+05:30	f	[]	[]
410	4	LDCO-M2-Q050	2	The BCD adder block diagram shown uses how many 4-bit binary adders?	{3,4,1,2}	4	Official answer key: D	1.00	2026-11-19 00:19:39.757189+05:30	f	[]	[]
240	2	DSA-M3-Q090	3	A singly linked list has 4 nodes. For which value of pos does insertPos(head, pos, data) of the notes print "Invalid position!"?	{6,5,3,1}	1	Official answer key: A	1.00	2026-11-19 00:19:39.687796+05:30	f	[]	[]
241	2	DSA-M4-Q091	4	Which node of a tree has no parent?	{"Root node","Leaf node","Sibling node","Internal node"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.688275+05:30	f	[]	[]
242	2	DSA-M4-Q092	4	A node with no children (a node of degree zero) is called a:	{"Root node","Internal node","Sibling node","Leaf (external or terminal) node"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.688559+05:30	f	[]	[]
243	2	DSA-M4-Q093	4	A tree with N nodes has how many edges?	{"N - 1",N,"N + 1","2N - 1"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.68883+05:30	f	[]	[]
244	2	DSA-M4-Q094	4	In the tree shown in the figure, what is the degree of node D? A B C D E F G H I J K L M	{2,4,3,1}	3	Official answer key: C	1.00	2026-11-19 00:19:39.689101+05:30	f	[]	[]
245	2	DSA-M4-Q095	4	For the tree shown in the figure, using the convention of the notes (levels, heights and depths counted in edges, with the root at level 0), the depth of node M and the height of node B are, respectively: A B C D E F G H I J K L M	{"2 and 3","4 and 2","3 and 3","3 and 2"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.689371+05:30	f	[]	[]
246	2	DSA-M4-Q096	4	In the left child - right sibling representation of a tree, each node contains:	{"A data field, a reference to its left (first) child and a reference to its right sibling","A data field and references to all of its children","A data field, a parent reference and a degree field","A data field and a reference to the root"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.689643+05:30	f	[]	[]
247	2	DSA-M4-Q097	4	A tree in which every node can have at most two children (a left child and a right child) is called a:	{"Threaded tree","General tree","Binary tree",Forest}	3	Official answer key: C	1.00	2026-11-19 00:19:39.689908+05:30	f	[]	[]
248	2	DSA-M4-Q098	4	In a strictly binary tree (full binary tree), every node has:	{"Exactly one child","Either zero or two children","At most one child","Exactly two children, with all leaves at the same level"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.690171+05:30	f	[]	[]
249	2	DSA-M4-Q099	4	In a binary tree whose root is on level 1, the maximum number of nodes on level i is:	{2^i,2^(i-1),"2i - 1",i^2}	2	Official answer key: B	1.00	2026-11-19 00:19:39.690448+05:30	f	[]	[]
250	2	DSA-M4-Q100	4	A non-empty binary tree has 7 leaf nodes. The number of nodes having two children is:	{6,7,8,3}	1	Official answer key: A	1.00	2026-11-19 00:19:39.690719+05:30	f	[]	[]
251	2	DSA-M4-Q101	4	A strictly binary tree has 15 internal nodes (all of degree 2). The total number of nodes in the tree is:	{31,30,32,16}	1	Official answer key: A	1.00	2026-11-19 00:19:39.6911+05:30	f	[]	[]
252	2	DSA-M4-Q102	4	A complete binary tree is stored in a one-dimensional array with the root at index 1. For the node at index 6, which statement is correct?	{"Parent at index 2, left child at index 12 and right child at index 13","Parent at index 3, left child at index 11 and right child at index 12","Parent at index 5, left child at index 7 and right child at index 8","Parent at index 3, left child at index 12 and right child at index 13"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.691378+05:30	f	[]	[]
253	2	DSA-M4-Q103	4	A complete binary tree with 12 nodes is stored in an array with the root at index 1. Which statement is true?	{"Node 6 has no children","Node 6 has a left child (index 12) but no right child","Node 5 has no right child","The parent of node 12 is node 5"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.691693+05:30	f	[]	[]
254	2	DSA-M4-Q104	4	The inorder traversal of a binary tree visits the nodes in the order:	{"Root, left subtree, right subtree","Left subtree, root, right subtree","Left subtree, right subtree, root","Right subtree, root, left subtree"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.69197+05:30	f	[]	[]
255	2	DSA-M4-Q105	4	Which traversal visits the root node after both of its subtrees have been visited?	{Preorder,Inorder,Postorder,Level-order}	3	Official answer key: C	1.00	2026-11-19 00:19:39.692254+05:30	f	[]	[]
256	2	DSA-M4-Q106	4	What is the postorder traversal of the binary tree shown in the figure? A B C D F G H I J K	{"I J D F B K G H C A","A B D I J F C G K H","I D J B F A G K C H","I J D F B G K H C A"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.692527+05:30	f	[]	[]
257	2	DSA-M4-Q107	4	The preorder traversal of a binary tree is A B D E C F and its inorder traversal is D B E A F C. Its postorder traversal is:	{"D B E F C A","D E B F C A","E D B F C A","D E B C F A"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.692886+05:30	f	[]	[]
258	2	DSA-M4-Q108	4	An expression tree is built from the postfix expression A B / C * D * E +. Its level-order traversal is:	{"+ * * / A B C D E","+ * E * D / C A B","A B / C * D * E +","+ * E * D C / A B"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.693156+05:30	f	[]	[]
259	2	DSA-M4-Q109	4	A binary tree has root 4 with a left child 2 and a right child 6 (both leaves). What is the output of the following function when called as trav(root)? void trav(tree_pointer p) { if (p) { printf("%d ", p->data); trav(p->left_child); trav(p->right_child); printf("%d ", p->data); } }	{"4 2 6 6 2 4","4 2 6 4","2 6 4 4 2 6","4 2 2 6 6 4"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.693419+05:30	f	[]	[]
260	2	DSA-M4-Q110	4	Level-order traversal of a binary tree is implemented using a:	{Stack,Queue,"Linked list sorted by key","Hash table"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.693773+05:30	f	[]	[]
261	2	DSA-M4-Q111	4	In the iterative inorder traversal (iter_inorder) of an n-node binary tree, each node is placed on and removed from the stack:	{"Exactly once, giving O(n) time","Exactly twice, giving O(n^2) time","log n times, giving O(n log n) time","Only if it is a leaf, giving O(log n) time"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.694063+05:30	f	[]	[]
262	2	DSA-M4-Q112	4	In a threaded binary tree node, if ptr->leftThread = TRUE, then ptr->leftChild contains:	{"A pointer to the left child","The address of the right sibling","A thread, not a pointer to the left child","Always NULL"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.694329+05:30	f	[]	[]
825	1	Q-M3-164BD66838	3	Select the best answer. Which protocol provides logical addressing at the Internet layer?	{FTP,IP,Ethernet,SMTP}	2	\N	1.00	2026-11-19 02:38:43.012559+05:30	f	[]	[]
263	2	DSA-M4-Q113	4	A header node is assumed for all threaded binary trees in order to:	{"Store the total number of nodes of the tree","Convert the tree into a complete binary tree","Make the tree a binary search tree","Avoid loose (dangling) threads; the original tree becomes the left subtree of the header node"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.694592+05:30	f	[]	[]
264	2	DSA-M4-Q114	4	In a binary search tree, for every node:	{"Keys in its left subtree are larger and keys in its right subtree are smaller than its key","All keys in the tree are equal","Keys in its left subtree are smaller and keys in its right subtree are larger than its key","The left child is always a leaf"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.694993+05:30	f	[]	[]
265	2	DSA-M4-Q115	4	If h is the height of a binary search tree, searching for a key (recursively or iteratively) takes:	{"O(1) time","O(h) time","O(h^2) time","O(n^2) time"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.695265+05:30	f	[]	[]
266	2	DSA-M4-Q116	4	In a binary search tree, a new node is always inserted as a:	{"Root node","Internal node","Left child of the root","Leaf node"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.69553+05:30	f	[]	[]
267	2	DSA-M4-Q117	4	The keys 10, 12, 5, 4, 20, 8, 7, 15, 13 are inserted, in this order, into an initially empty binary search tree. Taking the height of a tree with a single node as 0, the height of the resulting tree is:	{3,5,4,6}	3	Official answer key: C	1.00	2026-11-19 00:19:39.695809+05:30	f	[]	[]
268	2	DSA-M4-Q118	4	The keys 10, 12, 5, 4, 20, 8, 7, 15, 13 are inserted, in this order, into an initially empty binary search tree. Its preorder traversal is:	{"10 5 4 8 7 12 20 15 13","4 5 7 8 10 12 13 15 20","10 5 12 4 8 20 7 15 13","10 12 5 4 20 8 7 15 13"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.696075+05:30	f	[]	[]
269	2	DSA-M4-Q119	4	To delete a node having two children from a binary search tree, the node is replaced by:	{"Its parent node","The smallest key in its left subtree or the largest key in its right subtree","Either the largest key in its left subtree or the smallest key in its right subtree","The root of the tree"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.696629+05:30	f	[]	[]
270	2	DSA-M4-Q120	4	In the binary search tree built from the keys 10, 12, 5, 4, 20, 8, 7, 15, 13, the root 10 is deleted by replacing it with the largest key of its left subtree. Which key becomes the replacement?	{7,12,5,8}	4	Official answer key: D	1.00	2026-11-19 00:19:39.697009+05:30	f	[]	[]
271	2	DSA-M5-Q121	5	The length of a path in a graph is:	{"The number of vertices in the path","The number of edges in the path","The sum of the degrees of its vertices","The number of cycles in the path"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.697586+05:30	f	[]	[]
272	2	DSA-M5-Q122	5	A graph G = (V, E) consists of:	{"A set of edges only","A set of vertices only, with no relation between them","A finite non-empty set of vertices V and a set E of pairs of vertices called edges","A set of nodes arranged in levels"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.698111+05:30	f	[]	[]
273	2	DSA-M5-Q123	5	In an undirected graph, the pairs (u, v) and (v, u):	{"Represent two different edges","Represent the same edge","Represent a self loop","Cannot both be present in the graph"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.698496+05:30	f	[]	[]
274	2	DSA-M5-Q124	5	How many edges does a complete undirected graph with 6 vertices have?	{30,12,21,15}	4	Official answer key: D	1.00	2026-11-19 00:19:39.698998+05:30	f	[]	[]
275	2	DSA-M5-Q125	5	An edge of the form (v, v), which starts and ends at the same vertex, is called a:	{Multi-edge,"Cycle of length two","Weighted edge","Self loop (self edge)"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.699357+05:30	f	[]	[]
276	2	DSA-M5-Q126	5	For the directed graph shown in the figure, the in-degree and the out-degree of vertex c are, respectively: a b d c	{"1 and 2","2 and 1","2 and 2","3 and 1"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.699632+05:30	f	[]	[]
277	2	DSA-M5-Q127	5	A directed graph G is said to be strongly connected if:	{"For every pair of distinct vertices u and v there is a directed path from u to v and from v to u","It contains no cycles","Every vertex has at least one outgoing edge","Every vertex has in-degree equal to its out-degree"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.699903+05:30	f	[]	[]
278	2	DSA-M5-Q128	5	The adjacency matrix of an undirected graph is always:	{Symmetric,"Upper triangular","A diagonal matrix","An identity matrix"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.700173+05:30	f	[]	[]
279	2	DSA-M5-Q129	5	For an undirected graph with n vertices and e edges, the adjacency list representation requires an array of size n and how many chain nodes?	{e,"n + e",n^2,2e}	4	Official answer key: D	1.00	2026-11-19 00:19:39.70044+05:30	f	[]	[]
280	2	DSA-M5-Q130	5	In the adjacency multilist representation of a graph:	{"Each edge is represented by two nodes, one in each end vertex's list","Each vertex is represented by n nodes","Only the edge weights are stored, not the vertices","Each edge is represented by exactly one node, which appears in the lists of both of its end vertices"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.700719+05:30	f	[]	[]
281	2	DSA-M5-Q131	5	Which data structure is used to maintain the current position in the adjacency lists during depth first search?	{Queue,"Priority queue",Stack,"Hash table"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.700988+05:30	f	[]	[]
282	2	DSA-M5-Q132	5	Breadth first search of a graph uses which data structure to hold the visited vertices whose adjacency lists are yet to be examined?	{Stack,Queue,"Binary tree","Array of weights"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.701266+05:30	f	[]	[]
283	2	DSA-M5-Q133	5	For a graph with n vertices and e edges, the time taken by depth first search when the graph is represented by an adjacency list and by an adjacency matrix is, respectively:	{"O(e) and O(n^2)","O(n^2) and O(e)","O(n) and O(n)","O(e) and O(e)"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.701657+05:30	f	[]	[]
284	2	DSA-M5-Q134	5	A depth first search is started from vertex 0 of the undirected graph in the figure. The adjacency lists are 0: 1, 2; 1: 0, 3, 4; 2: 0, 4; 3: 1; 4: 1, 2, and the vertices of each list are examined in the given order. The vertices are visited in the order: 0 1 2 3 4	{"0 1 3 4 2","0 1 2 3 4","0 2 4 1 3","0 1 4 2 3"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.701934+05:30	f	[]	[]
285	2	DSA-M5-Q135	5	A directed graph has the adjacency lists 0: 2, 1, 3; 1: 4; 2: 5, 4; 3: 5; 4: 6; 5: 6; 6: (none). A breadth first search is started from vertex 0 and the adjacency lists are scanned in the given order. The vertices are visited in the order:	{"0 1 2 3 4 5 6","0 2 1 3 5 4 6","0 2 5 6 4 1 3","0 2 1 3 4 5 6"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.702288+05:30	f	[]	[]
286	2	DSA-M5-Q136	5	Insertion sort (as given in the notes) is applied to the list 5, 2, 4, 6, 1, 3. The total number of times an element is shifted one position to the right (a[i+1] = a[i]) during the sort is:	{9,10,8,15}	1	Official answer key: A	1.00	2026-11-19 00:19:39.70271+05:30	f	[]	[]
287	2	DSA-M5-Q137	5	Radix sort (least significant digit first, with each bucket preserving the input order) is applied to 348, 143, 361, 423, 538, 128, 321, 543, 366. The list after the first pass (units digit) is:	{"321 361 143 423 543 366 538 348 128","128 143 321 348 361 366 423 538 543","361 321 143 423 543 366 348 538 128","348 143 361 423 538 128 321 543 366"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.702982+05:30	f	[]	[]
288	2	DSA-M5-Q138	5	If each number in a list has s digits (radix d), the radix sort algorithm requires:	{"d passes","s passes","n passes","log n passes"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.703441+05:30	f	[]	[]
289	2	DSA-M5-Q139	5	The function f used in address calculation sort must be order preserving, which means:	{"If x <= y then f(x) <= f(y)","If x <= y then f(x) >= f(y)","f(x) is different for every key x","f(x) is chosen randomly for every key"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.703719+05:30	f	[]	[]
290	2	DSA-M5-Q140	5	In hashing, a collision occurs when:	{"A key is not found in the hash table","The hash table becomes empty","Two or more keys map to the same memory location","The hash function returns a negative value"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.703981+05:30	f	[]	[]
291	2	DSA-M5-Q141	5	In the division method of hashing, the hash function is:	{"h(x) = x div M","h(x) = x * M","h(x) = M - x","h(x) = x mod M"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.704354+05:30	f	[]	[]
292	2	DSA-M5-Q142	5	A hash table of size 10 uses H(k) = k mod 10 with linear probing. The keys 72, 27, 36, 24, 63, 81, 92, 101 are inserted in this order. At which index is the key 101 stored?	{5,8,1,9}	2	Official answer key: B	1.00	2026-11-19 00:19:39.704674+05:30	f	[]	[]
293	2	DSA-M5-Q143	5	The keys 72, 27, 36, 24, 63, 81, 92, 101 are stored, in this order, in a hash table of size 10 using H(k) = k mod 10 and linear probing. The average search length (total probes needed to find all 8 keys divided by 8) is:	{2.0,1.5,2.25,3.0}	3	Official answer key: C	1.00	2026-11-19 00:19:39.705569+05:30	f	[]	[]
294	2	DSA-M5-Q144	5	A hash table of size 10 uses H(k) = k mod 10 with quadratic probing (probes h, h+1, h+4, h+9, ...). The keys 22, 32 and 42 are inserted in this order. At which index is 42 stored?	{4,3,5,6}	4	Official answer key: D	1.00	2026-11-19 00:19:39.705844+05:30	f	[]	[]
295	2	DSA-M5-Q145	5	Double hashing with H1(key) = key % 10 and H2(key) = 7 - (key % 7) is used, and a collision is resolved with (H1(key) + i x H2(key)) % 10. The keys 37, 90, 45, 22, 17, 49, 55 are inserted in this order. At which index is the key 17 stored?	{1,8,4,7}	1	Official answer key: A	1.00	2026-11-19 00:19:39.706115+05:30	f	[]	[]
296	2	DSA-M5-Q146	5	Using the folding method for a hash table with 100 locations, the key 123456 is divided into the parts 12, 34 and 56, which are added, ignoring any carry. The hash value is:	{102,12,56,"2 (that is, 02)"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.7064+05:30	f	[]	[]
297	2	DSA-M5-Q147	5	Words are stored using chaining in a table of size 5 with H(str) = (sum of the positions of its letters in the English alphabet) % 5. The words like, a, tree, you, first, a, place, to are inserted in this order at the rear of their chains. The words in the chain of index 2 are:	{"a, you, a","tree, first, place","like, first, place","like, tree, place"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.706672+05:30	f	[]	[]
298	2	DSA-M5-Q148	5	In rehashing, when the hash table becomes nearly full:	{"The entries are copied to the same positions of a bigger table","A new table of double the size is created and every entry is re-inserted using its newly computed hash value","The size of the table is halved and the entries are rehashed","All the chains are deleted and the table is emptied"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.706948+05:30	f	[]	[]
299	2	DSA-M5-Q149	5	Which of the following is a drawback of static hashing?	{"The table size is fixed, so it cannot accommodate data growth and collisions increase as the data grows","It requires a directory of pointers that must be doubled","It cannot use chaining or linear probing","The hash function cannot be computed in constant time"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.707226+05:30	f	[]	[]
300	2	DSA-M5-Q150	5	Which statement about dynamic hashing is correct?	{"Linear hashing uses a directory that is doubled, whereas extendible hashing splits buckets in round-robin order","Both extendible and linear hashing use a table of fixed size","Extendible hashing uses a directory that is doubled, splitting only the bucket that overflowed, whereas linear hashing uses no directory and splits buckets in round-robin order","Extendible hashing needs overflow pages, whereas linear hashing needs none"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.707588+05:30	f	[]	[]
301	3	LDCO-M1-Q001	1	Which of the following laws is valid in Boolean algebra but NOT valid in ordinary algebra?	{"x + y = y + x","(x·y)·z = x·(y·z)","x·(y + z) = x·y + x·z","x + (y·z) = (x + y)·(x + z)"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.716491+05:30	f	[]	[]
302	3	LDCO-M1-Q002	1	Who introduced the two-valued Boolean algebra called 'switching algebra' in 1938?	{"C. E. Shannon","Augustus De Morgan","E. V. Huntington","George Boole"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.716893+05:30	f	[]	[]
303	3	LDCO-M1-Q003	1	According to the duality principle, the dual of the expression x + 0 = x is:	{"x · 1 = x","x · 0 = x","x + 1 = x","x' + 1 = x'"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.717161+05:30	f	[]	[]
304	3	LDCO-M1-Q004	1	Simplify the expression x + x'y.	{xy,y,"x + y",x}	3	Official answer key: C	1.00	2026-11-19 00:19:39.717416+05:30	f	[]	[]
305	3	LDCO-M1-Q005	1	According to De Morgan's theorem, (x·y)' is equal to:	{"x + y","x · y'","x' · y'","x' + y'"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.717772+05:30	f	[]	[]
306	3	LDCO-M1-Q006	1	The correct order of precedence of Boolean operators (highest to lowest) is:	{"NOT, Parentheses, OR, AND","Parentheses, AND, NOT, OR","Parentheses, NOT, AND, OR","Parentheses, OR, AND, NOT"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.71811+05:30	f	[]	[]
307	3	LDCO-M1-Q007	1	A Boolean function of 4 variables has a truth table with how many rows?	{32,4,16,8}	3	Official answer key: C	1.00	2026-11-19 00:19:39.7185+05:30	f	[]	[]
308	3	LDCO-M1-Q008	1	How many different Boolean functions can be formed with 3 binary variables?	{256,65536,8,64}	1	Official answer key: A	1.00	2026-11-19 00:19:39.718772+05:30	f	[]	[]
309	3	LDCO-M1-Q009	1	If F(A, B, C) = Σ(1, 4, 5, 6, 7), then the complement F' in minterm form is:	{"Σ(1, 4, 5)","Σ(0, 2, 3)","Σ(0, 1, 2)","Σ(2, 3, 7)"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.719034+05:30	f	[]	[]
310	3	LDCO-M1-Q010	1	The function F(x, y, z) = Π(0, 2, 4, 5) expressed as a sum of minterms is:	{"Σ(1, 2, 6, 7)","Σ(0, 2, 4, 5)","Σ(1, 3, 6, 7)","Σ(1, 3, 5, 7)"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.719312+05:30	f	[]	[]
311	3	LDCO-M1-Q011	1	For three variables x, y, z, the maxterm M3 is:	{"x' + y' + z","x + y' + z'","x' + y + z","x' y z"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.71964+05:30	f	[]	[]
312	3	LDCO-M1-Q012	1	Using the K-map shown, the simplified SOP expression for F(x, y, z) = Σ(2, 3, 4, 5) is:	{"y + z","xy + x'y'","x'y + xy'","x'z + xz'"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.719919+05:30	f	[]	[]
313	3	LDCO-M1-Q013	1	Using the K-map shown, the simplified expression for F(w, x, y, z) is:	{"y' + w'z' + xz'","y' + w'z + xz'","y' + wz + xz","y + w'z' + xz'"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.720182+05:30	f	[]	[]
314	3	LDCO-M1-Q014	1	The K-map shows F = Σ(1, 3, 7, 11, 15) with don't-care conditions d = Σ(0, 2, 5). A minimal SOP expression is:	{"F = yz' + w'z","F = y'z + w'x'","F = yz + wx","F = yz + w'x'"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.720451+05:30	f	[]	[]
315	3	LDCO-M1-Q015	1	For the K-map shown (F = Σ(0, 1, 2, 5, 8, 9, 10)), the minimal product-of-sums (POS) expression is:	{"(A + B')(C' + D')(B + D)","(A' + B')(C + D)(B' + D)","(A + B)(C + D)(B + D')","(A' + B')(C' + D')(B' + D)"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.720717+05:30	f	[]	[]
316	3	LDCO-M1-Q016	1	Why are the rows and columns of a K-map labelled in Gray-code order (00, 01, 11, 10)?	{"So that adjacent cells differ in only one variable","To arrange minterms in binary counting order","To reduce the number of cells","To make the map symmetric about the diagonal"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.72098+05:30	f	[]	[]
317	3	LDCO-M1-Q017	1	In a 4-variable K-map, a group of eight adjacent 1s yields a product term with how many literals?	{1,2,3,0}	1	Official answer key: A	1.00	2026-11-19 00:19:39.721282+05:30	f	[]	[]
318	3	LDCO-M1-Q018	1	The shaded cell in the 3-variable K-map shown (row x = 1, column yz = 10) corresponds to minterm:	{m4,m7,m5,m6}	4	Official answer key: D	1.00	2026-11-19 00:19:39.721546+05:30	f	[]	[]
319	3	LDCO-M1-Q019	1	Which pair of gates is called 'universal' because any Boolean function can be built using only one of them?	{"NOT and AND","XOR and XNOR","NAND and NOR","AND and OR"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.721817+05:30	f	[]	[]
320	3	LDCO-M1-Q020	1	Which of the following gate operations is NOT associative, so the multi-input gate is defined as a complemented OR?	{AND,NOR,OR,XOR}	2	Official answer key: B	1.00	2026-11-19 00:19:39.722082+05:30	f	[]	[]
321	3	LDCO-M1-Q021	1	A three-input exclusive-OR gate output equals 1 when:	{"an even number of inputs are 1","all inputs are 1","an odd number of inputs are 1","at least one input is 0"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.722353+05:30	f	[]	[]
322	3	LDCO-M1-Q022	1	The output of the cascaded NAND circuit shown, F = [(ABC)'(DE)']', simplifies to:	{"ABC + DE",(ABC)(DE),"A + B + C + D + E","(ABC)' + (DE)'"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.722707+05:30	f	[]	[]
323	3	LDCO-M1-Q023	1	The output F of the logic circuit shown is:	{"F = x'z + xy'","F = xz + x'y'","F = (x' + z)(x + y')","F = x'y + xz'"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.723+05:30	f	[]	[]
324	3	LDCO-M1-Q024	1	In the Quine–McCluskey tabular method, the first step is to:	{"group the minterms according to the number of 1s in their binary form","draw the K-map","apply De Morgan's theorem to all terms","find the essential prime implicants"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.723274+05:30	f	[]	[]
325	3	LDCO-M1-Q025	1	Using the Quine–McCluskey method, F(W, X, Y, Z) = Σm(2, 6, 8, 9, 10, 11, 14, 15) simplifies to:	{"Y'Z + W'X + WY","YZ' + WX' + WY","YZ + WX + W'Y","YZ' + W'X' + WY'"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.723538+05:30	f	[]	[]
326	3	LDCO-M1-Q026	1	In a K-map, a don't-care condition (X) may be treated as:	{"ignored and left out of every group","either 0 or 1, whichever gives the simpler expression","always 0","always 1"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.723853+05:30	f	[]	[]
327	3	LDCO-M1-Q027	1	Which IC logic family is preferred in systems that require low power consumption?	{ECL,TTL,I²L,CMOS}	4	Official answer key: D	1.00	2026-11-19 00:19:39.724114+05:30	f	[]	[]
328	3	LDCO-M1-Q028	1	Which IC logic family is used in systems that require very high-speed operation?	{MOS,ECL,CMOS,I²L}	2	Official answer key: B	1.00	2026-11-19 00:19:39.724371+05:30	f	[]	[]
329	3	LDCO-M1-Q029	1	A 14-pin SSI package (two pins for power supply) can accommodate how many two-input gates?	{4,3,7,6}	1	Official answer key: A	1.00	2026-11-19 00:19:39.724636+05:30	f	[]	[]
330	3	LDCO-M1-Q030	1	In a negative-logic system, logic-1 is represented by:	{"the low voltage level (L)","the high voltage level (H)","0 volts always","a negative voltage always"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.724905+05:30	f	[]	[]
331	3	LDCO-M2-Q031	2	A combinational circuit is one whose output at any time depends on:	{"the present inputs and past inputs","only the present combination of inputs","the stored state only","a clock signal only"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.725165+05:30	f	[]	[]
333	3	LDCO-M2-Q033	2	The circuit shown, built from an XOR gate and an AND gate with inputs A and B, is a:	{comparator,"half subtractor","full adder","half adder"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.725703+05:30	f	[]	[]
334	3	LDCO-M2-Q034	2	For a half adder with inputs x = 1 and y = 1, the outputs (Sum, Carry) are:	{"Sum = 1, Carry = 1","Sum = 1, Carry = 0","Sum = 0, Carry = 1","Sum = 0, Carry = 0"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.726127+05:30	f	[]	[]
335	3	LDCO-M2-Q035	2	For a full adder with inputs x = 1, y = 0 and z (carry-in) = 1, the output carry C is:	{"1 (and Sum = 1)","0 (and Sum = 1)","1 (and Sum = 0)","0 (and Sum = 0)"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.726399+05:30	f	[]	[]
336	3	LDCO-M2-Q036	2	In the full adder shown (two half adders and one extra gate), the extra gate that produces the output carry is a(n):	{"NAND gate","OR gate","AND gate","XOR gate"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.726664+05:30	f	[]	[]
337	3	LDCO-M2-Q037	2	For a half subtractor with minuend x = 0 and subtrahend y = 1, the borrow output B is:	{1,"Cannot be determined",x,0}	1	Official answer key: A	1.00	2026-11-19 00:19:39.727134+05:30	f	[]	[]
338	3	LDCO-M2-Q038	2	A full adder can be converted into a full subtractor by:	{"replacing the XOR gates with AND gates","complementing input x before applying it to the gates that form the carry (borrow) output","complementing the output sum","complementing input y before the sum gate"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.727417+05:30	f	[]	[]
339	3	LDCO-M2-Q039	2	For a full subtractor with x = 0, y = 1 and previous borrow z = 1, the outputs (Difference D, Borrow B) are:	{"D = 0, B = 0","D = 1, B = 1","D = 1, B = 0","D = 0, B = 1"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.727698+05:30	f	[]	[]
340	3	LDCO-M2-Q040	2	The excess-3 code for decimal digit 5 (BCD 0101) is:	{0101,1001,0111,1000}	4	Official answer key: D	1.00	2026-11-19 00:19:39.727976+05:30	f	[]	[]
341	3	LDCO-M2-Q041	2	In the BCD-to-excess-3 code converter, the output bit z (least significant) is given by (inputs A, B, C, D):	{"z = CD'","z = C ⊕ D","z = D'","z = D"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.728242+05:30	f	[]	[]
342	3	LDCO-M2-Q042	2	For the NAND circuit shown, the output F is:	{"AB + ACD + BC'","AB + ACD' + B'C","AB + CD + B'C'","A(B' + CD) + BC"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.728552+05:30	f	[]	[]
343	3	LDCO-M2-Q043	2	An AND operation can be realised using NAND gates only by:	{"inverting both inputs and then using a NAND gate","a single NAND gate","a NAND gate followed by a NAND gate wired as an inverter","two NAND gates in parallel"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.728832+05:30	f	[]	[]
344	3	LDCO-M2-Q044	2	An n-variable exclusive-OR function is equal to 1 for those minterms that have:	{"an even number of 1s","an odd number of 1s","all variables equal to 1","exactly one 0"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.729237+05:30	f	[]	[]
345	3	LDCO-M2-Q045	2	In the 4-bit ripple-carry adder shown, the delay of the adder is mainly decided by:	{"the number of output pins","the time taken by the carry to propagate through all full adders","the clock frequency","the delay of the sum XOR gates only"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.72952+05:30	f	[]	[]
346	3	LDCO-M2-Q046	2	In a look-ahead carry adder, with carry generate Gi = AiBi and carry propagate Pi = Ai ⊕ Bi, the carry C2 is:	{"G1 ⊕ P1C1","G1·P1 + C1","G1 + P1C1","P1 + G1C1"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.729808+05:30	f	[]	[]
347	3	LDCO-M2-Q047	2	In a look-ahead carry generator, the carry C3 is expressed as:	{"G2P2 + G1P1C1","G2 + G1 + C1","G2 + P2G1 + P2P1C1","G2 + P2 + P1C1"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.730085+05:30	f	[]	[]
348	3	LDCO-M2-Q048	2	A BCD adder corrects an invalid binary sum (greater than 9) by adding:	{1010,0110,0011,1001}	2	Official answer key: B	1.00	2026-11-19 00:19:39.730367+05:30	f	[]	[]
349	3	LDCO-M2-Q049	2	Adding the BCD digits 7 and 8 using a BCD adder gives the corrected BCD result:	{"0000 1111","0001 0101","0001 0011","0001 1111"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.730636+05:30	f	[]	[]
350	3	LDCO-M2-Q050	2	The BCD adder block diagram shown uses how many 4-bit binary adders?	{3,4,1,2}	4	Official answer key: D	1.00	2026-11-19 00:19:39.730913+05:30	f	[]	[]
351	3	LDCO-M2-Q051	2	In a magnitude comparator, two 4-bit numbers A and B are equal when:	{"A0 = B0 and A3 ≠ B3","any one pair of bits is equal","A3 = B3 only","all pairs of corresponding bits are equal (xi = AiBi + Ai'Bi' = 1 for every i)"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.731184+05:30	f	[]	[]
352	3	LDCO-M2-Q052	2	In a 3-to-8 line decoder, when the input xyz = 101, the active output is:	{D4,D3,D6,D5}	4	Official answer key: D	1.00	2026-11-19 00:19:39.731455+05:30	f	[]	[]
353	3	LDCO-M2-Q053	2	A full adder is implemented using a 3×8 decoder and two OR gates, as partly shown (S = Σ(1, 2, 4, 7)). The OR gate for the carry C must be connected to decoder outputs:	{"3, 5, 6, 7","1, 2, 4, 7","2, 3, 6, 7","0, 1, 2, 4"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.731829+05:30	f	[]	[]
354	3	LDCO-M2-Q054	2	In the circuit shown (two 3×8 decoders with enable inputs, w inverted for the top decoder), when w = 1 the outputs that generate minterms are:	{"all outputs are 1","D8 to D15 (bottom decoder enabled)","D0 to D7 (top decoder enabled)","all outputs are 0"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.73221+05:30	f	[]	[]
355	3	LDCO-M2-Q055	2	In an octal-to-binary encoder, the output bit x (most significant) is 1 for octal digits:	{"2, 3, 6 or 7","4, 5, 6 or 7 (x = D4 + D5 + D6 + D7)","1, 3, 5 or 7","0, 1, 2 or 3"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.732533+05:30	f	[]	[]
356	3	LDCO-M2-Q056	2	How many selection lines are needed for an 8-to-1 multiplexer?	{8,3,4,2}	2	Official answer key: B	1.00	2026-11-19 00:19:39.732795+05:30	f	[]	[]
357	3	LDCO-M2-Q057	2	The 4×1 multiplexer shown has inputs I0 = 0, I1 = 1, I2 = A, I3 = A' and select lines S1 = B, S0 = C. The function F(A, B, C) implemented is:	{"Σ(1, 3, 5, 6)","Σ(1, 3, 5, 7)","Σ(0, 2, 4, 7)","Σ(1, 2, 5, 6)"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.733131+05:30	f	[]	[]
926	1	Q-M3-7A8CCCB7F8	3	Choose the most accurate answer. How many bits are in an IPv6 address?	{"128 bits","48 bits","64 bits","32 bits"}	1	\N	1.00	2026-11-19 02:38:43.340056+05:30	f	[]	[]
358	3	LDCO-M2-Q058	2	A ROM that has 5 address input lines and 8 output lines is described as a:	{"5 × 8 ROM","32 × 8 ROM","8 × 32 ROM","16 × 8 ROM"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.733403+05:30	f	[]	[]
359	3	LDCO-M2-Q059	2	For the PLA program table shown (3 inputs, 3 product terms, 2 outputs), the number of programmed links 2n×k + k×m + m is:	{32,18,24,26}	4	Official answer key: D	1.00	2026-11-19 00:19:39.733925+05:30	f	[]	[]
360	3	LDCO-M2-Q060	2	Compared with a ROM, a PLA replaces the decoder with:	{"a bank of OR gates only","a set of flip-flops","a multiplexer","a programmable group of AND gates generating product terms"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.734298+05:30	f	[]	[]
361	4	LDCO-M1-Q001	1	Which of the following laws is valid in Boolean algebra but NOT valid in ordinary algebra?	{"x + y = y + x","(x·y)·z = x·(y·z)","x·(y + z) = x·y + x·z","x + (y·z) = (x + y)·(x + z)"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.740679+05:30	f	[]	[]
362	4	LDCO-M1-Q002	1	Who introduced the two-valued Boolean algebra called 'switching algebra' in 1938?	{"C. E. Shannon","Augustus De Morgan","E. V. Huntington","George Boole"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.740991+05:30	f	[]	[]
363	4	LDCO-M1-Q003	1	According to the duality principle, the dual of the expression x + 0 = x is:	{"x · 1 = x","x · 0 = x","x + 1 = x","x' + 1 = x'"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.74127+05:30	f	[]	[]
364	4	LDCO-M1-Q004	1	Simplify the expression x + x'y.	{xy,y,"x + y",x}	3	Official answer key: C	1.00	2026-11-19 00:19:39.741535+05:30	f	[]	[]
365	4	LDCO-M1-Q005	1	According to De Morgan's theorem, (x·y)' is equal to:	{"x + y","x · y'","x' · y'","x' + y'"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.741925+05:30	f	[]	[]
366	4	LDCO-M1-Q006	1	The correct order of precedence of Boolean operators (highest to lowest) is:	{"NOT, Parentheses, OR, AND","Parentheses, AND, NOT, OR","Parentheses, NOT, AND, OR","Parentheses, OR, AND, NOT"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.742282+05:30	f	[]	[]
367	4	LDCO-M1-Q007	1	A Boolean function of 4 variables has a truth table with how many rows?	{32,4,16,8}	3	Official answer key: C	1.00	2026-11-19 00:19:39.742564+05:30	f	[]	[]
368	4	LDCO-M1-Q008	1	How many different Boolean functions can be formed with 3 binary variables?	{256,65536,8,64}	1	Official answer key: A	1.00	2026-11-19 00:19:39.742841+05:30	f	[]	[]
369	4	LDCO-M1-Q009	1	If F(A, B, C) = Σ(1, 4, 5, 6, 7), then the complement F' in minterm form is:	{"Σ(1, 4, 5)","Σ(0, 2, 3)","Σ(0, 1, 2)","Σ(2, 3, 7)"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.743109+05:30	f	[]	[]
370	4	LDCO-M1-Q010	1	The function F(x, y, z) = Π(0, 2, 4, 5) expressed as a sum of minterms is:	{"Σ(1, 2, 6, 7)","Σ(0, 2, 4, 5)","Σ(1, 3, 6, 7)","Σ(1, 3, 5, 7)"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.74339+05:30	f	[]	[]
371	4	LDCO-M1-Q011	1	For three variables x, y, z, the maxterm M3 is:	{"x' + y' + z","x + y' + z'","x' + y + z","x' y z"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.743704+05:30	f	[]	[]
372	4	LDCO-M1-Q012	1	Using the K-map shown, the simplified SOP expression for F(x, y, z) = Σ(2, 3, 4, 5) is:	{"y + z","xy + x'y'","x'y + xy'","x'z + xz'"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.743992+05:30	f	[]	[]
373	4	LDCO-M1-Q013	1	Using the K-map shown, the simplified expression for F(w, x, y, z) is:	{"y' + w'z' + xz'","y' + w'z + xz'","y' + wz + xz","y + w'z' + xz'"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.744273+05:30	f	[]	[]
374	4	LDCO-M1-Q014	1	The K-map shows F = Σ(1, 3, 7, 11, 15) with don't-care conditions d = Σ(0, 2, 5). A minimal SOP expression is:	{"F = yz' + w'z","F = y'z + w'x'","F = yz + wx","F = yz + w'x'"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.744567+05:30	f	[]	[]
375	4	LDCO-M1-Q015	1	For the K-map shown (F = Σ(0, 1, 2, 5, 8, 9, 10)), the minimal product-of-sums (POS) expression is:	{"(A + B')(C' + D')(B + D)","(A' + B')(C + D)(B' + D)","(A + B)(C + D)(B + D')","(A' + B')(C' + D')(B' + D)"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.744955+05:30	f	[]	[]
376	4	LDCO-M1-Q016	1	Why are the rows and columns of a K-map labelled in Gray-code order (00, 01, 11, 10)?	{"So that adjacent cells differ in only one variable","To arrange minterms in binary counting order","To reduce the number of cells","To make the map symmetric about the diagonal"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.745231+05:30	f	[]	[]
377	4	LDCO-M1-Q017	1	In a 4-variable K-map, a group of eight adjacent 1s yields a product term with how many literals?	{1,2,3,0}	1	Official answer key: A	1.00	2026-11-19 00:19:39.745502+05:30	f	[]	[]
378	4	LDCO-M1-Q018	1	The shaded cell in the 3-variable K-map shown (row x = 1, column yz = 10) corresponds to minterm:	{m4,m7,m5,m6}	4	Official answer key: D	1.00	2026-11-19 00:19:39.745766+05:30	f	[]	[]
379	4	LDCO-M1-Q019	1	Which pair of gates is called 'universal' because any Boolean function can be built using only one of them?	{"NOT and AND","XOR and XNOR","NAND and NOR","AND and OR"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.746042+05:30	f	[]	[]
380	4	LDCO-M1-Q020	1	Which of the following gate operations is NOT associative, so the multi-input gate is defined as a complemented OR?	{AND,NOR,OR,XOR}	2	Official answer key: B	1.00	2026-11-19 00:19:39.746324+05:30	f	[]	[]
381	4	LDCO-M1-Q021	1	A three-input exclusive-OR gate output equals 1 when:	{"an even number of inputs are 1","all inputs are 1","an odd number of inputs are 1","at least one input is 0"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.746667+05:30	f	[]	[]
382	4	LDCO-M1-Q022	1	The output of the cascaded NAND circuit shown, F = [(ABC)'(DE)']', simplifies to:	{"ABC + DE",(ABC)(DE),"A + B + C + D + E","(ABC)' + (DE)'"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.747279+05:30	f	[]	[]
383	4	LDCO-M1-Q023	1	The output F of the logic circuit shown is:	{"F = x'z + xy'","F = xz + x'y'","F = (x' + z)(x + y')","F = x'y + xz'"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.747719+05:30	f	[]	[]
457	5	OS-M2-Q037	2	In the array-doubling strategy for a stack stored in a dynamic array, the total time spent on all array doublings over n push operations is:	{O(n^2),"O(log n)",O(n),"O(n log n)"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.784824+05:30	f	[]	[]
384	4	LDCO-M1-Q024	1	In the Quine–McCluskey tabular method, the first step is to:	{"group the minterms according to the number of 1s in their binary form","draw the K-map","apply De Morgan's theorem to all terms","find the essential prime implicants"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.748049+05:30	f	[]	[]
385	4	LDCO-M1-Q025	1	Using the Quine–McCluskey method, F(W, X, Y, Z) = Σm(2, 6, 8, 9, 10, 11, 14, 15) simplifies to:	{"Y'Z + W'X + WY","YZ' + WX' + WY","YZ + WX + W'Y","YZ' + W'X' + WY'"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.748634+05:30	f	[]	[]
386	4	LDCO-M1-Q026	1	In a K-map, a don't-care condition (X) may be treated as:	{"ignored and left out of every group","either 0 or 1, whichever gives the simpler expression","always 0","always 1"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.749123+05:30	f	[]	[]
387	4	LDCO-M1-Q027	1	Which IC logic family is preferred in systems that require low power consumption?	{ECL,TTL,I²L,CMOS}	4	Official answer key: D	1.00	2026-11-19 00:19:39.749613+05:30	f	[]	[]
388	4	LDCO-M1-Q028	1	Which IC logic family is used in systems that require very high-speed operation?	{MOS,ECL,CMOS,I²L}	2	Official answer key: B	1.00	2026-11-19 00:19:39.74997+05:30	f	[]	[]
389	4	LDCO-M1-Q029	1	A 14-pin SSI package (two pins for power supply) can accommodate how many two-input gates?	{4,3,7,6}	1	Official answer key: A	1.00	2026-11-19 00:19:39.750254+05:30	f	[]	[]
390	4	LDCO-M1-Q030	1	In a negative-logic system, logic-1 is represented by:	{"the low voltage level (L)","the high voltage level (H)","0 volts always","a negative voltage always"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.750532+05:30	f	[]	[]
391	4	LDCO-M2-Q031	2	A combinational circuit is one whose output at any time depends on:	{"the present inputs and past inputs","only the present combination of inputs","the stored state only","a clock signal only"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.750991+05:30	f	[]	[]
392	4	LDCO-M2-Q032	2	Which of the following is NOT a combinational circuit?	{"Binary counter",Decoder,Adder,Multiplexer}	1	Official answer key: A	1.00	2026-11-19 00:19:39.75129+05:30	f	[]	[]
393	4	LDCO-M2-Q033	2	The circuit shown, built from an XOR gate and an AND gate with inputs A and B, is a:	{comparator,"half subtractor","full adder","half adder"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.751553+05:30	f	[]	[]
394	4	LDCO-M2-Q034	2	For a half adder with inputs x = 1 and y = 1, the outputs (Sum, Carry) are:	{"Sum = 1, Carry = 1","Sum = 1, Carry = 0","Sum = 0, Carry = 1","Sum = 0, Carry = 0"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.75181+05:30	f	[]	[]
395	4	LDCO-M2-Q035	2	For a full adder with inputs x = 1, y = 0 and z (carry-in) = 1, the output carry C is:	{"1 (and Sum = 1)","0 (and Sum = 1)","1 (and Sum = 0)","0 (and Sum = 0)"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.752122+05:30	f	[]	[]
396	4	LDCO-M2-Q036	2	In the full adder shown (two half adders and one extra gate), the extra gate that produces the output carry is a(n):	{"NAND gate","OR gate","AND gate","XOR gate"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.752389+05:30	f	[]	[]
397	4	LDCO-M2-Q037	2	For a half subtractor with minuend x = 0 and subtrahend y = 1, the borrow output B is:	{1,"Cannot be determined",x,0}	1	Official answer key: A	1.00	2026-11-19 00:19:39.752854+05:30	f	[]	[]
398	4	LDCO-M2-Q038	2	A full adder can be converted into a full subtractor by:	{"replacing the XOR gates with AND gates","complementing input x before applying it to the gates that form the carry (borrow) output","complementing the output sum","complementing input y before the sum gate"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.753127+05:30	f	[]	[]
399	4	LDCO-M2-Q039	2	For a full subtractor with x = 0, y = 1 and previous borrow z = 1, the outputs (Difference D, Borrow B) are:	{"D = 0, B = 0","D = 1, B = 1","D = 1, B = 0","D = 0, B = 1"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.75339+05:30	f	[]	[]
400	4	LDCO-M2-Q040	2	The excess-3 code for decimal digit 5 (BCD 0101) is:	{0101,1001,0111,1000}	4	Official answer key: D	1.00	2026-11-19 00:19:39.753661+05:30	f	[]	[]
401	4	LDCO-M2-Q041	2	In the BCD-to-excess-3 code converter, the output bit z (least significant) is given by (inputs A, B, C, D):	{"z = CD'","z = C ⊕ D","z = D'","z = D"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.753929+05:30	f	[]	[]
402	4	LDCO-M2-Q042	2	For the NAND circuit shown, the output F is:	{"AB + ACD + BC'","AB + ACD' + B'C","AB + CD + B'C'","A(B' + CD) + BC"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.754247+05:30	f	[]	[]
403	4	LDCO-M2-Q043	2	An AND operation can be realised using NAND gates only by:	{"inverting both inputs and then using a NAND gate","a single NAND gate","a NAND gate followed by a NAND gate wired as an inverter","two NAND gates in parallel"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.754516+05:30	f	[]	[]
404	4	LDCO-M2-Q044	2	An n-variable exclusive-OR function is equal to 1 for those minterms that have:	{"an even number of 1s","an odd number of 1s","all variables equal to 1","exactly one 0"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.754796+05:30	f	[]	[]
405	4	LDCO-M2-Q045	2	In the 4-bit ripple-carry adder shown, the delay of the adder is mainly decided by:	{"the number of output pins","the time taken by the carry to propagate through all full adders","the clock frequency","the delay of the sum XOR gates only"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.755066+05:30	f	[]	[]
406	4	LDCO-M2-Q046	2	In a look-ahead carry adder, with carry generate Gi = AiBi and carry propagate Pi = Ai ⊕ Bi, the carry C2 is:	{"G1 ⊕ P1C1","G1·P1 + C1","G1 + P1C1","P1 + G1C1"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.755334+05:30	f	[]	[]
407	4	LDCO-M2-Q047	2	In a look-ahead carry generator, the carry C3 is expressed as:	{"G2P2 + G1P1C1","G2 + G1 + C1","G2 + P2G1 + P2P1C1","G2 + P2 + P1C1"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.75565+05:30	f	[]	[]
408	4	LDCO-M2-Q048	2	A BCD adder corrects an invalid binary sum (greater than 9) by adding:	{1010,0110,0011,1001}	2	Official answer key: B	1.00	2026-11-19 00:19:39.755935+05:30	f	[]	[]
409	4	LDCO-M2-Q049	2	Adding the BCD digits 7 and 8 using a BCD adder gives the corrected BCD result:	{"0000 1111","0001 0101","0001 0011","0001 1111"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.756903+05:30	f	[]	[]
411	4	LDCO-M2-Q051	2	In a magnitude comparator, two 4-bit numbers A and B are equal when:	{"A0 = B0 and A3 ≠ B3","any one pair of bits is equal","A3 = B3 only","all pairs of corresponding bits are equal (xi = AiBi + Ai'Bi' = 1 for every i)"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.757458+05:30	f	[]	[]
412	4	LDCO-M2-Q052	2	In a 3-to-8 line decoder, when the input xyz = 101, the active output is:	{D4,D3,D6,D5}	4	Official answer key: D	1.00	2026-11-19 00:19:39.757841+05:30	f	[]	[]
413	4	LDCO-M2-Q053	2	A full adder is implemented using a 3×8 decoder and two OR gates, as partly shown (S = Σ(1, 2, 4, 7)). The OR gate for the carry C must be connected to decoder outputs:	{"3, 5, 6, 7","1, 2, 4, 7","2, 3, 6, 7","0, 1, 2, 4"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.758206+05:30	f	[]	[]
414	4	LDCO-M2-Q054	2	In the circuit shown (two 3×8 decoders with enable inputs, w inverted for the top decoder), when w = 1 the outputs that generate minterms are:	{"all outputs are 1","D8 to D15 (bottom decoder enabled)","D0 to D7 (top decoder enabled)","all outputs are 0"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.758472+05:30	f	[]	[]
415	4	LDCO-M2-Q055	2	In an octal-to-binary encoder, the output bit x (most significant) is 1 for octal digits:	{"2, 3, 6 or 7","4, 5, 6 or 7 (x = D4 + D5 + D6 + D7)","1, 3, 5 or 7","0, 1, 2 or 3"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.758739+05:30	f	[]	[]
416	4	LDCO-M2-Q056	2	How many selection lines are needed for an 8-to-1 multiplexer?	{8,3,4,2}	2	Official answer key: B	1.00	2026-11-19 00:19:39.759015+05:30	f	[]	[]
417	4	LDCO-M2-Q057	2	The 4×1 multiplexer shown has inputs I0 = 0, I1 = 1, I2 = A, I3 = A' and select lines S1 = B, S0 = C. The function F(A, B, C) implemented is:	{"Σ(1, 3, 5, 6)","Σ(1, 3, 5, 7)","Σ(0, 2, 4, 7)","Σ(1, 2, 5, 6)"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.759328+05:30	f	[]	[]
418	4	LDCO-M2-Q058	2	A ROM that has 5 address input lines and 8 output lines is described as a:	{"5 × 8 ROM","32 × 8 ROM","8 × 32 ROM","16 × 8 ROM"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.759602+05:30	f	[]	[]
419	4	LDCO-M2-Q059	2	For the PLA program table shown (3 inputs, 3 product terms, 2 outputs), the number of programmed links 2n×k + k×m + m is:	{32,18,24,26}	4	Official answer key: D	1.00	2026-11-19 00:19:39.759862+05:30	f	[]	[]
420	4	LDCO-M2-Q060	2	Compared with a ROM, a PLA replaces the decoder with:	{"a bank of OR gates only","a set of flip-flops","a multiplexer","a programmable group of AND gates generating product terms"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.760215+05:30	f	[]	[]
421	5	OS-M1-Q001	1	According to the notes, a data structure can be expressed as:	{"Data Structure = Organized data + Allowed operations","Data Structure = Algorithm + Flowchart","Data Structure = Program + Compiler","Data Structure = Input + Output"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.771702+05:30	f	[]	[]
422	5	OS-M1-Q002	1	A field K whose values uniquely determine a record in a file is called a:	{"Primary key","Group item","Entity set","Variable-length record"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.772022+05:30	f	[]	[]
423	5	OS-M1-Q003	1	Which of the following is a primitive data structure?	{Array,Integer,Tree,Graph}	2	Official answer key: B	1.00	2026-11-19 00:19:39.7723+05:30	f	[]	[]
424	5	OS-M1-Q004	1	Which of the following is a non-linear data structure?	{Stack,Queue,"Linked list",Tree}	4	Official answer key: D	1.00	2026-11-19 00:19:39.772561+05:30	f	[]	[]
425	5	OS-M1-Q005	1	In data structure operations, merging means:	{"Arranging all data items in ascending or descending order","Combining the data items of two sorted lists into a single list","Finding whether a desired data item is present in a list","Reserving memory for the program elements"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.772845+05:30	f	[]	[]
426	5	OS-M1-Q006	1	A pointer is:	{"A variable that can store only integer constants","A special variable that contains the address of a memory location","A function that allocates memory at run time","A data type that stores a sequence of characters"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.773243+05:30	f	[]	[]
427	5	OS-M1-Q007	1	A pointer that has not been initialized with a valid address is known as a:	{"NULL pointer","Void pointer","Dangling (wild) pointer","Pointer to pointer"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.773513+05:30	f	[]	[]
428	5	OS-M1-Q008	1	Memory requested at run time using malloc() and calloc() is allocated from the:	{Stack,"Static (compile-time) data area","CPU registers",Heap}	4	Official answer key: D	1.00	2026-11-19 00:19:39.773789+05:30	f	[]	[]
429	5	OS-M1-Q009	1	Which dynamic memory allocation function initializes every allocated block to zero?	{malloc(),realloc(),calloc(),free()}	3	Official answer key: C	1.00	2026-11-19 00:19:39.77405+05:30	f	[]	[]
430	5	OS-M1-Q010	1	Which statement correctly distinguishes calloc() from malloc()?	{"calloc() takes one argument and leaves the allocated memory uninitialized","calloc() takes two arguments (number of elements, element size) and initializes the memory to zero","calloc() releases previously allocated memory, while malloc() allocates it","calloc() allocates memory at compile time, while malloc() does it at run time"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.774324+05:30	f	[]	[]
431	5	OS-M1-Q011	1	If realloc() cannot extend an existing memory block in place, it:	{"Leaves the old block unchanged and returns a pointer to its first byte","Frees the old block and returns an uninitialized block without copying any data","Allocates a new block, copies the old contents into it and frees the old block","Always terminates the program with a run-time error"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.775134+05:30	f	[]	[]
432	5	OS-M1-Q012	1	What is the output of the following code? int a[5] = {10, 20, 30, 40, 50}; int *p = a; printf("%d %d", *(p + 2), 3[a]);	{"20 40","30 30","Compilation error","30 40"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.77541+05:30	f	[]	[]
433	5	OS-M1-Q013	1	Which declaration creates an array of 5 pointers to integers?	{"int *a;","int a[5];","int *a[5];","int **a;"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.77569+05:30	f	[]	[]
434	5	OS-M1-Q014	1	Binary search is applied on the sorted array {2, 5, 8, 12, 16, 23, 38, 56, 72, 91} with low = 0, high = 9 and mid = (low + high)/2 to find the key 23. How many times is mid computed before the key is found?	{3,2,4,5}	1	Official answer key: A	1.00	2026-11-19 00:19:39.775967+05:30	f	[]	[]
435	5	OS-M1-Q015	1	What is the output of the following code that inserts an item into an array? int a[10] = {5, 10, 15, 20}, n = 4, pos = 2, item = 12, i; for (i = n - 1; i >= pos; i--) a[i + 1] = a[i]; a[pos] = item; n = n + 1; for (i = 0; i < n; i++) printf("%d ", a[i]);	{"5 10 15 12 20","5 10 12 15 20","12 5 10 15 20","5 10 12 20 20"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.776252+05:30	f	[]	[]
436	5	OS-M1-Q016	1	What is the output of the following code? int m[2][3] = { {1, 4, 2}, {3, 6, 8} }; int i, j, s = 0; for (i = 0; i < 2; i++) for (j = 0; j < 3; j++) if (i != j) s += m[i][j]; printf("%d", s);	{24,7,21,17}	4	Official answer key: D	1.00	2026-11-19 00:19:39.776654+05:30	f	[]	[]
437	5	OS-M1-Q017	1	To create a 2-D integer array of rows x cols dynamically using the pointer-to-pointer method of the notes, how many MALLOC (malloc) calls are needed in total?	{1,"rows x cols","rows + 1","cols + 1"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.776918+05:30	f	[]	[]
438	5	OS-M1-Q018	1	What is the output of the following code? int a = 10; int *p1 = &a; int **p2 = &p1; **p2 = **p2 + 5; printf("%d %d", a, *p1);	{"10 15","15 10","10 10","15 15"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.77718+05:30	f	[]	[]
439	5	OS-M1-Q019	1	Which of the following structure definitions results in a syntax error?	{"struct str1 { int i; char c; } var1 = {10, 'A'};","struct str1 { int i = 10; char c = 'A'; };","struct str1 { int i; char c; }; struct str1 var1 = {10, 'A'};","struct str1 { int i; char c; float f; } s1, s2;"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.777452+05:30	f	[]	[]
440	5	OS-M1-Q020	1	Which of the following is a self-referential structure?	{"struct node { int data; struct node next; };","struct node { int data; int *next; };","struct node { int data; };","struct node { int data; struct node *next; };"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.777721+05:30	f	[]	[]
441	5	OS-M1-Q021	1	The size of a union is equal to the size of its:	{"Largest member","Smallest member","Sum of all members","First member"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.777985+05:30	f	[]	[]
442	5	OS-M1-Q022	1	Which statement about structures and unions is correct?	{"Altering one member of a structure alters the other members, but not in a union","In a structure each member has its own storage, whereas all members of a union share the same memory","A union allocates memory equal to the sum of the sizes of its members","All members of a union can be initialized at once, but only the first member of a structure can be"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.778346+05:30	f	[]	[]
443	5	OS-M1-Q023	1	Using the addpolynomial() logic of the notes (terms are stored in decreasing order of exponent and a term is attached only when its coefficient is non-zero), the sum of A(x) = 5x^3 + 4x^2 + 2 and B(x) = 3x^3 - 4x^2 + 7x is:	{"8x^3 + 0x^2 + 7x + 2","8x^3 + 8x^2 + 7x + 2","2x^3 + 8x^2 + 7x + 2","8x^3 + 7x + 2"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.778618+05:30	f	[]	[]
444	5	OS-M1-Q024	1	A sparse matrix is a matrix that has:	{"A greater number of zero elements than non-zero elements","Only non-zero elements","More rows than columns","Non-zero elements only on its diagonal"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.778901+05:30	f	[]	[]
445	5	OS-M1-Q025	1	In the (row, column, value) triple representation of a sparse matrix, the first entry A[0] stores:	{"The first non-zero element of the matrix","The number of zero elements, rows and columns","The number of rows, the number of columns and the number of non-zero terms","The largest element and its row and column"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.779187+05:30	f	[]	[]
446	5	OS-M1-Q026	1	The 4 x 4 sparse matrix A shown below is stored as triples with B[0] = (4, 4, 5) for its transpose. Using the column-by-column transpose algorithm of the notes, what is B[4]? | 0  0  3  0 | A = | 0  0  0  8 | | 1  0  3  0 | | 0  0  7  0 |	{"(3, 1, 8)","(2, 3, 7)","(2, 2, 3)","(0, 2, 1)"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.779549+05:30	f	[]	[]
447	5	OS-M1-Q027	1	For a sparse matrix with c columns and t non-zero terms, the transpose function of the notes (which scans all t terms once for every column) runs in time:	{"O(c x t)","O(c + t)",O(t),O(c)}	1	Official answer key: A	1.00	2026-11-19 00:19:39.7813+05:30	f	[]	[]
448	5	OS-M1-Q028	1	A string in C is a sequence of characters terminated by the:	{"Null character '\\\\0'","Newline character '\\\\n'","Space character","Tab character '\\\\t'"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.781833+05:30	f	[]	[]
449	5	OS-M1-Q029	1	What is the output of the following code? #include <string.h> char s[] = "Hello"; printf("%d", (int)(sizeof(s) + strlen(s)));	{10,12,11,5}	3	Official answer key: C	1.00	2026-11-19 00:19:39.782129+05:30	f	[]	[]
450	5	OS-M1-Q030	1	What is the output of the following code? char a[20] = "Data"; char b[] = "Struct"; strcat(a, b); printf("%s %d", a, (int)strlen(a));	{"DataStruct 10","DataStruct 11","StructData 10","Data 4"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.782417+05:30	f	[]	[]
451	5	OS-M2-Q031	2	In a stack, insertions (push) and deletions (pop) are made at one end called the:	{Top,Front,Rear,Base}	1	Official answer key: A	1.00	2026-11-19 00:19:39.782719+05:30	f	[]	[]
452	5	OS-M2-Q032	2	Trying to push an element onto a stack that is already full is called:	{Overflow,Underflow,Deadlock,Wrap-around}	1	Official answer key: A	1.00	2026-11-19 00:19:39.783206+05:30	f	[]	[]
453	5	OS-M2-Q033	2	Which auxiliary stack operation returns the last inserted element without removing it?	{Pop(),Push(),Top(),Size()}	3	Official answer key: C	1.00	2026-11-19 00:19:39.783548+05:30	f	[]	[]
454	5	OS-M2-Q034	2	When a stack is implemented using an array, the value of top for an empty stack is initialized to:	{-1,0,1,MAX_STACK_SIZE}	1	Official answer key: A	1.00	2026-11-19 00:19:39.783816+05:30	f	[]	[]
455	5	OS-M2-Q035	2	When a function is invoked, its stack frame placed on the system stack initially contains:	{"Only the local variables of the invoking function","The source code of the invoked function","A pointer to the previous stack frame and the return address","The final return value and an overflow flag"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.784101+05:30	f	[]	[]
456	5	OS-M2-Q036	2	For an array-based stack of size MAX_STACK_SIZE, the stack is full when:	{"top < 0","top >= MAX_STACK_SIZE - 1","top == MAX_STACK_SIZE","top == 0"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.784476+05:30	f	[]	[]
458	5	OS-M2-Q038	2	In the infix-to-postfix algorithm using in-stack precedence (isp) and incoming precedence (icp), the left parenthesis has:	{"High in-stack precedence and low incoming precedence","Low in-stack precedence (isp = 0) but high incoming precedence (icp = 20)","Equal in-stack and incoming precedence of 0","Equal in-stack and incoming precedence of 20"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.785117+05:30	f	[]	[]
459	5	OS-M2-Q039	2	In which notation does the operator appear after its operands, as in A B +?	{"Postfix (reverse Polish) notation","Prefix (Polish) notation","Infix notation","Parenthesized infix notation"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.785494+05:30	f	[]	[]
460	5	OS-M2-Q040	2	The postfix form of the infix expression a*(b+c)*d is:	{ab*c+d*,abcd+**,abc+*d*,abc*+d*}	3	Official answer key: C	1.00	2026-11-19 00:19:39.785754+05:30	f	[]	[]
461	5	OS-M2-Q041	2	The postfix form of the infix expression a+b*c-d/e is:	{ab+c*de/-,abc*de/+-,abcde*/+-,abc*+de/-}	4	Official answer key: D	1.00	2026-11-19 00:19:39.786015+05:30	f	[]	[]
462	5	OS-M2-Q042	2	What is the value of the postfix expression 5 6 2 + * 12 4 / -?	{37,-37,43,3}	1	Official answer key: A	1.00	2026-11-19 00:19:39.786342+05:30	f	[]	[]
463	5	OS-M2-Q043	2	The prefix form of the infix expression (A + B) * C is:	{"+ A * B C","A B + C *","* A + B C","* + A B C"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.786619+05:30	f	[]	[]
464	5	OS-M2-Q044	2	Starting with an empty stack, the operations push(3), push(6), push(9), pop(), push(12), pop(), pop() are performed. What are the values returned by Top() and Size() now?	{"Top = 6, Size = 2","Top = 3, Size = 1","Top = 12, Size = 2","Top = 9, Size = 1"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.786894+05:30	f	[]	[]
465	5	OS-M2-Q045	2	What is the output of the following code? int stack[10], top = -1, x, y; stack[++top] = 4; stack[++top] = 7; stack[++top] = 2; x = stack[top--]; y = stack[top--]; stack[++top] = x * y; printf("%d %d", stack[top], top);	{"28 1","14 1","14 2","14 0"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.78716+05:30	f	[]	[]
466	5	OS-M2-Q046	2	A stack uses a dynamically allocated array with an initial capacity of 1 and doubles the capacity (using realloc) whenever a push arrives while the array is full. What is the capacity after 9 pushes?	{16,9,8,18}	1	Official answer key: A	1.00	2026-11-19 00:19:39.78743+05:30	f	[]	[]
467	5	OS-M2-Q047	2	A queue works on which of the following principles?	{"Last-In-First-Out (LIFO)",Highest-priority-last,"Random access","First-In-First-Out (FIFO)"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.7877+05:30	f	[]	[]
468	5	OS-M2-Q048	2	In the array implementation of a linear queue (with f initialized to 0 and r to -1), the queue is empty when:	{"f < r","f > r","r == QUEUESIZE - 1","f == QUEUESIZE - 1"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.787985+05:30	f	[]	[]
469	5	OS-M2-Q049	2	The figure shows a linear queue stored in an array with QUEUESIZE = 5, f = 2 and r = 4. What happens when insertQ(60, &r, q) is executed? q[ ] 0 1 30 2 40 3 50 4 f r	{"60 is stored at index 0","60 is stored at index 5","It prints \\"Queue Empty\\"","It prints \\"queue overflow\\" even though locations 0 and 1 are empty"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.788261+05:30	f	[]	[]
470	5	OS-M2-Q050	2	In a circular queue implemented with an array of size QUEUESIZE, the rear is advanced during insertion using:	{"rear = rear + 1","rear = (rear - 1) % QUEUESIZE","rear = rear % QUEUESIZE + 1","rear = (rear + 1) % QUEUESIZE"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.788542+05:30	f	[]	[]
471	5	OS-M2-Q051	2	A circular queue (QUEUESIZE = 5) uses the variables f, r and count, initially f = 0, r = -1, count = 0. The operations performed are: insert 10, 20, 30, 40; delete twice; insert 50, 60, 70. The final values of f, r and count are:	{"f = 2, r = 1, count = 5","f = 2, r = 2, count = 5","f = 0, r = 1, count = 5","f = 2, r = 1, count = 3"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.788809+05:30	f	[]	[]
472	5	OS-M2-Q052	2	Elements 9, 4 and 6 are inserted, in this order, into an ascending priority queue. The order in which they are deleted is:	{"4, 6, 9","9, 4, 6","6, 4, 9","9, 6, 4"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.789087+05:30	f	[]	[]
473	5	OS-M2-Q053	2	A priority queue is mainly used to implement:	{Recursion,"CPU scheduling algorithms","Binary search","Matrix multiplication"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.789459+05:30	f	[]	[]
474	5	OS-M2-Q054	2	In a deque (double-ended queue), insertion and deletion can be performed:	{"Only at the front end","At both the front and the rear ends","Only at the rear end","Only in the middle of the queue"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.789726+05:30	f	[]	[]
475	5	OS-M2-Q055	2	In an input-restricted deque:	{"Deletion is allowed at only one end, while insertion is allowed at both ends","Both insertion and deletion are allowed at only one end","Insertion is allowed at only one end, while deletion is allowed at both ends","Insertion is not allowed at any end"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.789998+05:30	f	[]	[]
476	5	OS-M2-Q056	2	A deque is initially empty. The operations insertFront(1), insertRear(2), insertFront(3), insertRear(4), deleteFront(), deleteRear() are performed in order. The contents of the deque from front to rear are:	{"3, 1","2, 4","1, 2, 4","1, 2"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.790265+05:30	f	[]	[]
477	5	OS-M2-Q057	2	In the maze problem of the notes, the maze is represented by a two-dimensional array in which:	{"Ones represent open paths and zeros represent barriers","Zeros represent open paths and ones represent barriers","Zeros represent the exit and ones the entrance","Every position stores the number of its neighbours"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.790608+05:30	f	[]	[]
478	5	OS-M2-Q058	2	To avoid checking border conditions in the maze program, the maze is surrounded by a border of ones. An m x p maze therefore requires an array of size:	{"m x p","(m + 1) x (p + 1)","(m + 2) x (p + 2)","(m + 2) x p"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.790883+05:30	f	[]	[]
479	5	OS-M2-Q059	2	A 6 x 8 maze is stored in an array with a border of ones. If the entrance is at maze[1][1], the exit is at:	{maze[7][9],maze[5][7],maze[8][10],maze[6][8]}	4	Official answer key: D	1.00	2026-11-19 00:19:39.791153+05:30	f	[]	[]
975	1	Q-M4-7E09BB1D45	4	Which option correctly answers this question: Which port is the default for HTTP?	{110,80,25,21}	2	\N	1.00	2026-11-19 02:38:43.506643+05:30	f	[]	[]
480	5	OS-M2-Q060	2	Since each position of an m x p maze is visited no more than once, the worst-case computing time of the maze-path algorithm is:	{"O(m + p)",O((mp)^2),O(mp),"O(log mp)"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.79153+05:30	f	[]	[]
481	5	OS-M3-Q061	3	Each node of a singly linked list consists of:	{"A data field, a prev field and a next field","Only a data field","Two data fields and a counter","A data field and a next (link) field"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.79191+05:30	f	[]	[]
482	5	OS-M3-Q062	3	In a singly linked list, the next field of the last node contains:	{"The address of the first node","The address of the previous node","NULL","The value zero as data"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.792181+05:30	f	[]	[]
483	5	OS-M3-Q063	3	Which disadvantage of arrays is overcome by using linked lists?	{"Slow random access to the i-th element","Use of a common name for all the elements","Inability to store more than one data type","Fixed size, and costly insertion and deletion at a given position"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.792452+05:30	f	[]	[]
484	5	OS-M3-Q064	3	While traversing a singly linked list with a pointer current that starts at head, the traversal loop stops when:	{"current becomes NULL","current becomes equal to head again","current->data becomes zero","current->next points to head"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.792733+05:30	f	[]	[]
485	5	OS-M3-Q065	3	How many types of linked lists are listed in the notes?	{"2 (singly and doubly)","4 (singly, doubly, circular singly and circular doubly)","3 (singly, doubly and circular)",5}	2	Official answer key: B	1.00	2026-11-19 00:19:39.793002+05:30	f	[]	[]
486	5	OS-M3-Q066	3	Each node of a doubly linked list consists of:	{"Data and a pointer to the next node","Data and a pointer to the previous node","Data, a pointer to the head and a pointer to the tail","Data, a pointer to the previous node and a pointer to the next node"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.793277+05:30	f	[]	[]
487	5	OS-M3-Q067	3	Which linked list supports traversal in both the forward and backward directions?	{"Singly linked list","Doubly linked list","Circular singly linked list","Singly linked list with a tail pointer"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.79355+05:30	f	[]	[]
488	5	OS-M3-Q068	3	In a circular linked list, the last node points to:	{"NULL","The previous node","The first node","Itself, in every list"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.79404+05:30	f	[]	[]
489	5	OS-M3-Q069	3	In a stack implemented using a singly linked list, push() inserts the new node at the:	{"End of the list","Beginning of the list (top)","Middle of the list","Position given by the data value"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.794333+05:30	f	[]	[]
490	5	OS-M3-Q070	3	Elements of a linked list are accessed:	{"Randomly using an index","Sequentially, starting from the head","Only from the tail","Using the memory address of the array base"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.79461+05:30	f	[]	[]
491	5	OS-M3-Q071	3	Which of the following correctly compares arrays and linked lists?	{"Array: non-contiguous memory and sequential access; Linked list: contiguous memory and random access","Both arrays and linked lists use contiguous memory and random access","Array: contiguous memory and random access; Linked list: non-contiguous memory and sequential access","Both arrays and linked lists use non-contiguous memory and sequential access"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.794883+05:30	f	[]	[]
492	5	OS-M3-Q072	3	In the memory representation of a linked list, the nodes and the pointer variable head declared inside main() are stored, respectively, in the:	{"Heap and stack","Stack and heap","Heap and heap","Stack and stack"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.795422+05:30	f	[]	[]
493	5	OS-M3-Q073	3	The time required to insert a new node at the end of a singly linked list when only the head pointer is available is:	{O(1),"O(log n)",O(n^2),O(n)}	4	Official answer key: D	1.00	2026-11-19 00:19:39.79572+05:30	f	[]	[]
494	5	OS-M3-Q074	3	The main advantage of implementing a stack with a linked list instead of an array is that:	{"Elements can be accessed randomly using an index","Memory is allocated contiguously","No pointer is needed for the top","The stack can grow and shrink dynamically without a fixed maximum capacity"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.795995+05:30	f	[]	[]
495	5	OS-M3-Q075	3	While inserting a new node at the beginning of a non-empty doubly linked list, which statement is required in addition to new_node->next = head?	{"head->next = new_node","new_node->prev = head","head->prev = new_node","head->prev = NULL"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.796393+05:30	f	[]	[]
496	5	OS-M3-Q076	3	When only a pointer to the node to be deleted is given, the time for deletion in a singly linked list and in a doubly linked list is, respectively:	{"O(n) and O(1)","O(1) and O(n)","O(1) and O(1)","O(n) and O(n)"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.796763+05:30	f	[]	[]
497	5	OS-M3-Q077	3	Which of the following is a disadvantage of a doubly linked list compared with a singly linked list?	{"It cannot be traversed in the backward direction","Insertion at the beginning requires traversing the whole list","Every node needs extra memory for the additional prev pointer","It cannot be used to implement a stack or a queue"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.797123+05:30	f	[]	[]
498	5	OS-M3-Q078	3	In a circular singly linked list represented by a pointer last to its last node, the first node is accessed as:	{last->prev,last->next->next,last,last->next}	4	Official answer key: D	1.00	2026-11-19 00:19:39.797511+05:30	f	[]	[]
499	5	OS-M3-Q079	3	In a circular doubly linked list, the prev pointer of the first node stores the address of:	{"The last node","NULL","The second node","The first node itself"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.797888+05:30	f	[]	[]
500	5	OS-M3-Q080	3	Which of the following is a disadvantage of circular linked lists?	{"Traversal may enter an infinite loop unless a proper stopping condition is used","Insertion at the beginning is impossible","They cannot be used to implement a circular queue","The last node always contains NULL"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.798266+05:30	f	[]	[]
545	5	OS-M5-Q125	5	An edge of the form (v, v), which starts and ends at the same vertex, is called a:	{Multi-edge,"Cycle of length two","Weighted edge","Self loop (self edge)"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.812473+05:30	f	[]	[]
501	5	OS-M3-Q081	3	Assume the functions of the notes are available. What is the output of the following code? struct Node* head = NULL; head = insertAtBeginning(head, 10); head = insertAtBeginning(head, 20); head = insertAtBeginning(head, 30); head = insertAtEnd(head, 40); traverseLinkedList(head);	{"10 20 30 40","40 30 20 10","30 20 10 40","30 20 40 10"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.798746+05:30	f	[]	[]
502	5	OS-M3-Q082	3	The singly linked list in the figure is modified by the code below. What does traverseLinkedList(head) print? head = removeLastNode(head); head = removeFirstNode(head); head = deleteAtPosition(head, 2); traverseLinkedList(head); head 12 25 7 40 NULL	{"25 7",25,7,12}	2	Official answer key: B	1.00	2026-11-19 00:19:39.799476+05:30	f	[]	[]
503	5	OS-M3-Q083	3	A stack is implemented using a singly linked list as in the notes. Starting from an empty stack, the operations push(11), push(22), push(33), pop(), push(44), push(55), pop(), pop() are performed. What does peek() return?	{11,22,33,44}	2	Official answer key: B	1.00	2026-11-19 00:19:39.799752+05:30	f	[]	[]
504	5	OS-M3-Q084	3	Let tail point to the last node of the final list. What does backwardTraversal(tail) print after the following operations on a doubly linked list? struct Node* head = createNode(10); head = insertEnd(head, 20); head = insertEnd(head, 30); head = insertAtPosition(head, 3, 25);	{"10 20 25 30","30 20 25 10","30 25 10 20","30 25 20 10"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.800127+05:30	f	[]	[]
505	5	OS-M3-Q085	3	A doubly linked list contains 1, 2, 3, 4, 5. The following statements are executed. If tail points to the last node of the resulting list, what does backwardTraversal(tail) print? head = delPos(head, 3); head = delLast(head); head = delHead(head);	{"4 2","2 4","5 4 2","4 2 1"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.8005+05:30	f	[]	[]
506	5	OS-M3-Q086	3	What is the output of the following code on a circular singly linked list (insertion functions of the notes)? struct Node *last = NULL; last = insertAtBeginning(last, 10); last = insertEnd(last, 20); last = insertAtBeginning(last, 5); last = insertEnd(last, 30); printf("%d %d", last->data, last->next->data);	{"30 5","30 10","5 30","20 5"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.800768+05:30	f	[]	[]
507	5	OS-M3-Q087	3	A circular singly linked list contains 5, 10, 20, 30 with last pointing to the node 30. After last = deleteFirstNode(last); last = deleteLastNode(last); what does printf("%d %d", last->data, last->next->data) print?	{"20 5","30 10","20 10","10 20"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.801057+05:30	f	[]	[]
508	5	OS-M3-Q088	3	Inserting a new node between two existing nodes in the middle of a doubly linked list requires updating how many pointer fields in total?	{2,4,3,1}	2	Official answer key: B	1.00	2026-11-19 00:19:39.801387+05:30	f	[]	[]
509	5	OS-M3-Q089	3	A singly linked list contains the two nodes 7 -> 9 -> NULL. What is the state of the list after head = removeLastNode(head); (the function of the notes)?	{"An empty list","A single node 7 whose next is NULL","A single node 9 whose next is NULL","The list is unchanged because the loop never executes"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.801663+05:30	f	[]	[]
510	5	OS-M3-Q090	3	A singly linked list has 4 nodes. For which value of pos does insertPos(head, pos, data) of the notes print "Invalid position!"?	{6,5,3,1}	1	Official answer key: A	1.00	2026-11-19 00:19:39.801965+05:30	f	[]	[]
511	5	OS-M4-Q091	4	Which node of a tree has no parent?	{"Root node","Leaf node","Sibling node","Internal node"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.802236+05:30	f	[]	[]
512	5	OS-M4-Q092	4	A node with no children (a node of degree zero) is called a:	{"Root node","Internal node","Sibling node","Leaf (external or terminal) node"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.802508+05:30	f	[]	[]
513	5	OS-M4-Q093	4	A tree with N nodes has how many edges?	{"N - 1",N,"N + 1","2N - 1"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.802789+05:30	f	[]	[]
514	5	OS-M4-Q094	4	In the tree shown in the figure, what is the degree of node D? A B C D E F G H I J K L M	{2,4,3,1}	3	Official answer key: C	1.00	2026-11-19 00:19:39.803063+05:30	f	[]	[]
515	5	OS-M4-Q095	4	For the tree shown in the figure, using the convention of the notes (levels, heights and depths counted in edges, with the root at level 0), the depth of node M and the height of node B are, respectively: A B C D E F G H I J K L M	{"2 and 3","4 and 2","3 and 3","3 and 2"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.803335+05:30	f	[]	[]
516	5	OS-M4-Q096	4	In the left child - right sibling representation of a tree, each node contains:	{"A data field, a reference to its left (first) child and a reference to its right sibling","A data field and references to all of its children","A data field, a parent reference and a degree field","A data field and a reference to the root"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.803606+05:30	f	[]	[]
517	5	OS-M4-Q097	4	A tree in which every node can have at most two children (a left child and a right child) is called a:	{"Threaded tree","General tree","Binary tree",Forest}	3	Official answer key: C	1.00	2026-11-19 00:19:39.803869+05:30	f	[]	[]
518	5	OS-M4-Q098	4	In a strictly binary tree (full binary tree), every node has:	{"Exactly one child","Either zero or two children","At most one child","Exactly two children, with all leaves at the same level"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.804132+05:30	f	[]	[]
519	5	OS-M4-Q099	4	In a binary tree whose root is on level 1, the maximum number of nodes on level i is:	{2^i,2^(i-1),"2i - 1",i^2}	2	Official answer key: B	1.00	2026-11-19 00:19:39.804524+05:30	f	[]	[]
520	5	OS-M4-Q100	4	A non-empty binary tree has 7 leaf nodes. The number of nodes having two children is:	{6,7,8,3}	1	Official answer key: A	1.00	2026-11-19 00:19:39.804946+05:30	f	[]	[]
521	5	OS-M4-Q101	4	A strictly binary tree has 15 internal nodes (all of degree 2). The total number of nodes in the tree is:	{31,30,32,16}	1	Official answer key: A	1.00	2026-11-19 00:19:39.805219+05:30	f	[]	[]
522	5	OS-M4-Q102	4	A complete binary tree is stored in a one-dimensional array with the root at index 1. For the node at index 6, which statement is correct?	{"Parent at index 2, left child at index 12 and right child at index 13","Parent at index 3, left child at index 11 and right child at index 12","Parent at index 5, left child at index 7 and right child at index 8","Parent at index 3, left child at index 12 and right child at index 13"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.805497+05:30	f	[]	[]
523	5	OS-M4-Q103	4	A complete binary tree with 12 nodes is stored in an array with the root at index 1. Which statement is true?	{"Node 6 has no children","Node 6 has a left child (index 12) but no right child","Node 5 has no right child","The parent of node 12 is node 5"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.805833+05:30	f	[]	[]
524	5	OS-M4-Q104	4	The inorder traversal of a binary tree visits the nodes in the order:	{"Root, left subtree, right subtree","Left subtree, root, right subtree","Left subtree, right subtree, root","Right subtree, root, left subtree"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.806229+05:30	f	[]	[]
525	5	OS-M4-Q105	4	Which traversal visits the root node after both of its subtrees have been visited?	{Preorder,Inorder,Postorder,Level-order}	3	Official answer key: C	1.00	2026-11-19 00:19:39.8065+05:30	f	[]	[]
526	5	OS-M4-Q106	4	What is the postorder traversal of the binary tree shown in the figure? A B C D F G H I J K	{"I J D F B K G H C A","A B D I J F C G K H","I D J B F A G K C H","I J D F B G K H C A"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.806761+05:30	f	[]	[]
527	5	OS-M4-Q107	4	The preorder traversal of a binary tree is A B D E C F and its inorder traversal is D B E A F C. Its postorder traversal is:	{"D B E F C A","D E B F C A","E D B F C A","D E B C F A"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.807022+05:30	f	[]	[]
528	5	OS-M4-Q108	4	An expression tree is built from the postfix expression A B / C * D * E +. Its level-order traversal is:	{"+ * * / A B C D E","+ * E * D / C A B","A B / C * D * E +","+ * E * D C / A B"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.807293+05:30	f	[]	[]
529	5	OS-M4-Q109	4	A binary tree has root 4 with a left child 2 and a right child 6 (both leaves). What is the output of the following function when called as trav(root)? void trav(tree_pointer p) { if (p) { printf("%d ", p->data); trav(p->left_child); trav(p->right_child); printf("%d ", p->data); } }	{"4 2 6 6 2 4","4 2 6 4","2 6 4 4 2 6","4 2 2 6 6 4"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.807571+05:30	f	[]	[]
530	5	OS-M4-Q110	4	Level-order traversal of a binary tree is implemented using a:	{Stack,Queue,"Linked list sorted by key","Hash table"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.80795+05:30	f	[]	[]
531	5	OS-M4-Q111	4	In the iterative inorder traversal (iter_inorder) of an n-node binary tree, each node is placed on and removed from the stack:	{"Exactly once, giving O(n) time","Exactly twice, giving O(n^2) time","log n times, giving O(n log n) time","Only if it is a leaf, giving O(log n) time"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.808223+05:30	f	[]	[]
532	5	OS-M4-Q112	4	In a threaded binary tree node, if ptr->leftThread = TRUE, then ptr->leftChild contains:	{"A pointer to the left child","The address of the right sibling","A thread, not a pointer to the left child","Always NULL"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.808507+05:30	f	[]	[]
533	5	OS-M4-Q113	4	A header node is assumed for all threaded binary trees in order to:	{"Store the total number of nodes of the tree","Convert the tree into a complete binary tree","Make the tree a binary search tree","Avoid loose (dangling) threads; the original tree becomes the left subtree of the header node"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.808785+05:30	f	[]	[]
534	5	OS-M4-Q114	4	In a binary search tree, for every node:	{"Keys in its left subtree are larger and keys in its right subtree are smaller than its key","All keys in the tree are equal","Keys in its left subtree are smaller and keys in its right subtree are larger than its key","The left child is always a leaf"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.809064+05:30	f	[]	[]
535	5	OS-M4-Q115	4	If h is the height of a binary search tree, searching for a key (recursively or iteratively) takes:	{"O(1) time","O(h) time","O(h^2) time","O(n^2) time"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.809438+05:30	f	[]	[]
536	5	OS-M4-Q116	4	In a binary search tree, a new node is always inserted as a:	{"Root node","Internal node","Left child of the root","Leaf node"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.809703+05:30	f	[]	[]
537	5	OS-M4-Q117	4	The keys 10, 12, 5, 4, 20, 8, 7, 15, 13 are inserted, in this order, into an initially empty binary search tree. Taking the height of a tree with a single node as 0, the height of the resulting tree is:	{3,5,4,6}	3	Official answer key: C	1.00	2026-11-19 00:19:39.809967+05:30	f	[]	[]
538	5	OS-M4-Q118	4	The keys 10, 12, 5, 4, 20, 8, 7, 15, 13 are inserted, in this order, into an initially empty binary search tree. Its preorder traversal is:	{"10 5 4 8 7 12 20 15 13","4 5 7 8 10 12 13 15 20","10 5 12 4 8 20 7 15 13","10 12 5 4 20 8 7 15 13"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.810242+05:30	f	[]	[]
539	5	OS-M4-Q119	4	To delete a node having two children from a binary search tree, the node is replaced by:	{"Its parent node","The smallest key in its left subtree or the largest key in its right subtree","Either the largest key in its left subtree or the smallest key in its right subtree","The root of the tree"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.810639+05:30	f	[]	[]
540	5	OS-M4-Q120	4	In the binary search tree built from the keys 10, 12, 5, 4, 20, 8, 7, 15, 13, the root 10 is deleted by replacing it with the largest key of its left subtree. Which key becomes the replacement?	{7,12,5,8}	4	Official answer key: D	1.00	2026-11-19 00:19:39.811006+05:30	f	[]	[]
541	5	OS-M5-Q121	5	The length of a path in a graph is:	{"The number of vertices in the path","The number of edges in the path","The sum of the degrees of its vertices","The number of cycles in the path"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.811273+05:30	f	[]	[]
542	5	OS-M5-Q122	5	A graph G = (V, E) consists of:	{"A set of edges only","A set of vertices only, with no relation between them","A finite non-empty set of vertices V and a set E of pairs of vertices called edges","A set of nodes arranged in levels"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.811537+05:30	f	[]	[]
543	5	OS-M5-Q123	5	In an undirected graph, the pairs (u, v) and (v, u):	{"Represent two different edges","Represent the same edge","Represent a self loop","Cannot both be present in the graph"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.811819+05:30	f	[]	[]
544	5	OS-M5-Q124	5	How many edges does a complete undirected graph with 6 vertices have?	{30,12,21,15}	4	Official answer key: D	1.00	2026-11-19 00:19:39.812211+05:30	f	[]	[]
546	5	OS-M5-Q126	5	For the directed graph shown in the figure, the in-degree and the out-degree of vertex c are, respectively: a b d c	{"1 and 2","2 and 1","2 and 2","3 and 1"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.812749+05:30	f	[]	[]
547	5	OS-M5-Q127	5	A directed graph G is said to be strongly connected if:	{"For every pair of distinct vertices u and v there is a directed path from u to v and from v to u","It contains no cycles","Every vertex has at least one outgoing edge","Every vertex has in-degree equal to its out-degree"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.813474+05:30	f	[]	[]
548	5	OS-M5-Q128	5	The adjacency matrix of an undirected graph is always:	{Symmetric,"Upper triangular","A diagonal matrix","An identity matrix"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.813926+05:30	f	[]	[]
549	5	OS-M5-Q129	5	For an undirected graph with n vertices and e edges, the adjacency list representation requires an array of size n and how many chain nodes?	{e,"n + e",n^2,2e}	4	Official answer key: D	1.00	2026-11-19 00:19:39.814294+05:30	f	[]	[]
550	5	OS-M5-Q130	5	In the adjacency multilist representation of a graph:	{"Each edge is represented by two nodes, one in each end vertex's list","Each vertex is represented by n nodes","Only the edge weights are stored, not the vertices","Each edge is represented by exactly one node, which appears in the lists of both of its end vertices"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.814774+05:30	f	[]	[]
551	5	OS-M5-Q131	5	Which data structure is used to maintain the current position in the adjacency lists during depth first search?	{Queue,"Priority queue",Stack,"Hash table"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.815062+05:30	f	[]	[]
552	5	OS-M5-Q132	5	Breadth first search of a graph uses which data structure to hold the visited vertices whose adjacency lists are yet to be examined?	{Stack,Queue,"Binary tree","Array of weights"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.81543+05:30	f	[]	[]
553	5	OS-M5-Q133	5	For a graph with n vertices and e edges, the time taken by depth first search when the graph is represented by an adjacency list and by an adjacency matrix is, respectively:	{"O(e) and O(n^2)","O(n^2) and O(e)","O(n) and O(n)","O(e) and O(e)"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.815705+05:30	f	[]	[]
554	5	OS-M5-Q134	5	A depth first search is started from vertex 0 of the undirected graph in the figure. The adjacency lists are 0: 1, 2; 1: 0, 3, 4; 2: 0, 4; 3: 1; 4: 1, 2, and the vertices of each list are examined in the given order. The vertices are visited in the order: 0 1 2 3 4	{"0 1 3 4 2","0 1 2 3 4","0 2 4 1 3","0 1 4 2 3"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.815984+05:30	f	[]	[]
555	5	OS-M5-Q135	5	A directed graph has the adjacency lists 0: 2, 1, 3; 1: 4; 2: 5, 4; 3: 5; 4: 6; 5: 6; 6: (none). A breadth first search is started from vertex 0 and the adjacency lists are scanned in the given order. The vertices are visited in the order:	{"0 1 2 3 4 5 6","0 2 1 3 5 4 6","0 2 5 6 4 1 3","0 2 1 3 4 5 6"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.816344+05:30	f	[]	[]
556	5	OS-M5-Q136	5	Insertion sort (as given in the notes) is applied to the list 5, 2, 4, 6, 1, 3. The total number of times an element is shifted one position to the right (a[i+1] = a[i]) during the sort is:	{9,10,8,15}	1	Official answer key: A	1.00	2026-11-19 00:19:39.816634+05:30	f	[]	[]
557	5	OS-M5-Q137	5	Radix sort (least significant digit first, with each bucket preserving the input order) is applied to 348, 143, 361, 423, 538, 128, 321, 543, 366. The list after the first pass (units digit) is:	{"321 361 143 423 543 366 538 348 128","128 143 321 348 361 366 423 538 543","361 321 143 423 543 366 348 538 128","348 143 361 423 538 128 321 543 366"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.816904+05:30	f	[]	[]
558	5	OS-M5-Q138	5	If each number in a list has s digits (radix d), the radix sort algorithm requires:	{"d passes","s passes","n passes","log n passes"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.817169+05:30	f	[]	[]
559	5	OS-M5-Q139	5	The function f used in address calculation sort must be order preserving, which means:	{"If x <= y then f(x) <= f(y)","If x <= y then f(x) >= f(y)","f(x) is different for every key x","f(x) is chosen randomly for every key"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.817433+05:30	f	[]	[]
560	5	OS-M5-Q140	5	In hashing, a collision occurs when:	{"A key is not found in the hash table","The hash table becomes empty","Two or more keys map to the same memory location","The hash function returns a negative value"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.817698+05:30	f	[]	[]
561	5	OS-M5-Q141	5	In the division method of hashing, the hash function is:	{"h(x) = x div M","h(x) = x * M","h(x) = M - x","h(x) = x mod M"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.817971+05:30	f	[]	[]
562	5	OS-M5-Q142	5	A hash table of size 10 uses H(k) = k mod 10 with linear probing. The keys 72, 27, 36, 24, 63, 81, 92, 101 are inserted in this order. At which index is the key 101 stored?	{5,8,1,9}	2	Official answer key: B	1.00	2026-11-19 00:19:39.818247+05:30	f	[]	[]
563	5	OS-M5-Q143	5	The keys 72, 27, 36, 24, 63, 81, 92, 101 are stored, in this order, in a hash table of size 10 using H(k) = k mod 10 and linear probing. The average search length (total probes needed to find all 8 keys divided by 8) is:	{2.0,1.5,2.25,3.0}	3	Official answer key: C	1.00	2026-11-19 00:19:39.81852+05:30	f	[]	[]
564	5	OS-M5-Q144	5	A hash table of size 10 uses H(k) = k mod 10 with quadratic probing (probes h, h+1, h+4, h+9, ...). The keys 22, 32 and 42 are inserted in this order. At which index is 42 stored?	{4,3,5,6}	4	Official answer key: D	1.00	2026-11-19 00:19:39.818789+05:30	f	[]	[]
565	5	OS-M5-Q145	5	Double hashing with H1(key) = key % 10 and H2(key) = 7 - (key % 7) is used, and a collision is resolved with (H1(key) + i x H2(key)) % 10. The keys 37, 90, 45, 22, 17, 49, 55 are inserted in this order. At which index is the key 17 stored?	{1,8,4,7}	1	Official answer key: A	1.00	2026-11-19 00:19:39.819063+05:30	f	[]	[]
566	5	OS-M5-Q146	5	Using the folding method for a hash table with 100 locations, the key 123456 is divided into the parts 12, 34 and 56, which are added, ignoring any carry. The hash value is:	{102,12,56,"2 (that is, 02)"}	4	Official answer key: D	1.00	2026-11-19 00:19:39.819333+05:30	f	[]	[]
588	1	Q-M1-4447F2F8A2	1	Identify the correct networking concept or value: Which device forwards frames using MAC addresses?	{Modem,Router,Gateway,Switch}	4	\N	1.00	2026-11-19 02:38:42.173029+05:30	f	[]	[]
567	5	OS-M5-Q147	5	Words are stored using chaining in a table of size 5 with H(str) = (sum of the positions of its letters in the English alphabet) % 5. The words like, a, tree, you, first, a, place, to are inserted in this order at the rear of their chains. The words in the chain of index 2 are:	{"a, you, a","tree, first, place","like, first, place","like, tree, place"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.81961+05:30	f	[]	[]
568	5	OS-M5-Q148	5	In rehashing, when the hash table becomes nearly full:	{"The entries are copied to the same positions of a bigger table","A new table of double the size is created and every entry is re-inserted using its newly computed hash value","The size of the table is halved and the entries are rehashed","All the chains are deleted and the table is emptied"}	2	Official answer key: B	1.00	2026-11-19 00:19:39.820026+05:30	f	[]	[]
569	5	OS-M5-Q149	5	Which of the following is a drawback of static hashing?	{"The table size is fixed, so it cannot accommodate data growth and collisions increase as the data grows","It requires a directory of pointers that must be doubled","It cannot use chaining or linear probing","The hash function cannot be computed in constant time"}	1	Official answer key: A	1.00	2026-11-19 00:19:39.820299+05:30	f	[]	[]
570	5	OS-M5-Q150	5	Which statement about dynamic hashing is correct?	{"Linear hashing uses a directory that is doubled, whereas extendible hashing splits buckets in round-robin order","Both extendible and linear hashing use a table of fixed size","Extendible hashing uses a directory that is doubled, splitting only the bucket that overflowed, whereas linear hashing uses no directory and splits buckets in round-robin order","Extendible hashing needs overflow pages, whereas linear hashing needs none"}	3	Official answer key: C	1.00	2026-11-19 00:19:39.820673+05:30	f	[]	[]
571	1	Q-M1-CA112E8286	1	Select the best answer. Which organization publishes many Internet standards as RFCs?	{IETF,"W3C only","IEEE only","ITU-T only"}	1	\N	1.00	2026-11-19 02:38:42.078682+05:30	f	[]	[]
572	1	Q-M1-DDA89FBBB3	1	Choose the most accurate answer. Which device commonly connects different IP networks?	{Hub,Repeater,Router,Bridge}	3	\N	1.00	2026-11-19 02:38:42.116851+05:30	f	[]	[]
573	1	Q-M1-D1FEA9C250	1	Scenario check: A learner is reviewing this networking point: A common copper medium used in Ethernet cabling. Which answer is correct? Which medium consists of two insulated copper conductors twisted together?	{"Twisted-pair cable","Satellite link","Optical fibre",Waveguide}	1	\N	1.00	2026-11-19 02:38:42.120677+05:30	f	[]	[]
574	1	Q-M1-85237996D8	1	Scenario check: A learner is reviewing this networking point: A shielded copper cable with a central conductor. Which answer is correct? Which medium has a central conductor surrounded by insulation and shielding?	{"Twisted pair","Coaxial cable",Infrared,"Optical fibre"}	2	\N	1.00	2026-11-19 02:38:42.124301+05:30	f	[]	[]
575	1	Q-M1-7FED2C5607	1	In a computer-networking context, Which transmission mode allows communication in only one direction?	{Half-duplex,Full-duplex,Simplex,Multiplex}	3	\N	1.00	2026-11-19 02:38:42.127889+05:30	f	[]	[]
576	1	Q-M1-B9BDABE2F3	1	Identify the correct networking concept or value: What is packet switching?	{"Reserving one physical path for the entire session","Combining all devices into one cable","Dividing data into packets that are forwarded through a network","Sending only analog signals"}	3	\N	1.00	2026-11-19 02:38:42.13141+05:30	f	[]	[]
577	1	Q-M1-900681281A	1	Choose the most accurate answer. What is circuit switching?	{"Establishing a dedicated path for a communication session","Sending independent datagrams without setup","Encrypting every frame","Assigning MAC addresses dynamically"}	1	\N	1.00	2026-11-19 02:38:42.136766+05:30	f	[]	[]
578	1	Q-M1-0485FC87D8	1	Identify the correct networking concept or value: Which topology connects every device to a central device?	{"Mesh topology","Bus topology","Ring topology","Star topology"}	4	\N	1.00	2026-11-19 02:38:42.140595+05:30	f	[]	[]
579	1	Q-M1-DE027AA273	1	Identify the correct networking concept or value: Which communication method uses radio waves and no physical cable between endpoints?	{"Wireless communication","Guided transmission","Baseband copper only","Optical-fibre transmission"}	1	\N	1.00	2026-11-19 02:38:42.143574+05:30	f	[]	[]
580	1	Q-M1-97018DEE93	1	Identify the correct networking concept or value: What is circuit switching?	{"Encrypting every frame","Sending independent datagrams without setup","Assigning MAC addresses dynamically","Establishing a dedicated path for a communication session"}	4	\N	1.00	2026-11-19 02:38:42.146386+05:30	f	[]	[]
581	1	Q-M1-0A464541A9	1	Scenario check: A learner is reviewing this networking point: A layout where devices share one main communication cable. Which answer is correct? Which topology uses a single shared backbone cable?	{"Star topology","Full mesh topology","Bus topology","Tree topology"}	3	\N	1.00	2026-11-19 02:38:42.14964+05:30	f	[]	[]
582	1	Q-M1-62ED3A7167	1	Identify the correct networking concept or value: Which transmission mode allows communication in only one direction?	{Half-duplex,Multiplex,Simplex,Full-duplex}	3	\N	1.00	2026-11-19 02:38:42.152792+05:30	f	[]	[]
583	1	Q-M1-FEC387A651	1	Select the best answer. Which unit is commonly used to express a data rate?	{"Hertz per packet","Frames per volt","Bytes per metre","Bits per second"}	4	\N	1.00	2026-11-19 02:38:42.155681+05:30	f	[]	[]
584	1	Q-M1-D365DFD97C	1	Choose the most accurate answer. Which unit is commonly used to express a data rate?	{"Bits per second","Hertz per packet","Bytes per metre","Frames per volt"}	1	\N	1.00	2026-11-19 02:38:42.158902+05:30	f	[]	[]
585	1	Q-M1-48D1A83CE9	1	In a computer-networking context, Which unit is commonly used to express a data rate?	{"Frames per volt","Bytes per metre","Bits per second","Hertz per packet"}	3	\N	1.00	2026-11-19 02:38:42.162111+05:30	f	[]	[]
586	1	Q-M1-F0FDAFFA2A	1	Identify the correct networking concept or value: What does bandwidth commonly describe in a communication channel?	{"Packet header size","Number of network users","Its frequency range or data-carrying capacity","Physical cable length only"}	3	\N	1.00	2026-11-19 02:38:42.165163+05:30	f	[]	[]
587	1	Q-M1-E8B5B8F396	1	Choose the most accurate answer. Which communication method uses radio waves and no physical cable between endpoints?	{"Guided transmission","Optical-fibre transmission","Baseband copper only","Wireless communication"}	4	\N	1.00	2026-11-19 02:38:42.169784+05:30	f	[]	[]
589	1	Q-M1-35691B09D7	1	Which option correctly answers this question: What does a protocol define?	{"A cable's colour code only","A computer's screen resolution","Rules and conventions for communication","A router's physical size"}	3	\N	1.00	2026-11-19 02:38:42.175882+05:30	f	[]	[]
590	1	Q-M1-B7F9746A60	1	Choose the most accurate answer. Which topology uses a single shared backbone cable?	{"Star topology","Bus topology","Tree topology","Full mesh topology"}	2	\N	1.00	2026-11-19 02:38:42.17977+05:30	f	[]	[]
591	1	Q-M1-1E46FB3A14	1	Scenario check: A learner is reviewing this networking point: The layer that provides process-to-process delivery. Which answer is correct? Which layer provides end-to-end process communication?	{"Presentation layer","Data Link layer","Physical layer","Transport layer"}	4	\N	1.00	2026-11-19 02:38:42.182382+05:30	f	[]	[]
592	1	Q-M1-95768C9D47	1	Identify the correct networking concept or value: Which model organizes network communication into seven layers?	{"Bluetooth stack","OSI model","Ethernet frame","TCP/IP model"}	2	\N	1.00	2026-11-19 02:38:42.185597+05:30	f	[]	[]
593	1	Q-M1-6B905AE83B	1	Choose the most accurate answer. Which transmission medium carries data as light pulses?	{"Radio link","Twisted-pair copper","Optical fibre","Coaxial cable"}	3	\N	1.00	2026-11-19 02:38:42.188666+05:30	f	[]	[]
594	1	Q-M1-F6FEDA6557	1	In a computer-networking context, Which communication method uses radio waves and no physical cable between endpoints?	{"Optical-fibre transmission","Wireless communication","Baseband copper only","Guided transmission"}	2	\N	1.00	2026-11-19 02:38:42.193232+05:30	f	[]	[]
595	1	Q-M1-A8796CFB76	1	Select the best answer. Which communication method uses radio waves and no physical cable between endpoints?	{"Guided transmission","Baseband copper only","Wireless communication","Optical-fibre transmission"}	3	\N	1.00	2026-11-19 02:38:42.196441+05:30	f	[]	[]
596	1	Q-M1-70008CFBD5	1	Identify the correct networking concept or value: Which device commonly connects different IP networks?	{Bridge,Repeater,Router,Hub}	3	\N	1.00	2026-11-19 02:38:42.207224+05:30	f	[]	[]
597	1	Q-M1-7EF062D4D7	1	Which option correctly answers this question: Which layer is responsible for routing packets between networks?	{"Presentation layer","Network layer","Physical layer","Session layer"}	2	\N	1.00	2026-11-19 02:38:42.210859+05:30	f	[]	[]
598	1	Q-M1-CC477466E2	1	In a computer-networking context, Which model organizes network communication into seven layers?	{"Ethernet frame","OSI model","Bluetooth stack","TCP/IP model"}	2	\N	1.00	2026-11-19 02:38:42.216287+05:30	f	[]	[]
599	1	Q-M1-968921F829	1	Select the best answer. Which model organizes network communication into seven layers?	{"Bluetooth stack","TCP/IP model","Ethernet frame","OSI model"}	4	\N	1.00	2026-11-19 02:38:42.219974+05:30	f	[]	[]
600	1	Q-M1-2E791889EB	1	Which option correctly answers this question: Which device commonly connects different IP networks?	{Hub,Router,Repeater,Bridge}	2	\N	1.00	2026-11-19 02:38:42.222758+05:30	f	[]	[]
601	1	Q-M1-C0E18F96D2	1	Identify the correct networking concept or value: Which medium has a central conductor surrounded by insulation and shielding?	{"Twisted pair","Optical fibre",Infrared,"Coaxial cable"}	4	\N	1.00	2026-11-19 02:38:42.225416+05:30	f	[]	[]
602	1	Q-M1-C914949A1E	1	Select the best answer. What does bandwidth commonly describe in a communication channel?	{"Physical cable length only","Number of network users","Its frequency range or data-carrying capacity","Packet header size"}	3	\N	1.00	2026-11-19 02:38:42.228329+05:30	f	[]	[]
603	1	Q-M1-E744A8127E	1	Which option correctly answers this question: Which transmission mode allows communication in both directions at the same time?	{Simplex,Broadcast,Full-duplex,Half-duplex}	3	\N	1.00	2026-11-19 02:38:42.231495+05:30	f	[]	[]
604	1	Q-M1-A0F2283628	1	Identify the correct networking concept or value: What is latency in a network?	{"The maximum cable diameter","The number of bits in an address","The time taken for data to travel from source to destination","The count of connected switches"}	3	\N	1.00	2026-11-19 02:38:42.234889+05:30	f	[]	[]
605	1	Q-M1-BB2C911661	1	Choose the most accurate answer. Which topology connects every device to a central device?	{"Bus topology","Mesh topology","Ring topology","Star topology"}	4	\N	1.00	2026-11-19 02:38:42.238063+05:30	f	[]	[]
606	1	Q-M1-88EB4D6395	1	In a computer-networking context, Which transmission medium carries data as light pulses?	{"Radio link","Twisted-pair copper","Coaxial cable","Optical fibre"}	4	\N	1.00	2026-11-19 02:38:42.241027+05:30	f	[]	[]
607	1	Q-M1-0D325121F6	1	Which option correctly answers this question: Which unit is commonly used to express a data rate?	{"Bits per second","Frames per volt","Hertz per packet","Bytes per metre"}	1	\N	1.00	2026-11-19 02:38:42.243766+05:30	f	[]	[]
608	1	Q-M1-FF4B3F321B	1	In a computer-networking context, Which topology uses a single shared backbone cable?	{"Star topology","Full mesh topology","Tree topology","Bus topology"}	4	\N	1.00	2026-11-19 02:38:42.246316+05:30	f	[]	[]
609	1	Q-M1-A721771042	1	Choose the most accurate answer. Which transmission mode allows communication in only one direction?	{Full-duplex,Half-duplex,Multiplex,Simplex}	4	\N	1.00	2026-11-19 02:38:42.256395+05:30	f	[]	[]
610	1	Q-M1-D456A041E8	1	Choose the most accurate answer. What is packet switching?	{"Combining all devices into one cable","Sending only analog signals","Reserving one physical path for the entire session","Dividing data into packets that are forwarded through a network"}	4	\N	1.00	2026-11-19 02:38:42.258948+05:30	f	[]	[]
611	1	Q-M1-73161E70F1	1	Identify the correct networking concept or value: Which layer provides end-to-end process communication?	{"Presentation layer","Transport layer","Physical layer","Data Link layer"}	2	\N	1.00	2026-11-19 02:38:42.26177+05:30	f	[]	[]
612	1	Q-M1-954849847D	1	Identify the correct networking concept or value: What does a protocol define?	{"A computer's screen resolution","A cable's colour code only","A router's physical size","Rules and conventions for communication"}	4	\N	1.00	2026-11-19 02:38:42.264728+05:30	f	[]	[]
613	1	Q-M1-FCAD8B65FD	1	Select the best answer. What does a protocol define?	{"A router's physical size","A cable's colour code only","Rules and conventions for communication","A computer's screen resolution"}	3	\N	1.00	2026-11-19 02:38:42.26879+05:30	f	[]	[]
614	1	Q-M1-19C379E173	1	Select the best answer. Which layer is responsible for routing packets between networks?	{"Session layer","Presentation layer","Physical layer","Network layer"}	4	\N	1.00	2026-11-19 02:38:42.271982+05:30	f	[]	[]
615	1	Q-M1-1CA1506D38	1	Which option correctly answers this question: Which topology connects every device to a central device?	{"Bus topology","Mesh topology","Ring topology","Star topology"}	4	\N	1.00	2026-11-19 02:38:42.275245+05:30	f	[]	[]
616	1	Q-M1-B2B31AE24C	1	Choose the most accurate answer. Which layer provides end-to-end process communication?	{"Transport layer","Data Link layer","Presentation layer","Physical layer"}	1	\N	1.00	2026-11-19 02:38:42.277967+05:30	f	[]	[]
617	1	Q-M1-8C1DD6D787	1	Scenario check: A learner is reviewing this networking point: A seven-layer reference framework used to describe network functions. Which answer is correct? Which model organizes network communication into seven layers?	{"Ethernet frame","OSI model","Bluetooth stack","TCP/IP model"}	2	\N	1.00	2026-11-19 02:38:42.280796+05:30	f	[]	[]
618	1	Q-M1-DE1A8E25A3	1	Which option correctly answers this question: What does bandwidth commonly describe in a communication channel?	{"Physical cable length only","Number of network users","Packet header size","Its frequency range or data-carrying capacity"}	4	\N	1.00	2026-11-19 02:38:42.283829+05:30	f	[]	[]
619	1	Q-M1-E14CB63EAB	1	In a computer-networking context, Which organization publishes many Internet standards as RFCs?	{"ITU-T only",IETF,"W3C only","IEEE only"}	2	\N	1.00	2026-11-19 02:38:42.286984+05:30	f	[]	[]
620	1	Q-M1-F888AC59FB	1	In a computer-networking context, Which layer is responsible for routing packets between networks?	{"Network layer","Session layer","Presentation layer","Physical layer"}	1	\N	1.00	2026-11-19 02:38:42.289695+05:30	f	[]	[]
621	1	Q-M1-1FF4930DD6	1	Scenario check: A learner is reviewing this networking point: The range of frequencies or capacity available to carry information. Which answer is correct? What does bandwidth commonly describe in a communication channel?	{"Number of network users","Physical cable length only","Packet header size","Its frequency range or data-carrying capacity"}	4	\N	1.00	2026-11-19 02:38:42.292651+05:30	f	[]	[]
622	1	Q-M1-B88019C909	1	Select the best answer. What is packet switching?	{"Reserving one physical path for the entire session","Dividing data into packets that are forwarded through a network","Sending only analog signals","Combining all devices into one cable"}	2	\N	1.00	2026-11-19 02:38:42.295741+05:30	f	[]	[]
623	1	Q-M1-89DAFF4BC8	1	In a computer-networking context, Which layer provides end-to-end process communication?	{"Transport layer","Presentation layer","Physical layer","Data Link layer"}	1	\N	1.00	2026-11-19 02:38:42.298924+05:30	f	[]	[]
624	1	Q-M1-67726CFAA8	1	Select the best answer. Which medium has a central conductor surrounded by insulation and shielding?	{"Twisted pair","Coaxial cable","Optical fibre",Infrared}	2	\N	1.00	2026-11-19 02:38:42.303022+05:30	f	[]	[]
625	1	Q-M1-570D45C591	1	Select the best answer. Which device commonly connects different IP networks?	{Hub,Router,Repeater,Bridge}	2	\N	1.00	2026-11-19 02:38:42.306137+05:30	f	[]	[]
626	1	Q-M1-DE51702BD2	1	Which option correctly answers this question: Which device forwards frames using MAC addresses?	{Switch,Gateway,Modem,Router}	1	\N	1.00	2026-11-19 02:38:42.309114+05:30	f	[]	[]
627	1	Q-M1-A1DF0AA45A	1	Scenario check: A learner is reviewing this networking point: A LAN device that learns MAC addresses and forwards frames. Which answer is correct? Which device forwards frames using MAC addresses?	{Modem,Router,Gateway,Switch}	4	\N	1.00	2026-11-19 02:38:42.312053+05:30	f	[]	[]
628	1	Q-M1-22B85A4765	1	Identify the correct networking concept or value: Which transmission mode allows communication in both directions at the same time?	{Simplex,Broadcast,Full-duplex,Half-duplex}	3	\N	1.00	2026-11-19 02:38:42.315028+05:30	f	[]	[]
629	1	Q-M1-0F35D56BAF	1	Identify the correct networking concept or value: Which layer is responsible for routing packets between networks?	{"Network layer","Session layer","Presentation layer","Physical layer"}	1	\N	1.00	2026-11-19 02:38:42.320749+05:30	f	[]	[]
630	1	Q-M1-D1C1B89543	1	Scenario check: A learner is reviewing this networking point: A method in which packets may be routed independently. Which answer is correct? What is packet switching?	{"Sending only analog signals","Dividing data into packets that are forwarded through a network","Reserving one physical path for the entire session","Combining all devices into one cable"}	2	\N	1.00	2026-11-19 02:38:42.323847+05:30	f	[]	[]
631	1	Q-M1-0C4170CDBD	1	Choose the most accurate answer. Which medium consists of two insulated copper conductors twisted together?	{"Twisted-pair cable",Waveguide,"Optical fibre","Satellite link"}	1	\N	1.00	2026-11-19 02:38:42.327057+05:30	f	[]	[]
632	1	Q-M1-914F13C555	1	Select the best answer. Which medium consists of two insulated copper conductors twisted together?	{"Satellite link",Waveguide,"Optical fibre","Twisted-pair cable"}	4	\N	1.00	2026-11-19 02:38:42.329949+05:30	f	[]	[]
633	1	Q-M1-82D2EF04F5	1	Select the best answer. Which topology uses a single shared backbone cable?	{"Tree topology","Bus topology","Star topology","Full mesh topology"}	2	\N	1.00	2026-11-19 02:38:42.33314+05:30	f	[]	[]
634	1	Q-M1-571500103D	1	Which option correctly answers this question: Which organization publishes many Internet standards as RFCs?	{"W3C only","ITU-T only",IETF,"IEEE only"}	3	\N	1.00	2026-11-19 02:38:42.339045+05:30	f	[]	[]
635	1	Q-M1-0F1CFF7A53	1	Which option correctly answers this question: Which model organizes network communication into seven layers?	{"TCP/IP model","Ethernet frame","Bluetooth stack","OSI model"}	4	\N	1.00	2026-11-19 02:38:42.341932+05:30	f	[]	[]
636	1	Q-M1-F12ACC8F35	1	Choose the most accurate answer. Which device forwards frames using MAC addresses?	{Modem,Switch,Gateway,Router}	2	\N	1.00	2026-11-19 02:38:42.344559+05:30	f	[]	[]
637	1	Q-M1-D1D531098A	1	Which option correctly answers this question: Which transmission mode allows communication in only one direction?	{Multiplex,Simplex,Full-duplex,Half-duplex}	2	\N	1.00	2026-11-19 02:38:42.347436+05:30	f	[]	[]
638	1	Q-M1-F21B79454C	1	Identify the correct networking concept or value: Which transmission medium carries data as light pulses?	{"Optical fibre","Radio link","Twisted-pair copper","Coaxial cable"}	1	\N	1.00	2026-11-19 02:38:42.351057+05:30	f	[]	[]
639	1	Q-M1-ECEDBC27EF	1	Select the best answer. What is circuit switching?	{"Encrypting every frame","Assigning MAC addresses dynamically","Sending independent datagrams without setup","Establishing a dedicated path for a communication session"}	4	\N	1.00	2026-11-19 02:38:42.354555+05:30	f	[]	[]
640	1	Q-M1-154EA821F1	1	Select the best answer. Which layer provides end-to-end process communication?	{"Data Link layer","Presentation layer","Physical layer","Transport layer"}	4	\N	1.00	2026-11-19 02:38:42.35769+05:30	f	[]	[]
641	1	Q-M1-72EDCA4D9E	1	Choose the most accurate answer. Which organization publishes many Internet standards as RFCs?	{"ITU-T only","W3C only",IETF,"IEEE only"}	3	\N	1.00	2026-11-19 02:38:42.360763+05:30	f	[]	[]
642	1	Q-M1-AC6B842CB0	1	In a computer-networking context, What does a protocol define?	{"Rules and conventions for communication","A computer's screen resolution","A cable's colour code only","A router's physical size"}	1	\N	1.00	2026-11-19 02:38:42.363394+05:30	f	[]	[]
643	1	Q-M1-E7C82ED3FA	1	Scenario check: A learner is reviewing this networking point: A network-layer device that forwards packets between networks. Which answer is correct? Which device commonly connects different IP networks?	{Bridge,Hub,Repeater,Router}	4	\N	1.00	2026-11-19 02:38:42.365949+05:30	f	[]	[]
644	1	Q-M1-BB75DC5835	1	Select the best answer. Which transmission mode allows communication in only one direction?	{Simplex,Full-duplex,Half-duplex,Multiplex}	1	\N	1.00	2026-11-19 02:38:42.369001+05:30	f	[]	[]
645	1	Q-M1-3403078E38	1	Identify the correct networking concept or value: Which medium consists of two insulated copper conductors twisted together?	{"Optical fibre","Satellite link",Waveguide,"Twisted-pair cable"}	4	\N	1.00	2026-11-19 02:38:42.37197+05:30	f	[]	[]
646	1	Q-M1-C3A003A8DB	1	In a computer-networking context, Which device commonly connects different IP networks?	{Bridge,Hub,Repeater,Router}	4	\N	1.00	2026-11-19 02:38:42.374959+05:30	f	[]	[]
647	1	Q-M1-D3E96F405B	1	In a computer-networking context, What is latency in a network?	{"The time taken for data to travel from source to destination","The number of bits in an address","The maximum cable diameter","The count of connected switches"}	1	\N	1.00	2026-11-19 02:38:42.386181+05:30	f	[]	[]
648	1	Q-M1-74CA2D46BC	1	Identify the correct networking concept or value: Which unit is commonly used to express a data rate?	{"Bytes per metre","Hertz per packet","Frames per volt","Bits per second"}	4	\N	1.00	2026-11-19 02:38:42.389194+05:30	f	[]	[]
649	1	Q-M1-6E59C44506	1	Which option correctly answers this question: Which communication method uses radio waves and no physical cable between endpoints?	{"Wireless communication","Guided transmission","Optical-fibre transmission","Baseband copper only"}	1	\N	1.00	2026-11-19 02:38:42.400406+05:30	f	[]	[]
650	1	Q-M1-FC3E602E32	1	Scenario check: A learner is reviewing this networking point: The layer that handles logical addressing and path selection. Which answer is correct? Which layer is responsible for routing packets between networks?	{"Network layer","Session layer","Presentation layer","Physical layer"}	1	\N	1.00	2026-11-19 02:38:42.40397+05:30	f	[]	[]
651	1	Q-M1-2367E0DEE6	1	Which option correctly answers this question: What is circuit switching?	{"Sending independent datagrams without setup","Encrypting every frame","Establishing a dedicated path for a communication session","Assigning MAC addresses dynamically"}	3	\N	1.00	2026-11-19 02:38:42.407609+05:30	f	[]	[]
652	1	Q-M1-4B181D21C5	1	In a computer-networking context, What does bandwidth commonly describe in a communication channel?	{"Its frequency range or data-carrying capacity","Number of network users","Packet header size","Physical cable length only"}	1	\N	1.00	2026-11-19 02:38:42.410599+05:30	f	[]	[]
653	1	Q-M1-8FB51EF1AB	1	In a computer-networking context, Which transmission mode allows communication in both directions at the same time?	{Full-duplex,Simplex,Half-duplex,Broadcast}	1	\N	1.00	2026-11-19 02:38:42.413851+05:30	f	[]	[]
654	1	Q-M1-B9B8307B60	1	Choose the most accurate answer. What is latency in a network?	{"The number of bits in an address","The count of connected switches","The maximum cable diameter","The time taken for data to travel from source to destination"}	4	\N	1.00	2026-11-19 02:38:42.417113+05:30	f	[]	[]
655	1	Q-M1-EE2A64BB96	1	Scenario check: A learner is reviewing this networking point: A measure of communication delay. Which answer is correct? What is latency in a network?	{"The maximum cable diameter","The count of connected switches","The number of bits in an address","The time taken for data to travel from source to destination"}	4	\N	1.00	2026-11-19 02:38:42.420173+05:30	f	[]	[]
656	1	Q-M1-BDC7400C7D	1	Which option correctly answers this question: Which transmission medium carries data as light pulses?	{"Radio link","Optical fibre","Twisted-pair copper","Coaxial cable"}	2	\N	1.00	2026-11-19 02:38:42.423485+05:30	f	[]	[]
657	1	Q-M1-DB87CC2B05	1	Scenario check: A learner is reviewing this networking point: Communication through unguided electromagnetic waves. Which answer is correct? Which communication method uses radio waves and no physical cable between endpoints?	{"Guided transmission","Wireless communication","Baseband copper only","Optical-fibre transmission"}	2	\N	1.00	2026-11-19 02:38:42.426551+05:30	f	[]	[]
658	1	Q-M1-A1F65A59C5	1	In a computer-networking context, Which topology connects every device to a central device?	{"Mesh topology","Ring topology","Star topology","Bus topology"}	3	\N	1.00	2026-11-19 02:38:42.429477+05:30	f	[]	[]
659	1	Q-M1-F30D6285AA	1	Select the best answer. Which device forwards frames using MAC addresses?	{Gateway,Switch,Router,Modem}	2	\N	1.00	2026-11-19 02:38:42.443218+05:30	f	[]	[]
660	1	Q-M1-90810F6B8E	1	Choose the most accurate answer. Which layer is responsible for routing packets between networks?	{"Presentation layer","Physical layer","Session layer","Network layer"}	4	\N	1.00	2026-11-19 02:38:42.447859+05:30	f	[]	[]
1000	1	Q-M4-C0753657B9	4	Identify the correct networking concept or value: Which port is the default for HTTP?	{80,25,21,110}	1	\N	1.00	2026-11-19 02:38:43.590443+05:30	f	[]	[]
661	1	Q-M1-CA2E94CE28	1	Choose the most accurate answer. What does a protocol define?	{"A router's physical size","A cable's colour code only","Rules and conventions for communication","A computer's screen resolution"}	3	\N	1.00	2026-11-19 02:38:42.451216+05:30	f	[]	[]
662	1	Q-M1-51EC91036B	1	Scenario check: A learner is reviewing this networking point: A layout in which end devices connect to a central hub or switch. Which answer is correct? Which topology connects every device to a central device?	{"Star topology","Mesh topology","Bus topology","Ring topology"}	1	\N	1.00	2026-11-19 02:38:42.458979+05:30	f	[]	[]
663	1	Q-M1-0F9F23C4A4	1	Choose the most accurate answer. What does bandwidth commonly describe in a communication channel?	{"Its frequency range or data-carrying capacity","Number of network users","Physical cable length only","Packet header size"}	1	\N	1.00	2026-11-19 02:38:42.461902+05:30	f	[]	[]
664	1	Q-M1-71562DBB92	1	Which option correctly answers this question: Which topology uses a single shared backbone cable?	{"Bus topology","Star topology","Full mesh topology","Tree topology"}	1	\N	1.00	2026-11-19 02:38:42.464891+05:30	f	[]	[]
665	1	Q-M1-E4D4DB384D	1	Scenario check: A learner is reviewing this networking point: The Internet Engineering Task Force develops Internet standards. Which answer is correct? Which organization publishes many Internet standards as RFCs?	{"ITU-T only","IEEE only","W3C only",IETF}	4	\N	1.00	2026-11-19 02:38:42.468643+05:30	f	[]	[]
666	1	Q-M1-A4956EFD8B	1	In a computer-networking context, What is packet switching?	{"Dividing data into packets that are forwarded through a network","Sending only analog signals","Combining all devices into one cable","Reserving one physical path for the entire session"}	1	\N	1.00	2026-11-19 02:38:42.471909+05:30	f	[]	[]
667	1	Q-M1-A181E263EF	1	Which option correctly answers this question: What is latency in a network?	{"The time taken for data to travel from source to destination","The count of connected switches","The number of bits in an address","The maximum cable diameter"}	1	\N	1.00	2026-11-19 02:38:42.475263+05:30	f	[]	[]
668	1	Q-M1-991F623F3A	1	In a computer-networking context, Which medium has a central conductor surrounded by insulation and shielding?	{"Twisted pair",Infrared,"Optical fibre","Coaxial cable"}	4	\N	1.00	2026-11-19 02:38:42.478194+05:30	f	[]	[]
669	1	Q-M1-7A492559DC	1	Scenario check: A learner is reviewing this networking point: A guided medium that carries optical signals. Which answer is correct? Which transmission medium carries data as light pulses?	{"Coaxial cable","Optical fibre","Twisted-pair copper","Radio link"}	2	\N	1.00	2026-11-19 02:38:42.481756+05:30	f	[]	[]
670	1	Q-M1-8E118BE87F	1	Scenario check: A learner is reviewing this networking point: Simultaneous two-way communication. Which answer is correct? Which transmission mode allows communication in both directions at the same time?	{Full-duplex,Half-duplex,Broadcast,Simplex}	1	\N	1.00	2026-11-19 02:38:42.487134+05:30	f	[]	[]
671	1	Q-M1-0331576CC6	1	Scenario check: A learner is reviewing this networking point: A protocol specifies message formats, procedures and behaviour. Which answer is correct? What does a protocol define?	{"A computer's screen resolution","A cable's colour code only","A router's physical size","Rules and conventions for communication"}	4	\N	1.00	2026-11-19 02:38:42.491345+05:30	f	[]	[]
672	1	Q-M1-6F423C5439	1	Which option correctly answers this question: Which layer provides end-to-end process communication?	{"Data Link layer","Presentation layer","Physical layer","Transport layer"}	4	\N	1.00	2026-11-19 02:38:42.494561+05:30	f	[]	[]
673	1	Q-M1-3CEE74F15F	1	Scenario check: A learner is reviewing this networking point: Network data rates are commonly measured in bit/s. Which answer is correct? Which unit is commonly used to express a data rate?	{"Hertz per packet","Frames per volt","Bytes per metre","Bits per second"}	4	\N	1.00	2026-11-19 02:38:42.497912+05:30	f	[]	[]
674	1	Q-M1-8F0274B871	1	Scenario check: A learner is reviewing this networking point: A communication method that reserves resources along a path. Which answer is correct? What is circuit switching?	{"Encrypting every frame","Assigning MAC addresses dynamically","Establishing a dedicated path for a communication session","Sending independent datagrams without setup"}	3	\N	1.00	2026-11-19 02:38:42.501058+05:30	f	[]	[]
675	1	Q-M1-732B7CCF40	1	Scenario check: A learner is reviewing this networking point: One-way communication from sender to receiver. Which answer is correct? Which transmission mode allows communication in only one direction?	{Simplex,Half-duplex,Full-duplex,Multiplex}	1	\N	1.00	2026-11-19 02:38:42.504299+05:30	f	[]	[]
676	1	Q-M1-195742D382	1	Which option correctly answers this question: What is packet switching?	{"Combining all devices into one cable","Reserving one physical path for the entire session","Dividing data into packets that are forwarded through a network","Sending only analog signals"}	3	\N	1.00	2026-11-19 02:38:42.506834+05:30	f	[]	[]
677	1	Q-M1-8B925820CB	1	Identify the correct networking concept or value: Which organization publishes many Internet standards as RFCs?	{"IEEE only",IETF,"W3C only","ITU-T only"}	2	\N	1.00	2026-11-19 02:38:42.510182+05:30	f	[]	[]
678	1	Q-M1-259A237BDD	1	Which option correctly answers this question: Which medium has a central conductor surrounded by insulation and shielding?	{Infrared,"Optical fibre","Coaxial cable","Twisted pair"}	3	\N	1.00	2026-11-19 02:38:42.513314+05:30	f	[]	[]
679	1	Q-M1-1744A066E5	1	Identify the correct networking concept or value: Which topology uses a single shared backbone cable?	{"Star topology","Tree topology","Bus topology","Full mesh topology"}	3	\N	1.00	2026-11-19 02:38:42.51658+05:30	f	[]	[]
680	1	Q-M1-95C26662A4	1	Select the best answer. Which transmission medium carries data as light pulses?	{"Optical fibre","Twisted-pair copper","Radio link","Coaxial cable"}	1	\N	1.00	2026-11-19 02:38:42.519602+05:30	f	[]	[]
681	1	Q-M1-34AA8DFF9B	1	Choose the most accurate answer. Which model organizes network communication into seven layers?	{"Ethernet frame","Bluetooth stack","TCP/IP model","OSI model"}	4	\N	1.00	2026-11-19 02:38:42.522502+05:30	f	[]	[]
682	1	Q-M1-4DD5A92170	1	Which option correctly answers this question: Which medium consists of two insulated copper conductors twisted together?	{"Twisted-pair cable",Waveguide,"Optical fibre","Satellite link"}	1	\N	1.00	2026-11-19 02:38:42.525616+05:30	f	[]	[]
683	1	Q-M1-924691FD30	1	Select the best answer. What is latency in a network?	{"The time taken for data to travel from source to destination","The count of connected switches","The number of bits in an address","The maximum cable diameter"}	1	\N	1.00	2026-11-19 02:38:42.528645+05:30	f	[]	[]
684	1	Q-M1-E873A0EECE	1	Choose the most accurate answer. Which medium has a central conductor surrounded by insulation and shielding?	{"Optical fibre",Infrared,"Twisted pair","Coaxial cable"}	4	\N	1.00	2026-11-19 02:38:42.531807+05:30	f	[]	[]
685	1	Q-M1-E7BF7755DD	1	Choose the most accurate answer. Which transmission mode allows communication in both directions at the same time?	{Broadcast,Full-duplex,Half-duplex,Simplex}	2	\N	1.00	2026-11-19 02:38:42.535421+05:30	f	[]	[]
686	1	Q-M1-3E70BE4EBE	1	In a computer-networking context, What is circuit switching?	{"Assigning MAC addresses dynamically","Sending independent datagrams without setup","Encrypting every frame","Establishing a dedicated path for a communication session"}	4	\N	1.00	2026-11-19 02:38:42.538181+05:30	f	[]	[]
687	1	Q-M1-93849AB2D4	1	In a computer-networking context, Which device forwards frames using MAC addresses?	{Gateway,Switch,Modem,Router}	2	\N	1.00	2026-11-19 02:38:42.54146+05:30	f	[]	[]
688	1	Q-M1-5B85A4844E	1	Select the best answer. Which transmission mode allows communication in both directions at the same time?	{Half-duplex,Broadcast,Simplex,Full-duplex}	4	\N	1.00	2026-11-19 02:38:42.545394+05:30	f	[]	[]
689	1	Q-M1-9550BB17FE	1	Select the best answer. Which topology connects every device to a central device?	{"Mesh topology","Bus topology","Ring topology","Star topology"}	4	\N	1.00	2026-11-19 02:38:42.548288+05:30	f	[]	[]
690	1	Q-M1-E41E2A0B84	1	In a computer-networking context, Which medium consists of two insulated copper conductors twisted together?	{"Optical fibre","Twisted-pair cable",Waveguide,"Satellite link"}	2	\N	1.00	2026-11-19 02:38:42.551596+05:30	f	[]	[]
691	1	Q-M2-F6DDF6726C	2	Select the best answer. Which access method listens to the channel before transmitting and detects collisions?	{CSMA/CD,"Token passing only",CSMA/CA,"Round-robin DNS"}	1	\N	1.00	2026-11-19 02:38:42.554605+05:30	f	[]	[]
692	1	Q-M2-03E826FDBE	2	In a computer-networking context, What is the purpose of a sequence number in ARQ?	{"To encode a domain name","To identify an application window","To measure cable resistance","To identify frames and help detect duplicates or ordering"}	4	\N	1.00	2026-11-19 02:38:42.557751+05:30	f	[]	[]
693	1	Q-M2-22CAB4DD24	2	Select the best answer. What is the common Ethernet MTU for the payload?	{"1500 bytes","512 bytes","9000 bits","64 bytes"}	1	\N	1.00	2026-11-19 02:38:42.561899+05:30	f	[]	[]
694	1	Q-M2-754B8656C8	2	Identify the correct networking concept or value: Which technique detects errors using a polynomial code?	{CRC,"Parity-free routing",NAT,ARP}	1	\N	1.00	2026-11-19 02:38:42.564927+05:30	f	[]	[]
695	1	Q-M2-D0C2E181D5	2	In a computer-networking context, What is the minimum Ethernet frame size, excluding preamble and SFD?	{"64 bytes","46 bytes","32 bytes","1500 bytes"}	1	\N	1.00	2026-11-19 02:38:42.568783+05:30	f	[]	[]
696	1	Q-M2-6469BAEF81	2	Scenario check: A learner is reviewing this networking point: A checksum is computed and checked to detect corruption. Which answer is correct? What is the purpose of a checksum?	{"To help detect errors in transmitted data","To allocate IP subnets","To select cable length","To assign hostnames"}	1	\N	1.00	2026-11-19 02:38:42.572417+05:30	f	[]	[]
697	1	Q-M2-11F4D9B906	2	Scenario check: A learner is reviewing this networking point: HDLC uses bit-oriented framing and sliding-window flow/error control. Which answer is correct? Which protocol is a classic example of a sliding-window data-link protocol?	{HDLC,HTTP,SMTP,DNS}	1	\N	1.00	2026-11-19 02:38:42.576223+05:30	f	[]	[]
698	1	Q-M2-2660EC2331	2	Identify the correct networking concept or value: Which address is used for delivery within a local Ethernet network?	{"Process ID",URL,"Port number","MAC address"}	4	\N	1.00	2026-11-19 02:38:42.579504+05:30	f	[]	[]
699	1	Q-M2-8C5F06E874	2	Which option correctly answers this question: What is the purpose of a checksum?	{"To allocate IP subnets","To select cable length","To assign hostnames","To help detect errors in transmitted data"}	4	\N	1.00	2026-11-19 02:38:42.58235+05:30	f	[]	[]
700	1	Q-M2-AC6BE06C41	2	Choose the most accurate answer. What is the main purpose of the data-link layer?	{"Node-to-node delivery over a link","End-to-end application services","Choosing the best Internet route","Name resolution"}	1	\N	1.00	2026-11-19 02:38:42.585363+05:30	f	[]	[]
701	1	Q-M2-417AFD623E	2	Scenario check: A learner is reviewing this networking point: A common Ethernet IP MTU is 1500 bytes. Which answer is correct? What is the common Ethernet MTU for the payload?	{"1500 bytes","64 bytes","512 bytes","9000 bits"}	1	\N	1.00	2026-11-19 02:38:42.588443+05:30	f	[]	[]
702	1	Q-M2-7EAC4BAEB2	2	Choose the most accurate answer. Which protocol provides point-to-point framing and link configuration?	{PPP,ICMP,BGP,DNS}	1	\N	1.00	2026-11-19 02:38:42.591543+05:30	f	[]	[]
703	1	Q-M2-4E83E59872	2	In a computer-networking context, Which protocol is commonly used to carry VLAN tags on Ethernet links?	{HTTP/2,"IEEE 802.1Q","IEEE 802.11",FTP}	2	\N	1.00	2026-11-19 02:38:42.595173+05:30	f	[]	[]
704	1	Q-M2-B6BE1329F1	2	Identify the correct networking concept or value: What is the purpose of a sequence number in ARQ?	{"To identify frames and help detect duplicates or ordering","To measure cable resistance","To encode a domain name","To identify an application window"}	1	\N	1.00	2026-11-19 02:38:42.598762+05:30	f	[]	[]
705	1	Q-M2-DA256AA425	2	Scenario check: A learner is reviewing this networking point: A bridge connects LAN segments at the data-link layer. Which answer is correct? What does a bridge do in a LAN?	{"Encrypts transport sessions","Resolves domain names","Forwards frames between LAN segments using MAC addresses","Assigns public IP addresses"}	3	\N	1.00	2026-11-19 02:38:42.605499+05:30	f	[]	[]
706	1	Q-M2-DC4EF22CB6	2	In a computer-networking context, What is a broadcast frame delivered to?	{"All devices in the local broadcast domain","Only the default gateway","A single named application","Only the original sender"}	1	\N	1.00	2026-11-19 02:38:42.612142+05:30	f	[]	[]
707	1	Q-M2-5F3E4B8CD9	2	Choose the most accurate answer. What does a bridge do in a LAN?	{"Encrypts transport sessions","Forwards frames between LAN segments using MAC addresses","Assigns public IP addresses","Resolves domain names"}	2	\N	1.00	2026-11-19 02:38:42.615439+05:30	f	[]	[]
708	1	Q-M2-C12699DB32	2	Scenario check: A learner is reviewing this networking point: Flow control matches transmission rate to receiver capacity. Which answer is correct? What does flow control prevent?	{"A cable from carrying signals","A router from learning routes","A fast sender from overwhelming a slow receiver","A DNS server from caching names"}	3	\N	1.00	2026-11-19 02:38:42.622918+05:30	f	[]	[]
709	1	Q-M2-87F3BFB497	2	In a computer-networking context, What does a switch learn to build its forwarding table?	{"DNS names and web paths","Source MAC addresses and the ports on which they arrive","IP time-to-live values","TCP window sizes"}	2	\N	1.00	2026-11-19 02:38:42.625949+05:30	f	[]	[]
710	1	Q-M2-F28C3F2640	2	Which option correctly answers this question: What is the minimum Ethernet frame size, excluding preamble and SFD?	{"1500 bytes","64 bytes","32 bytes","46 bytes"}	2	\N	1.00	2026-11-19 02:38:42.629368+05:30	f	[]	[]
711	1	Q-M2-8562DCA244	2	In a computer-networking context, What is the common Ethernet MTU for the payload?	{"512 bytes","9000 bits","64 bytes","1500 bytes"}	4	\N	1.00	2026-11-19 02:38:42.632998+05:30	f	[]	[]
712	1	Q-M2-D58336210E	2	Choose the most accurate answer. What does flow control prevent?	{"A DNS server from caching names","A fast sender from overwhelming a slow receiver","A router from learning routes","A cable from carrying signals"}	2	\N	1.00	2026-11-19 02:38:42.636394+05:30	f	[]	[]
713	1	Q-M2-E5985EADC1	2	Scenario check: A learner is reviewing this networking point: The sender waits for ACK or timeout before proceeding. Which answer is correct? What does Stop-and-Wait ARQ do after sending a frame?	{"Sends all frames without tracking","Changes the destination MAC address","Waits for an acknowledgement before sending the next frame","Broadcasts every frame continuously"}	3	\N	1.00	2026-11-19 02:38:42.639456+05:30	f	[]	[]
714	1	Q-M2-48648D8DBE	2	Scenario check: A learner is reviewing this networking point: Traditional shared Ethernet uses carrier sensing and collision detection. Which answer is correct? Which access method listens to the channel before transmitting and detects collisions?	{CSMA/CD,CSMA/CA,"Round-robin DNS","Token passing only"}	1	\N	1.00	2026-11-19 02:38:42.642627+05:30	f	[]	[]
715	1	Q-M2-054E18EA5B	2	Which option correctly answers this question: What is framing?	{"Assigning IP addresses","Selecting a web server","Encrypting application files","Dividing a bit stream into identifiable data units called frames"}	4	\N	1.00	2026-11-19 02:38:42.645842+05:30	f	[]	[]
716	1	Q-M2-2CF9D95E36	2	In a computer-networking context, What does flow control prevent?	{"A fast sender from overwhelming a slow receiver","A router from learning routes","A cable from carrying signals","A DNS server from caching names"}	1	\N	1.00	2026-11-19 02:38:42.64901+05:30	f	[]	[]
717	1	Q-M2-A2E031D03D	2	Scenario check: A learner is reviewing this networking point: Traditional Ethernet specifies a 64-byte minimum frame size. Which answer is correct? What is the minimum Ethernet frame size, excluding preamble and SFD?	{"32 bytes","46 bytes","1500 bytes","64 bytes"}	4	\N	1.00	2026-11-19 02:38:42.653768+05:30	f	[]	[]
718	1	Q-M2-CFBC330627	2	Choose the most accurate answer. What is the purpose of a VLAN?	{"To replace IP routing everywhere","To logically separate a switched network into broadcast domains","To increase optical wavelength","To compress Ethernet frames"}	2	\N	1.00	2026-11-19 02:38:42.657062+05:30	f	[]	[]
719	1	Q-M2-81B74C7306	2	In a computer-networking context, Which access method listens to the channel before transmitting and detects collisions?	{CSMA/CA,CSMA/CD,"Token passing only","Round-robin DNS"}	2	\N	1.00	2026-11-19 02:38:42.660039+05:30	f	[]	[]
720	1	Q-M2-B56F6B64CE	2	Which option correctly answers this question: Which protocol is a classic example of a sliding-window data-link protocol?	{SMTP,HDLC,DNS,HTTP}	2	\N	1.00	2026-11-19 02:38:42.663152+05:30	f	[]	[]
721	1	Q-M2-AA99C14343	2	Which option correctly answers this question: What is the main purpose of the data-link layer?	{"Node-to-node delivery over a link","Name resolution","Choosing the best Internet route","End-to-end application services"}	1	\N	1.00	2026-11-19 02:38:42.665997+05:30	f	[]	[]
722	1	Q-M2-3ECDDCE47D	2	Choose the most accurate answer. What is framing?	{"Encrypting application files","Selecting a web server","Dividing a bit stream into identifiable data units called frames","Assigning IP addresses"}	3	\N	1.00	2026-11-19 02:38:42.669435+05:30	f	[]	[]
723	1	Q-M2-7A1296C195	2	Select the best answer. What is framing?	{"Assigning IP addresses","Encrypting application files","Selecting a web server","Dividing a bit stream into identifiable data units called frames"}	4	\N	1.00	2026-11-19 02:38:42.672582+05:30	f	[]	[]
724	1	Q-M2-0A3032081C	2	Which option correctly answers this question: What is the purpose of a sequence number in ARQ?	{"To identify an application window","To encode a domain name","To identify frames and help detect duplicates or ordering","To measure cable resistance"}	3	\N	1.00	2026-11-19 02:38:42.675747+05:30	f	[]	[]
725	1	Q-M2-1D6176B5CA	2	In a computer-networking context, Which address is used for delivery within a local Ethernet network?	{URL,"MAC address","Port number","Process ID"}	2	\N	1.00	2026-11-19 02:38:42.679805+05:30	f	[]	[]
726	1	Q-M2-68E9CE858C	2	In a computer-networking context, What is the purpose of a checksum?	{"To select cable length","To help detect errors in transmitted data","To assign hostnames","To allocate IP subnets"}	2	\N	1.00	2026-11-19 02:38:42.682613+05:30	f	[]	[]
727	1	Q-M2-DD9DA739F5	2	Choose the most accurate answer. What is the minimum Ethernet frame size, excluding preamble and SFD?	{"64 bytes","32 bytes","1500 bytes","46 bytes"}	1	\N	1.00	2026-11-19 02:38:42.68614+05:30	f	[]	[]
728	1	Q-M2-9084DC095A	2	Identify the correct networking concept or value: How long is a standard Ethernet MAC address?	{"48 bits","16 bits","32 bits","128 bits"}	1	\N	1.00	2026-11-19 02:38:42.688449+05:30	f	[]	[]
799	1	Q-M2-E962BC9D1E	2	Select the best answer. Which access method is associated with collision avoidance in Wi-Fi?	{PPP,CSMA/CA,CRC,CSMA/CD}	2	\N	1.00	2026-11-19 02:38:42.929229+05:30	f	[]	[]
729	1	Q-M2-EDFA611927	2	Which option correctly answers this question: What does Stop-and-Wait ARQ do after sending a frame?	{"Waits for an acknowledgement before sending the next frame","Sends all frames without tracking","Broadcasts every frame continuously","Changes the destination MAC address"}	1	\N	1.00	2026-11-19 02:38:42.691062+05:30	f	[]	[]
730	1	Q-M2-01C253A36B	2	Scenario check: A learner is reviewing this networking point: Wireless LANs use collision avoidance mechanisms. Which answer is correct? Which access method is associated with collision avoidance in Wi-Fi?	{PPP,CSMA/CA,CSMA/CD,CRC}	2	\N	1.00	2026-11-19 02:38:42.694294+05:30	f	[]	[]
731	1	Q-M2-9AF249A316	2	Select the best answer. Which address is used for delivery within a local Ethernet network?	{URL,"MAC address","Process ID","Port number"}	2	\N	1.00	2026-11-19 02:38:42.697628+05:30	f	[]	[]
732	1	Q-M2-B9F48D1F17	2	In a computer-networking context, What does Stop-and-Wait ARQ do after sending a frame?	{"Changes the destination MAC address","Broadcasts every frame continuously","Sends all frames without tracking","Waits for an acknowledgement before sending the next frame"}	4	\N	1.00	2026-11-19 02:38:42.700817+05:30	f	[]	[]
733	1	Q-M2-D2602B6811	2	Which option correctly answers this question: What is a broadcast frame delivered to?	{"A single named application","Only the default gateway","All devices in the local broadcast domain","Only the original sender"}	3	\N	1.00	2026-11-19 02:38:42.704369+05:30	f	[]	[]
734	1	Q-M2-F98525AE8B	2	Choose the most accurate answer. What is the purpose of a checksum?	{"To assign hostnames","To allocate IP subnets","To help detect errors in transmitted data","To select cable length"}	3	\N	1.00	2026-11-19 02:38:42.70737+05:30	f	[]	[]
735	1	Q-M2-87298BD171	2	Select the best answer. Which technique detects errors using a polynomial code?	{NAT,CRC,"Parity-free routing",ARP}	2	\N	1.00	2026-11-19 02:38:42.710892+05:30	f	[]	[]
736	1	Q-M2-095941C887	2	Select the best answer. What does a bridge do in a LAN?	{"Resolves domain names","Encrypts transport sessions","Forwards frames between LAN segments using MAC addresses","Assigns public IP addresses"}	3	\N	1.00	2026-11-19 02:38:42.713928+05:30	f	[]	[]
737	1	Q-M2-B392B0A6E9	2	Identify the correct networking concept or value: What is the common Ethernet MTU for the payload?	{"512 bytes","1500 bytes","9000 bits","64 bytes"}	2	\N	1.00	2026-11-19 02:38:42.716573+05:30	f	[]	[]
738	1	Q-M2-1D69C6EBAC	2	Choose the most accurate answer. What is the common Ethernet MTU for the payload?	{"1500 bytes","512 bytes","64 bytes","9000 bits"}	1	\N	1.00	2026-11-19 02:38:42.719902+05:30	f	[]	[]
739	1	Q-M2-0E608BE8A0	2	Select the best answer. Which protocol is commonly used to carry VLAN tags on Ethernet links?	{"IEEE 802.1Q",FTP,HTTP/2,"IEEE 802.11"}	1	\N	1.00	2026-11-19 02:38:42.723411+05:30	f	[]	[]
740	1	Q-M2-48A937A10B	2	Identify the correct networking concept or value: Which protocol is a classic example of a sliding-window data-link protocol?	{HTTP,SMTP,HDLC,DNS}	3	\N	1.00	2026-11-19 02:38:42.726504+05:30	f	[]	[]
741	1	Q-M2-86176C8C6E	2	Which option correctly answers this question: What does a bridge do in a LAN?	{"Forwards frames between LAN segments using MAC addresses","Encrypts transport sessions","Resolves domain names","Assigns public IP addresses"}	1	\N	1.00	2026-11-19 02:38:42.729947+05:30	f	[]	[]
742	1	Q-M2-9CAA7ADA47	2	Identify the correct networking concept or value: What is the main purpose of the data-link layer?	{"End-to-end application services","Node-to-node delivery over a link","Name resolution","Choosing the best Internet route"}	2	\N	1.00	2026-11-19 02:38:42.733623+05:30	f	[]	[]
743	1	Q-M2-EDCF7D011F	2	Identify the correct networking concept or value: What does flow control prevent?	{"A DNS server from caching names","A cable from carrying signals","A router from learning routes","A fast sender from overwhelming a slow receiver"}	4	\N	1.00	2026-11-19 02:38:42.737745+05:30	f	[]	[]
744	1	Q-M2-CDDAD8E191	2	Which option correctly answers this question: What is the common Ethernet MTU for the payload?	{"512 bytes","1500 bytes","64 bytes","9000 bits"}	2	\N	1.00	2026-11-19 02:38:42.742717+05:30	f	[]	[]
745	1	Q-M2-6256CD951D	2	Choose the most accurate answer. What does Stop-and-Wait ARQ do after sending a frame?	{"Changes the destination MAC address","Broadcasts every frame continuously","Sends all frames without tracking","Waits for an acknowledgement before sending the next frame"}	4	\N	1.00	2026-11-19 02:38:42.7461+05:30	f	[]	[]
746	1	Q-M2-C9B3A5946A	2	Identify the correct networking concept or value: Which protocol is commonly used to carry VLAN tags on Ethernet links?	{"IEEE 802.1Q",FTP,"IEEE 802.11",HTTP/2}	1	\N	1.00	2026-11-19 02:38:42.749035+05:30	f	[]	[]
747	1	Q-M2-30265C7E9B	2	Select the best answer. What does Stop-and-Wait ARQ do after sending a frame?	{"Changes the destination MAC address","Sends all frames without tracking","Waits for an acknowledgement before sending the next frame","Broadcasts every frame continuously"}	3	\N	1.00	2026-11-19 02:38:42.752217+05:30	f	[]	[]
748	1	Q-M2-6108CE3428	2	In a computer-networking context, Which protocol is a classic example of a sliding-window data-link protocol?	{SMTP,DNS,HTTP,HDLC}	4	\N	1.00	2026-11-19 02:38:42.755428+05:30	f	[]	[]
749	1	Q-M2-42D5550EFB	2	Scenario check: A learner is reviewing this networking point: Ethernet MAC addresses are 48 bits long. Which answer is correct? How long is a standard Ethernet MAC address?	{"16 bits","128 bits","32 bits","48 bits"}	4	\N	1.00	2026-11-19 02:38:42.758819+05:30	f	[]	[]
750	1	Q-M2-1A371D3836	2	Select the best answer. What is the purpose of a sequence number in ARQ?	{"To identify an application window","To measure cable resistance","To identify frames and help detect duplicates or ordering","To encode a domain name"}	3	\N	1.00	2026-11-19 02:38:42.762157+05:30	f	[]	[]
751	1	Q-M2-2848ADC328	2	Select the best answer. Which protocol provides point-to-point framing and link configuration?	{ICMP,PPP,DNS,BGP}	2	\N	1.00	2026-11-19 02:38:42.76672+05:30	f	[]	[]
752	1	Q-M2-C721DC92F3	2	Choose the most accurate answer. How long is a standard Ethernet MAC address?	{"32 bits","16 bits","48 bits","128 bits"}	3	\N	1.00	2026-11-19 02:38:42.770324+05:30	f	[]	[]
753	1	Q-M2-38316299FC	2	Choose the most accurate answer. What is a broadcast frame delivered to?	{"Only the original sender","Only the default gateway","All devices in the local broadcast domain","A single named application"}	3	\N	1.00	2026-11-19 02:38:42.773631+05:30	f	[]	[]
754	1	Q-M2-1BA42F7953	2	In a computer-networking context, What does a bridge do in a LAN?	{"Assigns public IP addresses","Encrypts transport sessions","Resolves domain names","Forwards frames between LAN segments using MAC addresses"}	4	\N	1.00	2026-11-19 02:38:42.77737+05:30	f	[]	[]
755	1	Q-M2-19BA504988	2	Identify the correct networking concept or value: What is the purpose of a VLAN?	{"To replace IP routing everywhere","To increase optical wavelength","To logically separate a switched network into broadcast domains","To compress Ethernet frames"}	3	\N	1.00	2026-11-19 02:38:42.779986+05:30	f	[]	[]
756	1	Q-M2-847F80F935	2	Identify the correct networking concept or value: What is framing?	{"Assigning IP addresses","Dividing a bit stream into identifiable data units called frames","Encrypting application files","Selecting a web server"}	2	\N	1.00	2026-11-19 02:38:42.783054+05:30	f	[]	[]
757	1	Q-M2-6121CE58DF	2	Which option correctly answers this question: Which technique detects errors using a polynomial code?	{ARP,"Parity-free routing",CRC,NAT}	3	\N	1.00	2026-11-19 02:38:42.786465+05:30	f	[]	[]
758	1	Q-M2-9C72AEB2EB	2	Scenario check: A learner is reviewing this networking point: VLANs create logical Layer-2 network segments. Which answer is correct? What is the purpose of a VLAN?	{"To replace IP routing everywhere","To compress Ethernet frames","To increase optical wavelength","To logically separate a switched network into broadcast domains"}	4	\N	1.00	2026-11-19 02:38:42.78959+05:30	f	[]	[]
759	1	Q-M2-D0D0A244B4	2	Identify the correct networking concept or value: What does a switch learn to build its forwarding table?	{"TCP window sizes","Source MAC addresses and the ports on which they arrive","IP time-to-live values","DNS names and web paths"}	2	\N	1.00	2026-11-19 02:38:42.79316+05:30	f	[]	[]
760	1	Q-M2-2FC56DA0A8	2	Choose the most accurate answer. Which address is used for delivery within a local Ethernet network?	{"Port number",URL,"Process ID","MAC address"}	4	\N	1.00	2026-11-19 02:38:42.796121+05:30	f	[]	[]
761	1	Q-M2-C3C1F6A10C	2	Scenario check: A learner is reviewing this networking point: 802.1Q defines VLAN tagging in Ethernet frames. Which answer is correct? Which protocol is commonly used to carry VLAN tags on Ethernet links?	{"IEEE 802.1Q",FTP,"IEEE 802.11",HTTP/2}	1	\N	1.00	2026-11-19 02:38:42.799415+05:30	f	[]	[]
762	1	Q-M2-095DFF8696	2	Scenario check: A learner is reviewing this networking point: Framing marks the boundaries of data-link units. Which answer is correct? What is framing?	{"Selecting a web server","Assigning IP addresses","Encrypting application files","Dividing a bit stream into identifiable data units called frames"}	4	\N	1.00	2026-11-19 02:38:42.802628+05:30	f	[]	[]
763	1	Q-M2-DFA98F47B0	2	Which option correctly answers this question: Which access method listens to the channel before transmitting and detects collisions?	{CSMA/CA,CSMA/CD,"Round-robin DNS","Token passing only"}	2	\N	1.00	2026-11-19 02:38:42.805873+05:30	f	[]	[]
764	1	Q-M2-8842C456FD	2	Which option correctly answers this question: Which protocol provides point-to-point framing and link configuration?	{PPP,DNS,BGP,ICMP}	1	\N	1.00	2026-11-19 02:38:42.809304+05:30	f	[]	[]
765	1	Q-M2-6DAED5FF72	2	Identify the correct networking concept or value: What does a bridge do in a LAN?	{"Encrypts transport sessions","Forwards frames between LAN segments using MAC addresses","Assigns public IP addresses","Resolves domain names"}	2	\N	1.00	2026-11-19 02:38:42.812172+05:30	f	[]	[]
766	1	Q-M2-130CE615F4	2	Identify the correct networking concept or value: Which access method listens to the channel before transmitting and detects collisions?	{CSMA/CD,"Round-robin DNS",CSMA/CA,"Token passing only"}	1	\N	1.00	2026-11-19 02:38:42.815161+05:30	f	[]	[]
767	1	Q-M2-0273AD19B7	2	Which option correctly answers this question: What does flow control prevent?	{"A DNS server from caching names","A cable from carrying signals","A fast sender from overwhelming a slow receiver","A router from learning routes"}	3	\N	1.00	2026-11-19 02:38:42.818619+05:30	f	[]	[]
768	1	Q-M2-DC69268DCC	2	Scenario check: A learner is reviewing this networking point: Point-to-Point Protocol is used over direct links. Which answer is correct? Which protocol provides point-to-point framing and link configuration?	{PPP,BGP,DNS,ICMP}	1	\N	1.00	2026-11-19 02:38:42.822219+05:30	f	[]	[]
769	1	Q-M2-DA63F8E0AF	2	Select the best answer. What does a switch learn to build its forwarding table?	{"IP time-to-live values","TCP window sizes","Source MAC addresses and the ports on which they arrive","DNS names and web paths"}	3	\N	1.00	2026-11-19 02:38:42.826122+05:30	f	[]	[]
770	1	Q-M2-6332A8B1CA	2	Select the best answer. What is the minimum Ethernet frame size, excluding preamble and SFD?	{"46 bytes","64 bytes","32 bytes","1500 bytes"}	2	\N	1.00	2026-11-19 02:38:42.829206+05:30	f	[]	[]
771	1	Q-M2-7B90D158C8	2	Which option correctly answers this question: Which address is used for delivery within a local Ethernet network?	{"Port number",URL,"MAC address","Process ID"}	3	\N	1.00	2026-11-19 02:38:42.832017+05:30	f	[]	[]
772	1	Q-M2-2CBDE20BC7	2	Scenario check: A learner is reviewing this networking point: A switch learns MAC-to-port associations from incoming frames. Which answer is correct? What does a switch learn to build its forwarding table?	{"TCP window sizes","IP time-to-live values","Source MAC addresses and the ports on which they arrive","DNS names and web paths"}	3	\N	1.00	2026-11-19 02:38:42.83646+05:30	f	[]	[]
773	1	Q-M2-463ACEC94B	2	In a computer-networking context, What is framing?	{"Selecting a web server","Encrypting application files","Assigning IP addresses","Dividing a bit stream into identifiable data units called frames"}	4	\N	1.00	2026-11-19 02:38:42.839488+05:30	f	[]	[]
774	1	Q-M2-A4778BBAD3	2	Choose the most accurate answer. What is the purpose of a sequence number in ARQ?	{"To identify frames and help detect duplicates or ordering","To identify an application window","To measure cable resistance","To encode a domain name"}	1	\N	1.00	2026-11-19 02:38:42.842651+05:30	f	[]	[]
775	1	Q-M2-D1D95A39C5	2	Choose the most accurate answer. What does a switch learn to build its forwarding table?	{"DNS names and web paths","IP time-to-live values","Source MAC addresses and the ports on which they arrive","TCP window sizes"}	3	\N	1.00	2026-11-19 02:38:42.847228+05:30	f	[]	[]
776	1	Q-M2-B409FE5955	2	Which option correctly answers this question: How long is a standard Ethernet MAC address?	{"48 bits","32 bits","128 bits","16 bits"}	1	\N	1.00	2026-11-19 02:38:42.852151+05:30	f	[]	[]
777	1	Q-M2-79B0BCE9B8	2	Choose the most accurate answer. Which protocol is commonly used to carry VLAN tags on Ethernet links?	{FTP,"IEEE 802.1Q",HTTP/2,"IEEE 802.11"}	2	\N	1.00	2026-11-19 02:38:42.855566+05:30	f	[]	[]
778	1	Q-M2-9303DFD303	2	Select the best answer. What does flow control prevent?	{"A cable from carrying signals","A fast sender from overwhelming a slow receiver","A DNS server from caching names","A router from learning routes"}	2	\N	1.00	2026-11-19 02:38:42.858711+05:30	f	[]	[]
779	1	Q-M2-3AE3227C7E	2	Identify the correct networking concept or value: What is a broadcast frame delivered to?	{"Only the default gateway","All devices in the local broadcast domain","Only the original sender","A single named application"}	2	\N	1.00	2026-11-19 02:38:42.86199+05:30	f	[]	[]
780	1	Q-M2-3F27AD44E9	2	In a computer-networking context, Which protocol provides point-to-point framing and link configuration?	{ICMP,BGP,DNS,PPP}	4	\N	1.00	2026-11-19 02:38:42.864703+05:30	f	[]	[]
781	1	Q-M2-59B0D6C96F	2	Identify the correct networking concept or value: What is the purpose of a checksum?	{"To help detect errors in transmitted data","To allocate IP subnets","To assign hostnames","To select cable length"}	1	\N	1.00	2026-11-19 02:38:42.867892+05:30	f	[]	[]
782	1	Q-M2-F276B2A8C0	2	Which option correctly answers this question: What is the purpose of a VLAN?	{"To increase optical wavelength","To replace IP routing everywhere","To logically separate a switched network into broadcast domains","To compress Ethernet frames"}	3	\N	1.00	2026-11-19 02:38:42.871226+05:30	f	[]	[]
783	1	Q-M2-F26DC90E50	2	Select the best answer. What is the purpose of a checksum?	{"To allocate IP subnets","To select cable length","To help detect errors in transmitted data","To assign hostnames"}	3	\N	1.00	2026-11-19 02:38:42.878245+05:30	f	[]	[]
784	1	Q-M2-B81572C8C0	2	In a computer-networking context, Which access method is associated with collision avoidance in Wi-Fi?	{CRC,CSMA/CD,CSMA/CA,PPP}	3	\N	1.00	2026-11-19 02:38:42.881386+05:30	f	[]	[]
785	1	Q-M2-0D1BC7E656	2	Which option correctly answers this question: Which protocol is commonly used to carry VLAN tags on Ethernet links?	{HTTP/2,FTP,"IEEE 802.11","IEEE 802.1Q"}	4	\N	1.00	2026-11-19 02:38:42.884461+05:30	f	[]	[]
786	1	Q-M2-4A43A7C72F	2	Select the best answer. What is the main purpose of the data-link layer?	{"End-to-end application services","Name resolution","Choosing the best Internet route","Node-to-node delivery over a link"}	4	\N	1.00	2026-11-19 02:38:42.887506+05:30	f	[]	[]
787	1	Q-M2-4D32014D76	2	Scenario check: A learner is reviewing this networking point: The data-link layer transfers frames between directly connected nodes. Which answer is correct? What is the main purpose of the data-link layer?	{"Choosing the best Internet route","Node-to-node delivery over a link","End-to-end application services","Name resolution"}	2	\N	1.00	2026-11-19 02:38:42.890553+05:30	f	[]	[]
788	1	Q-M2-21C0980BFE	2	Choose the most accurate answer. Which access method is associated with collision avoidance in Wi-Fi?	{CSMA/CA,CSMA/CD,CRC,PPP}	1	\N	1.00	2026-11-19 02:38:42.893774+05:30	f	[]	[]
789	1	Q-M2-C424334949	2	Select the best answer. What is the purpose of a VLAN?	{"To logically separate a switched network into broadcast domains","To increase optical wavelength","To compress Ethernet frames","To replace IP routing everywhere"}	1	\N	1.00	2026-11-19 02:38:42.896825+05:30	f	[]	[]
790	1	Q-M2-BA2BB5352E	2	Scenario check: A learner is reviewing this networking point: Sequence numbers support reliable frame control. Which answer is correct? What is the purpose of a sequence number in ARQ?	{"To identify frames and help detect duplicates or ordering","To encode a domain name","To identify an application window","To measure cable resistance"}	1	\N	1.00	2026-11-19 02:38:42.900801+05:30	f	[]	[]
791	1	Q-M2-C1FB7F97EF	2	Choose the most accurate answer. Which protocol is a classic example of a sliding-window data-link protocol?	{SMTP,HTTP,HDLC,DNS}	3	\N	1.00	2026-11-19 02:38:42.904051+05:30	f	[]	[]
792	1	Q-M2-D4B59A1A79	2	Which option correctly answers this question: Which access method is associated with collision avoidance in Wi-Fi?	{CSMA/CD,CRC,PPP,CSMA/CA}	4	\N	1.00	2026-11-19 02:38:42.907323+05:30	f	[]	[]
793	1	Q-M2-F8AAC47DBF	2	Scenario check: A learner is reviewing this networking point: A Layer-2 broadcast is flooded within its broadcast domain. Which answer is correct? What is a broadcast frame delivered to?	{"Only the default gateway","A single named application","All devices in the local broadcast domain","Only the original sender"}	3	\N	1.00	2026-11-19 02:38:42.911033+05:30	f	[]	[]
794	1	Q-M2-C98D3BC42E	2	Select the best answer. What is a broadcast frame delivered to?	{"All devices in the local broadcast domain","Only the original sender","Only the default gateway","A single named application"}	1	\N	1.00	2026-11-19 02:38:42.914054+05:30	f	[]	[]
795	1	Q-M2-2E51298D17	2	Identify the correct networking concept or value: Which access method is associated with collision avoidance in Wi-Fi?	{CRC,CSMA/CD,CSMA/CA,PPP}	3	\N	1.00	2026-11-19 02:38:42.917156+05:30	f	[]	[]
796	1	Q-M2-C0F8CF0614	2	Select the best answer. Which protocol is a classic example of a sliding-window data-link protocol?	{HTTP,DNS,SMTP,HDLC}	4	\N	1.00	2026-11-19 02:38:42.92008+05:30	f	[]	[]
797	1	Q-M2-31B3ACC322	2	In a computer-networking context, How long is a standard Ethernet MAC address?	{"32 bits","128 bits","48 bits","16 bits"}	3	\N	1.00	2026-11-19 02:38:42.923369+05:30	f	[]	[]
798	1	Q-M2-596A8907B0	2	Identify the correct networking concept or value: Which protocol provides point-to-point framing and link configuration?	{ICMP,DNS,BGP,PPP}	4	\N	1.00	2026-11-19 02:38:42.926199+05:30	f	[]	[]
800	1	Q-M2-AB255621ED	2	Scenario check: A learner is reviewing this networking point: Cyclic Redundancy Check uses polynomial division for error detection. Which answer is correct? Which technique detects errors using a polynomial code?	{NAT,CRC,ARP,"Parity-free routing"}	2	\N	1.00	2026-11-19 02:38:42.932433+05:30	f	[]	[]
801	1	Q-M2-1BE61A958C	2	Choose the most accurate answer. Which access method listens to the channel before transmitting and detects collisions?	{CSMA/CD,"Token passing only",CSMA/CA,"Round-robin DNS"}	1	\N	1.00	2026-11-19 02:38:42.936713+05:30	f	[]	[]
802	1	Q-M2-2806C40C99	2	Identify the correct networking concept or value: What does Stop-and-Wait ARQ do after sending a frame?	{"Waits for an acknowledgement before sending the next frame","Sends all frames without tracking","Broadcasts every frame continuously","Changes the destination MAC address"}	1	\N	1.00	2026-11-19 02:38:42.94021+05:30	f	[]	[]
803	1	Q-M2-F68C169980	2	Choose the most accurate answer. Which technique detects errors using a polynomial code?	{CRC,"Parity-free routing",NAT,ARP}	1	\N	1.00	2026-11-19 02:38:42.943487+05:30	f	[]	[]
804	1	Q-M2-E226AA7313	2	Identify the correct networking concept or value: What is the minimum Ethernet frame size, excluding preamble and SFD?	{"32 bytes","1500 bytes","64 bytes","46 bytes"}	3	\N	1.00	2026-11-19 02:38:42.946418+05:30	f	[]	[]
805	1	Q-M2-A0B6294A68	2	Select the best answer. How long is a standard Ethernet MAC address?	{"32 bits","128 bits","16 bits","48 bits"}	4	\N	1.00	2026-11-19 02:38:42.949433+05:30	f	[]	[]
806	1	Q-M2-1ABB59F964	2	In a computer-networking context, Which technique detects errors using a polynomial code?	{ARP,CRC,NAT,"Parity-free routing"}	2	\N	1.00	2026-11-19 02:38:42.951628+05:30	f	[]	[]
807	1	Q-M2-D393210254	2	Scenario check: A learner is reviewing this networking point: A MAC address identifies a network interface on a local link. Which answer is correct? Which address is used for delivery within a local Ethernet network?	{"Port number",URL,"Process ID","MAC address"}	4	\N	1.00	2026-11-19 02:38:42.954389+05:30	f	[]	[]
808	1	Q-M2-43455E41C3	2	In a computer-networking context, What is the main purpose of the data-link layer?	{"Name resolution","End-to-end application services","Choosing the best Internet route","Node-to-node delivery over a link"}	4	\N	1.00	2026-11-19 02:38:42.957418+05:30	f	[]	[]
809	1	Q-M2-ED5CAA4D74	2	Which option correctly answers this question: What does a switch learn to build its forwarding table?	{"Source MAC addresses and the ports on which they arrive","TCP window sizes","IP time-to-live values","DNS names and web paths"}	1	\N	1.00	2026-11-19 02:38:42.960775+05:30	f	[]	[]
810	1	Q-M2-4CECB4D4D1	2	In a computer-networking context, What is the purpose of a VLAN?	{"To compress Ethernet frames","To replace IP routing everywhere","To increase optical wavelength","To logically separate a switched network into broadcast domains"}	4	\N	1.00	2026-11-19 02:38:42.963875+05:30	f	[]	[]
811	1	Q-M3-D51019703B	3	Which option correctly answers this question: Which routing protocol is a link-state protocol?	{ARP,OSPF,RIP,NAT}	2	\N	1.00	2026-11-19 02:38:42.967375+05:30	f	[]	[]
812	1	Q-M3-2F659E2FE9	3	In a computer-networking context, Which command commonly tests reachability using ICMP Echo?	{whoami,ping,format,mkdir}	2	\N	1.00	2026-11-19 02:38:42.97058+05:30	f	[]	[]
813	1	Q-M3-8C18840E43	3	Select the best answer. Which protocol maps an IPv4 address to a local-link MAC address?	{ARP,HTTP,DNS,DHCP}	1	\N	1.00	2026-11-19 02:38:42.97352+05:30	f	[]	[]
814	1	Q-M3-D2F067546E	3	In a computer-networking context, What is the purpose of traceroute or tracert?	{"To encrypt a file","To reveal hops along a path toward a destination","To assign a MAC address","To compress a packet"}	2	\N	1.00	2026-11-19 02:38:42.977812+05:30	f	[]	[]
815	1	Q-M3-043BF26593	3	Scenario check: A learner is reviewing this networking point: An IPv4 subnet mask is commonly written as four decimal octets. Which answer is correct? Which notation is commonly used for IPv4 subnet masks?	{"Base-64 notation","URL encoding","Dotted-decimal notation","Colon-separated hexadecimal only"}	3	\N	1.00	2026-11-19 02:38:42.980494+05:30	f	[]	[]
816	1	Q-M3-41142DD100	3	Select the best answer. Which command commonly tests reachability using ICMP Echo?	{format,mkdir,ping,whoami}	3	\N	1.00	2026-11-19 02:38:42.984338+05:30	f	[]	[]
817	1	Q-M3-C5CF719B9B	3	Which option correctly answers this question: What is fragmentation in IPv4?	{"Combining MAC addresses","Resolving a hostname","Encrypting an IP header","Dividing a packet into smaller pieces to fit a link MTU"}	4	\N	1.00	2026-11-19 02:38:42.987682+05:30	f	[]	[]
818	1	Q-M3-BDEA92FB3A	3	Choose the most accurate answer. How many bits are in an IPv4 address?	{"48 bits","16 bits","32 bits","128 bits"}	3	\N	1.00	2026-11-19 02:38:42.991025+05:30	f	[]	[]
819	1	Q-M3-9BC0737C24	3	Scenario check: A learner is reviewing this networking point: IPv6 addresses contain 128 bits. Which answer is correct? How many bits are in an IPv6 address?	{"48 bits","64 bits","128 bits","32 bits"}	3	\N	1.00	2026-11-19 02:38:42.994119+05:30	f	[]	[]
820	1	Q-M3-88A9E073B1	3	Which option correctly answers this question: What is the purpose of DHCP?	{"Automatically providing network configuration to hosts","Detecting Ethernet collisions","Transferring web pages","Encrypting DNS queries"}	1	\N	1.00	2026-11-19 02:38:42.997091+05:30	f	[]	[]
821	1	Q-M3-8A14522789	3	Which option correctly answers this question: How many bits are in an IPv6 address?	{"64 bits","48 bits","128 bits","32 bits"}	3	\N	1.00	2026-11-19 02:38:42.999955+05:30	f	[]	[]
822	1	Q-M3-98286671CF	3	Identify the correct networking concept or value: Which protocol maps an IPv4 address to a local-link MAC address?	{DHCP,ARP,DNS,HTTP}	2	\N	1.00	2026-11-19 02:38:43.00362+05:30	f	[]	[]
823	1	Q-M3-D6CA45F599	3	Scenario check: A learner is reviewing this networking point: 127.0.0.1 refers to the local host. Which answer is correct? What is the IPv4 loopback address commonly used for testing?	{169.254.1.1,192.168.1.1,127.0.0.1,255.255.255.0}	3	\N	1.00	2026-11-19 02:38:43.005983+05:30	f	[]	[]
824	1	Q-M3-B03073372F	3	Identify the correct networking concept or value: Which protocol reports network-layer errors and diagnostic messages?	{FTP,POP3,SMTP,ICMP}	4	\N	1.00	2026-11-19 02:38:43.009177+05:30	f	[]	[]
826	1	Q-M3-30A0C8CF76	3	In a computer-networking context, What is the purpose of a default gateway?	{"To store browser bookmarks","To assign MAC addresses to switches","To forward traffic destined for other networks","To convert domain names into email"}	3	\N	1.00	2026-11-19 02:38:43.016457+05:30	f	[]	[]
827	1	Q-M3-D429D49A75	3	In a computer-networking context, Which routing protocol is commonly used between autonomous systems on the Internet?	{BGP,ARP,DHCP,"RIP only"}	1	\N	1.00	2026-11-19 02:38:43.020105+05:30	f	[]	[]
828	1	Q-M3-F7901DF5B2	3	Select the best answer. How many bits are in an IPv4 address?	{"128 bits","32 bits","48 bits","16 bits"}	2	\N	1.00	2026-11-19 02:38:43.023363+05:30	f	[]	[]
829	1	Q-M3-C437BB5EB0	3	Select the best answer. Which notation is commonly used for IPv4 subnet masks?	{"Colon-separated hexadecimal only","Dotted-decimal notation","Base-64 notation","URL encoding"}	2	\N	1.00	2026-11-19 02:38:43.026898+05:30	f	[]	[]
830	1	Q-M3-2E10D97B18	3	Identify the correct networking concept or value: Which notation is commonly used for IPv4 subnet masks?	{"URL encoding","Dotted-decimal notation","Base-64 notation","Colon-separated hexadecimal only"}	2	\N	1.00	2026-11-19 02:38:43.029794+05:30	f	[]	[]
831	1	Q-M3-CEEFA9FCC6	3	Select the best answer. Which routing protocol is a link-state protocol?	{ARP,OSPF,RIP,NAT}	2	\N	1.00	2026-11-19 02:38:43.032838+05:30	f	[]	[]
832	1	Q-M3-017576B852	3	Scenario check: A learner is reviewing this networking point: IPv4 fragmentation can split a packet when required by link constraints. Which answer is correct? What is fragmentation in IPv4?	{"Resolving a hostname","Encrypting an IP header","Combining MAC addresses","Dividing a packet into smaller pieces to fit a link MTU"}	4	\N	1.00	2026-11-19 02:38:43.035991+05:30	f	[]	[]
833	1	Q-M3-7F3EB95B2D	3	Which option correctly answers this question: Which command commonly tests reachability using ICMP Echo?	{whoami,ping,format,mkdir}	2	\N	1.00	2026-11-19 02:38:43.039603+05:30	f	[]	[]
834	1	Q-M3-46827B1B61	3	Which option correctly answers this question: How many bits are in an IPv4 address?	{"48 bits","32 bits","128 bits","16 bits"}	2	\N	1.00	2026-11-19 02:38:43.042989+05:30	f	[]	[]
835	1	Q-M3-D6BC678C44	3	Which option correctly answers this question: Which IPv4 address represents the limited broadcast address?	{224.0.0.1,0.0.0.0,127.0.0.1,255.255.255.255}	4	\N	1.00	2026-11-19 02:38:43.046009+05:30	f	[]	[]
836	1	Q-M3-8D829CACA9	3	Select the best answer. What does a subnet mask identify?	{"The TCP application port","The network and host portions of an IPv4 address","The physical cable type","The DNS server's hostname"}	2	\N	1.00	2026-11-19 02:38:43.049064+05:30	f	[]	[]
837	1	Q-M3-A10DD48785	3	Select the best answer. Which protocol reports network-layer errors and diagnostic messages?	{ICMP,FTP,SMTP,POP3}	1	\N	1.00	2026-11-19 02:38:43.051913+05:30	f	[]	[]
838	1	Q-M3-954BD8BC69	3	Select the best answer. How many bits are in an IPv6 address?	{"128 bits","48 bits","32 bits","64 bits"}	1	\N	1.00	2026-11-19 02:38:43.055+05:30	f	[]	[]
839	1	Q-M3-95B88C76B7	3	Which option correctly answers this question: What is the purpose of a default gateway?	{"To forward traffic destined for other networks","To assign MAC addresses to switches","To store browser bookmarks","To convert domain names into email"}	1	\N	1.00	2026-11-19 02:38:43.058011+05:30	f	[]	[]
840	1	Q-M3-94636F6CB8	3	Which option correctly answers this question: Which routing protocol uses hop count as its main metric?	{OSPF,RIP,Ethernet,BGP}	2	\N	1.00	2026-11-19 02:38:43.061127+05:30	f	[]	[]
841	1	Q-M3-DF417F89BE	3	Choose the most accurate answer. Which address range is private in IPv4?	{203.0.113.0/24,8.8.8.0/24,1.1.1.0/24,192.168.0.0/16}	4	\N	1.00	2026-11-19 02:38:43.064002+05:30	f	[]	[]
842	1	Q-M3-9E75F1A21E	3	Choose the most accurate answer. Which protocol provides logical addressing at the Internet layer?	{IP,SMTP,Ethernet,FTP}	1	\N	1.00	2026-11-19 02:38:43.067838+05:30	f	[]	[]
843	1	Q-M3-521342E517	3	Scenario check: A learner is reviewing this networking point: Routers decrement TTL to prevent packets circulating indefinitely. Which answer is correct? What does TTL in an IPv4 packet limit?	{"The number of DNS labels","The number of TCP ports","The size of a MAC address","The packet's lifetime in hops"}	4	\N	1.00	2026-11-19 02:38:43.071016+05:30	f	[]	[]
844	1	Q-M3-D6DAFC0DD9	3	Identify the correct networking concept or value: What does a subnet mask identify?	{"The network and host portions of an IPv4 address","The TCP application port","The physical cable type","The DNS server's hostname"}	1	\N	1.00	2026-11-19 02:38:43.074223+05:30	f	[]	[]
845	1	Q-M3-28A7EB0FA5	3	In a computer-networking context, What does TTL in an IPv4 packet limit?	{"The number of TCP ports","The size of a MAC address","The packet's lifetime in hops","The number of DNS labels"}	3	\N	1.00	2026-11-19 02:38:43.077612+05:30	f	[]	[]
846	1	Q-M3-B7B9941B03	3	Scenario check: A learner is reviewing this networking point: ICMP carries control and diagnostic messages such as echo requests. Which answer is correct? Which protocol reports network-layer errors and diagnostic messages?	{ICMP,FTP,SMTP,POP3}	1	\N	1.00	2026-11-19 02:38:43.080804+05:30	f	[]	[]
847	1	Q-M3-C259A8B187	3	Which option correctly answers this question: Which notation is commonly used for IPv4 subnet masks?	{"Base-64 notation","Dotted-decimal notation","URL encoding","Colon-separated hexadecimal only"}	2	\N	1.00	2026-11-19 02:38:43.083871+05:30	f	[]	[]
848	1	Q-M3-82F4055C29	3	Scenario check: A learner is reviewing this networking point: Internet Protocol provides logical addresses for packet delivery. Which answer is correct? Which protocol provides logical addressing at the Internet layer?	{FTP,Ethernet,IP,SMTP}	3	\N	1.00	2026-11-19 02:38:43.087138+05:30	f	[]	[]
849	1	Q-M3-997190F803	3	Scenario check: A learner is reviewing this networking point: The mask distinguishes network bits from host bits. Which answer is correct? What does a subnet mask identify?	{"The DNS server's hostname","The physical cable type","The TCP application port","The network and host portions of an IPv4 address"}	4	\N	1.00	2026-11-19 02:38:43.09003+05:30	f	[]	[]
876	1	Q-M3-8B2B03BA9E	3	Which option correctly answers this question: Which protocol reports network-layer errors and diagnostic messages?	{ICMP,FTP,POP3,SMTP}	1	\N	1.00	2026-11-19 02:38:43.177233+05:30	f	[]	[]
850	1	Q-M3-4711E74302	3	Scenario check: A learner is reviewing this networking point: Address Resolution Protocol discovers a link-layer address for an IPv4 neighbor. Which answer is correct? Which protocol maps an IPv4 address to a local-link MAC address?	{ARP,DNS,HTTP,DHCP}	1	\N	1.00	2026-11-19 02:38:43.093271+05:30	f	[]	[]
851	1	Q-M3-5EBBACC795	3	Identify the correct networking concept or value: Which protocol provides logical addressing at the Internet layer?	{IP,SMTP,FTP,Ethernet}	1	\N	1.00	2026-11-19 02:38:43.096673+05:30	f	[]	[]
852	1	Q-M3-17EF5D3136	3	Identify the correct networking concept or value: Which IPv4 address represents the limited broadcast address?	{224.0.0.1,0.0.0.0,127.0.0.1,255.255.255.255}	4	\N	1.00	2026-11-19 02:38:43.099955+05:30	f	[]	[]
853	1	Q-M3-FE2F156B1E	3	In a computer-networking context, Which address range is private in IPv4?	{1.1.1.0/24,8.8.8.0/24,192.168.0.0/16,203.0.113.0/24}	3	\N	1.00	2026-11-19 02:38:43.103567+05:30	f	[]	[]
854	1	Q-M3-BF1C47D0A1	3	Select the best answer. Which address range is private in IPv4?	{192.168.0.0/16,1.1.1.0/24,203.0.113.0/24,8.8.8.0/24}	1	\N	1.00	2026-11-19 02:38:43.106544+05:30	f	[]	[]
855	1	Q-M3-7ABCDC9F08	3	Which option correctly answers this question: Which protocol maps an IPv4 address to a local-link MAC address?	{ARP,DNS,HTTP,DHCP}	1	\N	1.00	2026-11-19 02:38:43.109692+05:30	f	[]	[]
856	1	Q-M3-6A5643D1FC	3	Choose the most accurate answer. Which protocol maps an IPv4 address to a local-link MAC address?	{DNS,ARP,DHCP,HTTP}	2	\N	1.00	2026-11-19 02:38:43.112425+05:30	f	[]	[]
857	1	Q-M3-0DC1D5D6E5	3	Which option correctly answers this question: Which protocol provides logical addressing at the Internet layer?	{SMTP,Ethernet,IP,FTP}	3	\N	1.00	2026-11-19 02:38:43.115237+05:30	f	[]	[]
858	1	Q-M3-90FE95FBB9	3	In a computer-networking context, Which protocol provides logical addressing at the Internet layer?	{Ethernet,IP,SMTP,FTP}	2	\N	1.00	2026-11-19 02:38:43.118448+05:30	f	[]	[]
859	1	Q-M3-C0C91F25E9	3	In a computer-networking context, Which routing protocol uses hop count as its main metric?	{OSPF,Ethernet,RIP,BGP}	3	\N	1.00	2026-11-19 02:38:43.121946+05:30	f	[]	[]
860	1	Q-M3-FE9777505A	3	Identify the correct networking concept or value: What is the purpose of a default gateway?	{"To forward traffic destined for other networks","To store browser bookmarks","To assign MAC addresses to switches","To convert domain names into email"}	1	\N	1.00	2026-11-19 02:38:43.125218+05:30	f	[]	[]
861	1	Q-M3-A9FA251CEC	3	Choose the most accurate answer. Which notation is commonly used for IPv4 subnet masks?	{"URL encoding","Colon-separated hexadecimal only","Base-64 notation","Dotted-decimal notation"}	4	\N	1.00	2026-11-19 02:38:43.128481+05:30	f	[]	[]
862	1	Q-M3-DF7821206B	3	In a computer-networking context, How many bits are in an IPv6 address?	{"128 bits","32 bits","64 bits","48 bits"}	1	\N	1.00	2026-11-19 02:38:43.131153+05:30	f	[]	[]
863	1	Q-M3-FEE5B3B4E8	3	Which option correctly answers this question: What does a subnet mask identify?	{"The physical cable type","The network and host portions of an IPv4 address","The TCP application port","The DNS server's hostname"}	2	\N	1.00	2026-11-19 02:38:43.134088+05:30	f	[]	[]
864	1	Q-M3-7781448C91	3	Choose the most accurate answer. What does TTL in an IPv4 packet limit?	{"The number of DNS labels","The packet's lifetime in hops","The number of TCP ports","The size of a MAC address"}	2	\N	1.00	2026-11-19 02:38:43.137115+05:30	f	[]	[]
865	1	Q-M3-0D6022F43E	3	Choose the most accurate answer. What is the purpose of DHCP?	{"Automatically providing network configuration to hosts","Detecting Ethernet collisions","Transferring web pages","Encrypting DNS queries"}	1	\N	1.00	2026-11-19 02:38:43.141337+05:30	f	[]	[]
866	1	Q-M3-379A189EFB	3	In a computer-networking context, What is fragmentation in IPv4?	{"Combining MAC addresses","Encrypting an IP header","Resolving a hostname","Dividing a packet into smaller pieces to fit a link MTU"}	4	\N	1.00	2026-11-19 02:38:43.144764+05:30	f	[]	[]
867	1	Q-M3-BF0D28B676	3	In a computer-networking context, How many bits are in an IPv4 address?	{"32 bits","48 bits","128 bits","16 bits"}	1	\N	1.00	2026-11-19 02:38:43.147726+05:30	f	[]	[]
868	1	Q-M3-83D9D50F50	3	In a computer-networking context, Which routing protocol is a link-state protocol?	{OSPF,NAT,ARP,RIP}	1	\N	1.00	2026-11-19 02:38:43.151139+05:30	f	[]	[]
869	1	Q-M3-103B9754D5	3	In a computer-networking context, Which protocol reports network-layer errors and diagnostic messages?	{SMTP,ICMP,POP3,FTP}	2	\N	1.00	2026-11-19 02:38:43.15411+05:30	f	[]	[]
870	1	Q-M3-E52A83C491	3	Scenario check: A learner is reviewing this networking point: It uses TTL or hop-limit behaviour to identify routers along a path. Which answer is correct? What is the purpose of traceroute or tracert?	{"To compress a packet","To assign a MAC address","To encrypt a file","To reveal hops along a path toward a destination"}	4	\N	1.00	2026-11-19 02:38:43.157276+05:30	f	[]	[]
871	1	Q-M3-58B268EE15	3	Scenario check: A learner is reviewing this networking point: OSPF distributes link-state information and computes shortest paths. Which answer is correct? Which routing protocol is a link-state protocol?	{ARP,RIP,NAT,OSPF}	4	\N	1.00	2026-11-19 02:38:43.160859+05:30	f	[]	[]
872	1	Q-M3-714847E82D	3	Scenario check: A learner is reviewing this networking point: 192.168.0.0/16 is one of the private IPv4 ranges. Which answer is correct? Which address range is private in IPv4?	{1.1.1.0/24,8.8.8.0/24,203.0.113.0/24,192.168.0.0/16}	4	\N	1.00	2026-11-19 02:38:43.16364+05:30	f	[]	[]
873	1	Q-M3-765D8A2A8E	3	Choose the most accurate answer. Which command commonly tests reachability using ICMP Echo?	{ping,whoami,mkdir,format}	1	\N	1.00	2026-11-19 02:38:43.166796+05:30	f	[]	[]
874	1	Q-M3-FB09C365BE	3	Choose the most accurate answer. Which routing protocol is commonly used between autonomous systems on the Internet?	{BGP,"RIP only",ARP,DHCP}	1	\N	1.00	2026-11-19 02:38:43.170382+05:30	f	[]	[]
875	1	Q-M3-36AA4A74B6	3	Choose the most accurate answer. What is fragmentation in IPv4?	{"Dividing a packet into smaller pieces to fit a link MTU","Encrypting an IP header","Resolving a hostname","Combining MAC addresses"}	1	\N	1.00	2026-11-19 02:38:43.17349+05:30	f	[]	[]
877	1	Q-M3-75FF992F1B	3	Choose the most accurate answer. What is the IPv4 loopback address commonly used for testing?	{192.168.1.1,169.254.1.1,255.255.255.0,127.0.0.1}	4	\N	1.00	2026-11-19 02:38:43.179939+05:30	f	[]	[]
878	1	Q-M3-D20294B724	3	Select the best answer. What does NAT commonly translate?	{"Private and public IP address information","MAC addresses into usernames","Fibre signals into radio waves","HTTP methods into DNS records"}	1	\N	1.00	2026-11-19 02:38:43.183128+05:30	f	[]	[]
879	1	Q-M3-DFE6741C3F	3	Which option correctly answers this question: What is the IPv4 loopback address commonly used for testing?	{255.255.255.0,127.0.0.1,192.168.1.1,169.254.1.1}	2	\N	1.00	2026-11-19 02:38:43.18647+05:30	f	[]	[]
880	1	Q-M3-E147944C92	3	Choose the most accurate answer. Which protocol reports network-layer errors and diagnostic messages?	{ICMP,SMTP,POP3,FTP}	1	\N	1.00	2026-11-19 02:38:43.189613+05:30	f	[]	[]
881	1	Q-M3-BFD5B45EAE	3	Identify the correct networking concept or value: What does NAT commonly translate?	{"MAC addresses into usernames","HTTP methods into DNS records","Fibre signals into radio waves","Private and public IP address information"}	4	\N	1.00	2026-11-19 02:38:43.192904+05:30	f	[]	[]
882	1	Q-M3-B5388FEA78	3	Choose the most accurate answer. Which routing protocol uses hop count as its main metric?	{BGP,OSPF,Ethernet,RIP}	4	\N	1.00	2026-11-19 02:38:43.196133+05:30	f	[]	[]
883	1	Q-M3-57278CA186	3	Choose the most accurate answer. What is the purpose of a default gateway?	{"To store browser bookmarks","To assign MAC addresses to switches","To forward traffic destined for other networks","To convert domain names into email"}	3	\N	1.00	2026-11-19 02:38:43.199272+05:30	f	[]	[]
884	1	Q-M3-2705DAF552	3	Select the best answer. What does TTL in an IPv4 packet limit?	{"The number of DNS labels","The size of a MAC address","The packet's lifetime in hops","The number of TCP ports"}	3	\N	1.00	2026-11-19 02:38:43.204451+05:30	f	[]	[]
885	1	Q-M3-FAD673C20F	3	Identify the correct networking concept or value: What is fragmentation in IPv4?	{"Combining MAC addresses","Resolving a hostname","Dividing a packet into smaller pieces to fit a link MTU","Encrypting an IP header"}	3	\N	1.00	2026-11-19 02:38:43.207565+05:30	f	[]	[]
886	1	Q-M3-65AA96B327	3	Scenario check: A learner is reviewing this networking point: Hosts send off-subnet traffic to their default router. Which answer is correct? What is the purpose of a default gateway?	{"To store browser bookmarks","To assign MAC addresses to switches","To convert domain names into email","To forward traffic destined for other networks"}	4	\N	1.00	2026-11-19 02:38:43.211036+05:30	f	[]	[]
887	1	Q-M3-51505FC730	3	In a computer-networking context, What does NAT commonly translate?	{"HTTP methods into DNS records","Private and public IP address information","MAC addresses into usernames","Fibre signals into radio waves"}	2	\N	1.00	2026-11-19 02:38:43.213613+05:30	f	[]	[]
888	1	Q-M3-577C9E9096	3	Select the best answer. What is the purpose of traceroute or tracert?	{"To assign a MAC address","To compress a packet","To reveal hops along a path toward a destination","To encrypt a file"}	3	\N	1.00	2026-11-19 02:38:43.216588+05:30	f	[]	[]
889	1	Q-M3-D31648C7A0	3	Identify the correct networking concept or value: Which routing protocol is commonly used between autonomous systems on the Internet?	{ARP,DHCP,BGP,"RIP only"}	3	\N	1.00	2026-11-19 02:38:43.219759+05:30	f	[]	[]
890	1	Q-M3-8BE6405B53	3	In a computer-networking context, What does a subnet mask identify?	{"The network and host portions of an IPv4 address","The DNS server's hostname","The physical cable type","The TCP application port"}	1	\N	1.00	2026-11-19 02:38:43.223016+05:30	f	[]	[]
891	1	Q-M3-A33FEBC583	3	In a computer-networking context, What is the purpose of DHCP?	{"Automatically providing network configuration to hosts","Encrypting DNS queries","Transferring web pages","Detecting Ethernet collisions"}	1	\N	1.00	2026-11-19 02:38:43.226357+05:30	f	[]	[]
892	1	Q-M3-7DFE15D60A	3	Select the best answer. What is the purpose of DHCP?	{"Encrypting DNS queries","Transferring web pages","Automatically providing network configuration to hosts","Detecting Ethernet collisions"}	3	\N	1.00	2026-11-19 02:38:43.229956+05:30	f	[]	[]
893	1	Q-M3-66CD35D639	3	In a computer-networking context, Which IPv4 address represents the limited broadcast address?	{0.0.0.0,255.255.255.255,224.0.0.1,127.0.0.1}	2	\N	1.00	2026-11-19 02:38:43.232697+05:30	f	[]	[]
894	1	Q-M3-C23576161C	3	Scenario check: A learner is reviewing this networking point: Network Address Translation modifies address information across network boundaries. Which answer is correct? What does NAT commonly translate?	{"MAC addresses into usernames","Fibre signals into radio waves","HTTP methods into DNS records","Private and public IP address information"}	4	\N	1.00	2026-11-19 02:38:43.236066+05:30	f	[]	[]
895	1	Q-M3-F2E676DF9F	3	Identify the correct networking concept or value: What does TTL in an IPv4 packet limit?	{"The size of a MAC address","The packet's lifetime in hops","The number of DNS labels","The number of TCP ports"}	2	\N	1.00	2026-11-19 02:38:43.239009+05:30	f	[]	[]
896	1	Q-M3-BC31A16F73	3	Identify the correct networking concept or value: Which address range is private in IPv4?	{192.168.0.0/16,203.0.113.0/24,8.8.8.0/24,1.1.1.0/24}	1	\N	1.00	2026-11-19 02:38:43.242049+05:30	f	[]	[]
897	1	Q-M3-86EB75B41D	3	Scenario check: A learner is reviewing this networking point: Border Gateway Protocol exchanges reachability between autonomous systems. Which answer is correct? Which routing protocol is commonly used between autonomous systems on the Internet?	{DHCP,ARP,BGP,"RIP only"}	3	\N	1.00	2026-11-19 02:38:43.245594+05:30	f	[]	[]
898	1	Q-M3-33F41FD555	3	Scenario check: A learner is reviewing this networking point: RIP selects routes using hop count. Which answer is correct? Which routing protocol uses hop count as its main metric?	{OSPF,Ethernet,BGP,RIP}	4	\N	1.00	2026-11-19 02:38:43.24853+05:30	f	[]	[]
899	1	Q-M3-6DBDA37B7D	3	Identify the correct networking concept or value: How many bits are in an IPv6 address?	{"48 bits","64 bits","32 bits","128 bits"}	4	\N	1.00	2026-11-19 02:38:43.252307+05:30	f	[]	[]
900	1	Q-M3-5BB6E74ED1	3	Which option correctly answers this question: Which address range is private in IPv4?	{8.8.8.0/24,203.0.113.0/24,192.168.0.0/16,1.1.1.0/24}	3	\N	1.00	2026-11-19 02:38:43.255486+05:30	f	[]	[]
901	1	Q-M3-EF26F19161	3	Which option correctly answers this question: What does NAT commonly translate?	{"Private and public IP address information","HTTP methods into DNS records","MAC addresses into usernames","Fibre signals into radio waves"}	1	\N	1.00	2026-11-19 02:38:43.258478+05:30	f	[]	[]
902	1	Q-M3-D5E7D569D2	3	Choose the most accurate answer. What is the purpose of traceroute or tracert?	{"To reveal hops along a path toward a destination","To assign a MAC address","To compress a packet","To encrypt a file"}	1	\N	1.00	2026-11-19 02:38:43.262125+05:30	f	[]	[]
903	1	Q-M3-D0A050BB12	3	Select the best answer. What is the IPv4 loopback address commonly used for testing?	{169.254.1.1,192.168.1.1,127.0.0.1,255.255.255.0}	3	\N	1.00	2026-11-19 02:38:43.264772+05:30	f	[]	[]
904	1	Q-M3-A895CE7E0D	3	Scenario check: A learner is reviewing this networking point: IPv4 addresses contain 32 bits. Which answer is correct? How many bits are in an IPv4 address?	{"16 bits","128 bits","48 bits","32 bits"}	4	\N	1.00	2026-11-19 02:38:43.26769+05:30	f	[]	[]
905	1	Q-M3-F9AD79C2BE	3	Choose the most accurate answer. Which IPv4 address represents the limited broadcast address?	{255.255.255.255,224.0.0.1,127.0.0.1,0.0.0.0}	1	\N	1.00	2026-11-19 02:38:43.270813+05:30	f	[]	[]
906	1	Q-M3-2B9485DB53	3	Choose the most accurate answer. Which routing protocol is a link-state protocol?	{NAT,ARP,OSPF,RIP}	3	\N	1.00	2026-11-19 02:38:43.274055+05:30	f	[]	[]
907	1	Q-M3-9F355AA901	3	Identify the correct networking concept or value: What is the purpose of DHCP?	{"Transferring web pages","Automatically providing network configuration to hosts","Encrypting DNS queries","Detecting Ethernet collisions"}	2	\N	1.00	2026-11-19 02:38:43.277605+05:30	f	[]	[]
908	1	Q-M3-E98D6BA409	3	Scenario check: A learner is reviewing this networking point: DHCP can assign addresses, gateways and DNS settings. Which answer is correct? What is the purpose of DHCP?	{"Automatically providing network configuration to hosts","Transferring web pages","Encrypting DNS queries","Detecting Ethernet collisions"}	1	\N	1.00	2026-11-19 02:38:43.280652+05:30	f	[]	[]
909	1	Q-M3-EF0E0D1156	3	In a computer-networking context, What is the IPv4 loopback address commonly used for testing?	{192.168.1.1,169.254.1.1,255.255.255.0,127.0.0.1}	4	\N	1.00	2026-11-19 02:38:43.284134+05:30	f	[]	[]
910	1	Q-M3-EA79D9A400	3	Which option correctly answers this question: Which routing protocol is commonly used between autonomous systems on the Internet?	{"RIP only",DHCP,BGP,ARP}	3	\N	1.00	2026-11-19 02:38:43.286897+05:30	f	[]	[]
911	1	Q-M3-62BC9C3B8C	3	Scenario check: A learner is reviewing this networking point: The limited broadcast address is 255.255.255.255. Which answer is correct? Which IPv4 address represents the limited broadcast address?	{255.255.255.255,224.0.0.1,127.0.0.1,0.0.0.0}	1	\N	1.00	2026-11-19 02:38:43.289848+05:30	f	[]	[]
912	1	Q-M3-C88F9C8C3D	3	In a computer-networking context, Which protocol maps an IPv4 address to a local-link MAC address?	{DHCP,ARP,HTTP,DNS}	2	\N	1.00	2026-11-19 02:38:43.293045+05:30	f	[]	[]
913	1	Q-M3-66784BA780	3	In a computer-networking context, Which notation is commonly used for IPv4 subnet masks?	{"Base-64 notation","URL encoding","Dotted-decimal notation","Colon-separated hexadecimal only"}	3	\N	1.00	2026-11-19 02:38:43.29639+05:30	f	[]	[]
914	1	Q-M3-6E429A2CA3	3	Select the best answer. Which routing protocol is commonly used between autonomous systems on the Internet?	{"RIP only",ARP,DHCP,BGP}	4	\N	1.00	2026-11-19 02:38:43.299668+05:30	f	[]	[]
915	1	Q-M3-F1EBC84B0D	3	Identify the correct networking concept or value: What is the purpose of traceroute or tracert?	{"To reveal hops along a path toward a destination","To compress a packet","To encrypt a file","To assign a MAC address"}	1	\N	1.00	2026-11-19 02:38:43.303096+05:30	f	[]	[]
916	1	Q-M3-3318FC9E96	3	Scenario check: A learner is reviewing this networking point: Ping sends echo requests and reports responses. Which answer is correct? Which command commonly tests reachability using ICMP Echo?	{whoami,mkdir,format,ping}	4	\N	1.00	2026-11-19 02:38:43.306237+05:30	f	[]	[]
917	1	Q-M3-09C0D3371A	3	Identify the correct networking concept or value: How many bits are in an IPv4 address?	{"32 bits","128 bits","16 bits","48 bits"}	1	\N	1.00	2026-11-19 02:38:43.309722+05:30	f	[]	[]
918	1	Q-M3-D1360FE9ED	3	Identify the correct networking concept or value: Which command commonly tests reachability using ICMP Echo?	{format,mkdir,ping,whoami}	3	\N	1.00	2026-11-19 02:38:43.314115+05:30	f	[]	[]
919	1	Q-M3-D7AB688405	3	Which option correctly answers this question: What does TTL in an IPv4 packet limit?	{"The number of DNS labels","The size of a MAC address","The number of TCP ports","The packet's lifetime in hops"}	4	\N	1.00	2026-11-19 02:38:43.317287+05:30	f	[]	[]
920	1	Q-M3-FB0C293CA3	3	Which option correctly answers this question: What is the purpose of traceroute or tracert?	{"To compress a packet","To assign a MAC address","To reveal hops along a path toward a destination","To encrypt a file"}	3	\N	1.00	2026-11-19 02:38:43.320431+05:30	f	[]	[]
921	1	Q-M3-857ACCFA78	3	Select the best answer. What is the purpose of a default gateway?	{"To convert domain names into email","To assign MAC addresses to switches","To forward traffic destined for other networks","To store browser bookmarks"}	3	\N	1.00	2026-11-19 02:38:43.323557+05:30	f	[]	[]
922	1	Q-M3-446AD0BDC8	3	Identify the correct networking concept or value: Which routing protocol uses hop count as its main metric?	{OSPF,Ethernet,BGP,RIP}	4	\N	1.00	2026-11-19 02:38:43.326814+05:30	f	[]	[]
923	1	Q-M3-F8EA5B7F09	3	Select the best answer. Which IPv4 address represents the limited broadcast address?	{127.0.0.1,0.0.0.0,224.0.0.1,255.255.255.255}	4	\N	1.00	2026-11-19 02:38:43.330131+05:30	f	[]	[]
924	1	Q-M3-01AF57749E	3	Select the best answer. What is fragmentation in IPv4?	{"Resolving a hostname","Combining MAC addresses","Encrypting an IP header","Dividing a packet into smaller pieces to fit a link MTU"}	4	\N	1.00	2026-11-19 02:38:43.333357+05:30	f	[]	[]
925	1	Q-M3-3DA55E86E7	3	Choose the most accurate answer. What does a subnet mask identify?	{"The TCP application port","The physical cable type","The network and host portions of an IPv4 address","The DNS server's hostname"}	3	\N	1.00	2026-11-19 02:38:43.336971+05:30	f	[]	[]
927	1	Q-M3-B8293EE99A	3	Choose the most accurate answer. What does NAT commonly translate?	{"MAC addresses into usernames","Fibre signals into radio waves","Private and public IP address information","HTTP methods into DNS records"}	3	\N	1.00	2026-11-19 02:38:43.343389+05:30	f	[]	[]
928	1	Q-M3-240052BD9D	3	Select the best answer. Which routing protocol uses hop count as its main metric?	{OSPF,RIP,Ethernet,BGP}	2	\N	1.00	2026-11-19 02:38:43.346555+05:30	f	[]	[]
929	1	Q-M3-7A226BC6C3	3	Identify the correct networking concept or value: Which routing protocol is a link-state protocol?	{OSPF,NAT,ARP,RIP}	1	\N	1.00	2026-11-19 02:38:43.349235+05:30	f	[]	[]
930	1	Q-M3-3FF8BC2DF8	3	Identify the correct networking concept or value: What is the IPv4 loopback address commonly used for testing?	{169.254.1.1,192.168.1.1,127.0.0.1,255.255.255.0}	3	\N	1.00	2026-11-19 02:38:43.352547+05:30	f	[]	[]
931	1	Q-M4-9A4BBF5EC4	4	Choose the most accurate answer. What does multiplexing at the transport layer allow?	{"Multiple cables to become one fibre","DNS names to become IP headers","Multiple application conversations to share network services","Routers to share one MAC address"}	3	\N	1.00	2026-11-19 02:38:43.355637+05:30	f	[]	[]
932	1	Q-M4-D810238597	4	Which option correctly answers this question: What does a TCP acknowledgement number indicate?	{"The UDP checksum length","The next byte expected from the other side","The number of routers in the path","The sender's MAC address"}	2	\N	1.00	2026-11-19 02:38:43.358819+05:30	f	[]	[]
933	1	Q-M4-EC146951A6	4	Scenario check: A learner is reviewing this networking point: TCP sequence numbers support ordering and reliable delivery. Which answer is correct? What is the purpose of a TCP sequence number?	{"To identify byte positions in the data stream","To represent an IPv6 prefix","To identify a DNS zone","To select an Ethernet cable"}	1	\N	1.00	2026-11-19 02:38:43.36301+05:30	f	[]	[]
934	1	Q-M4-89470B8356	4	Which option correctly answers this question: Which transport protocol is commonly used for real-time voice or video when low delay is important?	{"TCP only",ARP,ICMP,UDP}	4	\N	1.00	2026-11-19 02:38:43.366883+05:30	f	[]	[]
935	1	Q-M4-99E2284ECB	4	Choose the most accurate answer. How many steps are in the standard TCP connection handshake?	{Two,Five,Three,One}	3	\N	1.00	2026-11-19 02:38:43.36982+05:30	f	[]	[]
936	1	Q-M4-A34C4E2313	4	Which option correctly answers this question: What is the purpose of a TCP sequence number?	{"To represent an IPv6 prefix","To identify a DNS zone","To identify byte positions in the data stream","To select an Ethernet cable"}	3	\N	1.00	2026-11-19 02:38:43.372805+05:30	f	[]	[]
937	1	Q-M4-3790D5A106	4	Scenario check: A learner is reviewing this networking point: UDP avoids connection setup and retransmission delays, though applications may add their own controls. Which answer is correct? Which transport protocol is commonly used for real-time voice or video when low delay is important?	{UDP,ARP,ICMP,"TCP only"}	1	\N	1.00	2026-11-19 02:38:43.376075+05:30	f	[]	[]
938	1	Q-M4-2321ED37F9	4	Scenario check: A learner is reviewing this networking point: Cumulative ACKs indicate the next expected byte. Which answer is correct? What does a TCP acknowledgement number indicate?	{"The UDP checksum length","The next byte expected from the other side","The sender's MAC address","The number of routers in the path"}	2	\N	1.00	2026-11-19 02:38:43.378951+05:30	f	[]	[]
939	1	Q-M4-445C90A88B	4	Identify the correct networking concept or value: Which port is the default for HTTPS?	{69,53,23,443}	4	\N	1.00	2026-11-19 02:38:43.381761+05:30	f	[]	[]
940	1	Q-M4-F7B9E00C24	4	Which option correctly answers this question: Which transport protocol is connectionless and has a small header?	{FTP,UDP,Ethernet,TCP}	2	\N	1.00	2026-11-19 02:38:43.384804+05:30	f	[]	[]
941	1	Q-M4-271D532E90	4	In a computer-networking context, What is congestion control designed to avoid?	{"Using port numbers","Creating Ethernet frames","Overloading the network with excessive traffic","Resolving IP addresses"}	3	\N	1.00	2026-11-19 02:38:43.387883+05:30	f	[]	[]
942	1	Q-M4-1E70BD2586	4	Scenario check: A learner is reviewing this networking point: ACK indicates that the acknowledgement field is valid. Which answer is correct? Which TCP flag commonly acknowledges received data?	{RST,ACK,FIN,URG}	2	\N	1.00	2026-11-19 02:38:43.394322+05:30	f	[]	[]
943	1	Q-M4-08CA05CC62	4	Select the best answer. What is the purpose of a TCP sequence number?	{"To identify byte positions in the data stream","To represent an IPv6 prefix","To identify a DNS zone","To select an Ethernet cable"}	1	\N	1.00	2026-11-19 02:38:43.396912+05:30	f	[]	[]
944	1	Q-M4-B474BA7753	4	In a computer-networking context, Which transport protocol provides a connection-oriented byte stream?	{IP,TCP,UDP,ARP}	2	\N	1.00	2026-11-19 02:38:43.400542+05:30	f	[]	[]
945	1	Q-M4-9C3C9E0289	4	Choose the most accurate answer. What is the purpose of the TCP receive window?	{"To specify the Wi-Fi channel","To select the DNS resolver","To set the IP address class","To advertise how much data the receiver can accept"}	4	\N	1.00	2026-11-19 02:38:43.403399+05:30	f	[]	[]
946	1	Q-M4-64E3A51790	4	Which option correctly answers this question: Which port is commonly used by SMTP for server-to-server mail transfer?	{22,67,25,161}	3	\N	1.00	2026-11-19 02:38:43.412067+05:30	f	[]	[]
947	1	Q-M4-1C8167E274	4	Choose the most accurate answer. Which TCP flag commonly acknowledges received data?	{URG,FIN,ACK,RST}	3	\N	1.00	2026-11-19 02:38:43.414742+05:30	f	[]	[]
948	1	Q-M4-1760DBCFF9	4	In a computer-networking context, What is the main difference between flow control and congestion control?	{"They are identical","Flow control routes; congestion control resolves names","Flow control encrypts; congestion control compresses","Flow control protects the receiver; congestion control protects the network"}	4	\N	1.00	2026-11-19 02:38:43.417809+05:30	f	[]	[]
949	1	Q-M4-1C1DF3DBC2	4	In a computer-networking context, What is a socket commonly defined by?	{"A URL and file extension","A VLAN ID and frame size","A MAC address and cable length","An IP address and a port number"}	4	\N	1.00	2026-11-19 02:38:43.421137+05:30	f	[]	[]
1001	1	Q-M4-8C17FA36CC	4	Choose the most accurate answer. Which port is the default for HTTP?	{80,21,25,110}	1	\N	1.00	2026-11-19 02:38:43.593264+05:30	f	[]	[]
950	1	Q-M4-27B4D2456F	4	Identify the correct networking concept or value: What is congestion control designed to avoid?	{"Using port numbers","Overloading the network with excessive traffic","Creating Ethernet frames","Resolving IP addresses"}	2	\N	1.00	2026-11-19 02:38:43.4242+05:30	f	[]	[]
951	1	Q-M4-46B5369F22	4	Which option correctly answers this question: What is a port number used to identify?	{"A router's geographic location","A physical switch socket only","An application process or service endpoint","A cable category"}	3	\N	1.00	2026-11-19 02:38:43.427577+05:30	f	[]	[]
952	1	Q-M4-A8C55C1639	4	Identify the correct networking concept or value: What is a port number used to identify?	{"A cable category","A router's geographic location","An application process or service endpoint","A physical switch socket only"}	3	\N	1.00	2026-11-19 02:38:43.430481+05:30	f	[]	[]
953	1	Q-M4-872F37D371	4	Which option correctly answers this question: How many steps are in the standard TCP connection handshake?	{Three,Five,Two,One}	1	\N	1.00	2026-11-19 02:38:43.433967+05:30	f	[]	[]
954	1	Q-M4-D26F577CE6	4	Identify the correct networking concept or value: What is the purpose of a TCP sequence number?	{"To represent an IPv6 prefix","To select an Ethernet cable","To identify a DNS zone","To identify byte positions in the data stream"}	4	\N	1.00	2026-11-19 02:38:43.437141+05:30	f	[]	[]
955	1	Q-M4-73369C612A	4	In a computer-networking context, Which TCP mechanism helps recover from lost segments?	{"Domain delegation",Retransmission,"VLAN tagging","MAC learning"}	2	\N	1.00	2026-11-19 02:38:43.440802+05:30	f	[]	[]
956	1	Q-M4-9639DBF5CB	4	In a computer-networking context, What is the purpose of the TCP receive window?	{"To specify the Wi-Fi channel","To set the IP address class","To select the DNS resolver","To advertise how much data the receiver can accept"}	4	\N	1.00	2026-11-19 02:38:43.443843+05:30	f	[]	[]
957	1	Q-M4-F4CF0A13A8	4	Scenario check: A learner is reviewing this networking point: HTTP traditionally uses TCP port 80. Which answer is correct? Which port is the default for HTTP?	{110,21,25,80}	4	\N	1.00	2026-11-19 02:38:43.44648+05:30	f	[]	[]
958	1	Q-M4-A776B6C5EA	4	In a computer-networking context, Which TCP flag is used to initiate a connection?	{RST,SYN,PSH,FIN}	2	\N	1.00	2026-11-19 02:38:43.449515+05:30	f	[]	[]
959	1	Q-M4-3E53BA9ACB	4	Choose the most accurate answer. Which transport protocol provides a connection-oriented byte stream?	{TCP,UDP,IP,ARP}	1	\N	1.00	2026-11-19 02:38:43.452956+05:30	f	[]	[]
960	1	Q-M4-311FD27293	4	Identify the correct networking concept or value: Which transport protocol is connectionless and has a small header?	{UDP,TCP,Ethernet,FTP}	1	\N	1.00	2026-11-19 02:38:43.456147+05:30	f	[]	[]
961	1	Q-M4-E0264EDEE9	4	Identify the correct networking concept or value: Which transport protocol is commonly used for real-time voice or video when low delay is important?	{"TCP only",ARP,ICMP,UDP}	4	\N	1.00	2026-11-19 02:38:43.459803+05:30	f	[]	[]
962	1	Q-M4-3909888B49	4	Scenario check: A learner is reviewing this networking point: UDP sends datagrams without establishing a connection. Which answer is correct? Which transport protocol is connectionless and has a small header?	{FTP,Ethernet,TCP,UDP}	4	\N	1.00	2026-11-19 02:38:43.462955+05:30	f	[]	[]
963	1	Q-M4-AE7803AB72	4	Which option correctly answers this question: What is the main difference between flow control and congestion control?	{"They are identical","Flow control encrypts; congestion control compresses","Flow control protects the receiver; congestion control protects the network","Flow control routes; congestion control resolves names"}	3	\N	1.00	2026-11-19 02:38:43.465647+05:30	f	[]	[]
964	1	Q-M4-72B81D53F7	4	Choose the most accurate answer. Which TCP flag is used to initiate a connection?	{SYN,RST,PSH,FIN}	1	\N	1.00	2026-11-19 02:38:43.468519+05:30	f	[]	[]
965	1	Q-M4-506D2284AE	4	In a computer-networking context, Which port is the default for HTTPS?	{23,53,69,443}	4	\N	1.00	2026-11-19 02:38:43.471484+05:30	f	[]	[]
966	1	Q-M4-9023347835	4	In a computer-networking context, What does multiplexing at the transport layer allow?	{"Multiple cables to become one fibre","Multiple application conversations to share network services","Routers to share one MAC address","DNS names to become IP headers"}	2	\N	1.00	2026-11-19 02:38:43.474286+05:30	f	[]	[]
967	1	Q-M4-DB1865413E	4	Identify the correct networking concept or value: What is the purpose of the TCP receive window?	{"To specify the Wi-Fi channel","To select the DNS resolver","To advertise how much data the receiver can accept","To set the IP address class"}	3	\N	1.00	2026-11-19 02:38:43.477217+05:30	f	[]	[]
968	1	Q-M4-8862D99AC8	4	Identify the correct networking concept or value: What is the main difference between flow control and congestion control?	{"They are identical","Flow control encrypts; congestion control compresses","Flow control protects the receiver; congestion control protects the network","Flow control routes; congestion control resolves names"}	3	\N	1.00	2026-11-19 02:38:43.480413+05:30	f	[]	[]
969	1	Q-M4-23EEABE9C6	4	Scenario check: A learner is reviewing this networking point: TCP typically establishes a connection using SYN, SYN-ACK and ACK. Which answer is correct? How many steps are in the standard TCP connection handshake?	{Two,One,Five,Three}	4	\N	1.00	2026-11-19 02:38:43.4843+05:30	f	[]	[]
970	1	Q-M4-AB8A752A5B	4	Which option correctly answers this question: Which transport protocol provides a connection-oriented byte stream?	{ARP,UDP,TCP,IP}	3	\N	1.00	2026-11-19 02:38:43.487493+05:30	f	[]	[]
971	1	Q-M4-686077B962	4	Identify the correct networking concept or value: What is the range of TCP/UDP port numbers?	{"0 to 4095","1 to 1024 only","0 to 255","0 to 65535"}	4	\N	1.00	2026-11-19 02:38:43.491664+05:30	f	[]	[]
972	1	Q-M4-D9F06B6012	4	Select the best answer. Which TCP flag is used to initiate a connection?	{PSH,FIN,SYN,RST}	3	\N	1.00	2026-11-19 02:38:43.494954+05:30	f	[]	[]
973	1	Q-M4-CD0FA0DD5F	4	Identify the correct networking concept or value: Which TCP flag is used to initiate a connection?	{FIN,RST,PSH,SYN}	4	\N	1.00	2026-11-19 02:38:43.497721+05:30	f	[]	[]
974	1	Q-M4-0425DBDF31	4	Select the best answer. Which port is commonly associated with DNS queries?	{143,3389,53,20}	3	\N	1.00	2026-11-19 02:38:43.503812+05:30	f	[]	[]
976	1	Q-M4-4B96441B3C	4	Scenario check: A learner is reviewing this networking point: Port numbers allow concurrent application flows. Which answer is correct? What does multiplexing at the transport layer allow?	{"DNS names to become IP headers","Routers to share one MAC address","Multiple cables to become one fibre","Multiple application conversations to share network services"}	4	\N	1.00	2026-11-19 02:38:43.50974+05:30	f	[]	[]
977	1	Q-M4-A08BDFB02A	4	Which option correctly answers this question: Which TCP flag commonly acknowledges received data?	{URG,ACK,FIN,RST}	2	\N	1.00	2026-11-19 02:38:43.512764+05:30	f	[]	[]
978	1	Q-M4-7A8B6C4829	4	Which option correctly answers this question: Which port is commonly associated with DNS queries?	{143,20,53,3389}	3	\N	1.00	2026-11-19 02:38:43.516126+05:30	f	[]	[]
979	1	Q-M4-E094308DB8	4	Choose the most accurate answer. Which port is the default for HTTPS?	{23,443,69,53}	2	\N	1.00	2026-11-19 02:38:43.519525+05:30	f	[]	[]
980	1	Q-M4-1919551480	4	Choose the most accurate answer. Which transport protocol is commonly used for real-time voice or video when low delay is important?	{ARP,ICMP,"TCP only",UDP}	4	\N	1.00	2026-11-19 02:38:43.52257+05:30	f	[]	[]
981	1	Q-M4-E2B15B9A55	4	Scenario check: A learner is reviewing this networking point: TCP provides reliable, ordered byte-stream delivery. Which answer is correct? Which transport protocol provides a connection-oriented byte stream?	{UDP,IP,ARP,TCP}	4	\N	1.00	2026-11-19 02:38:43.526273+05:30	f	[]	[]
982	1	Q-M4-F0DAD70990	4	Which option correctly answers this question: What is a socket commonly defined by?	{"A MAC address and cable length","A VLAN ID and frame size","An IP address and a port number","A URL and file extension"}	3	\N	1.00	2026-11-19 02:38:43.529244+05:30	f	[]	[]
983	1	Q-M4-C4D6BF164E	4	Select the best answer. Which TCP flag commonly acknowledges received data?	{ACK,FIN,URG,RST}	1	\N	1.00	2026-11-19 02:38:43.531704+05:30	f	[]	[]
984	1	Q-M4-53BCF876E8	4	Scenario check: A learner is reviewing this networking point: A socket endpoint combines an address with a transport port. Which answer is correct? What is a socket commonly defined by?	{"A MAC address and cable length","An IP address and a port number","A URL and file extension","A VLAN ID and frame size"}	2	\N	1.00	2026-11-19 02:38:43.538328+05:30	f	[]	[]
985	1	Q-M4-9319E01075	4	Select the best answer. What is a socket commonly defined by?	{"A MAC address and cable length","A VLAN ID and frame size","An IP address and a port number","A URL and file extension"}	3	\N	1.00	2026-11-19 02:38:43.541387+05:30	f	[]	[]
986	1	Q-M4-1BF1CBBC5B	4	Scenario check: A learner is reviewing this networking point: Transport-layer ports multiplex traffic among applications. Which answer is correct? What is a port number used to identify?	{"A router's geographic location","An application process or service endpoint","A cable category","A physical switch socket only"}	2	\N	1.00	2026-11-19 02:38:43.544846+05:30	f	[]	[]
987	1	Q-M4-9FB913DCC6	4	Scenario check: A learner is reviewing this networking point: The receive window supports receiver-side flow control. Which answer is correct? What is the purpose of the TCP receive window?	{"To select the DNS resolver","To set the IP address class","To specify the Wi-Fi channel","To advertise how much data the receiver can accept"}	4	\N	1.00	2026-11-19 02:38:43.547921+05:30	f	[]	[]
988	1	Q-M4-7E24DB3B06	4	Which option correctly answers this question: Which port is the default for HTTPS?	{69,23,443,53}	3	\N	1.00	2026-11-19 02:38:43.552111+05:30	f	[]	[]
989	1	Q-M4-0035EA387D	4	In a computer-networking context, How many steps are in the standard TCP connection handshake?	{Two,Three,Five,One}	2	\N	1.00	2026-11-19 02:38:43.555332+05:30	f	[]	[]
990	1	Q-M4-90B2B6989E	4	In a computer-networking context, Which port is commonly associated with DNS queries?	{143,20,53,3389}	3	\N	1.00	2026-11-19 02:38:43.558763+05:30	f	[]	[]
991	1	Q-M4-2986FA9307	4	Choose the most accurate answer. What is the main difference between flow control and congestion control?	{"Flow control routes; congestion control resolves names","They are identical","Flow control protects the receiver; congestion control protects the network","Flow control encrypts; congestion control compresses"}	3	\N	1.00	2026-11-19 02:38:43.561646+05:30	f	[]	[]
992	1	Q-M4-A1CCC7718A	4	Which option correctly answers this question: What does multiplexing at the transport layer allow?	{"Routers to share one MAC address","Multiple application conversations to share network services","DNS names to become IP headers","Multiple cables to become one fibre"}	2	\N	1.00	2026-11-19 02:38:43.564432+05:30	f	[]	[]
993	1	Q-M4-13EFE0C3FC	4	Choose the most accurate answer. What is a socket commonly defined by?	{"A MAC address and cable length","A URL and file extension","An IP address and a port number","A VLAN ID and frame size"}	3	\N	1.00	2026-11-19 02:38:43.567547+05:30	f	[]	[]
994	1	Q-M4-3E145696D8	4	Select the best answer. What does multiplexing at the transport layer allow?	{"Multiple cables to become one fibre","DNS names to become IP headers","Multiple application conversations to share network services","Routers to share one MAC address"}	3	\N	1.00	2026-11-19 02:38:43.570785+05:30	f	[]	[]
995	1	Q-M4-28722027E3	4	Identify the correct networking concept or value: How many steps are in the standard TCP connection handshake?	{One,Three,Two,Five}	2	\N	1.00	2026-11-19 02:38:43.573948+05:30	f	[]	[]
996	1	Q-M4-5E107C6E54	4	Select the best answer. Which port is the default for HTTPS?	{443,69,53,23}	1	\N	1.00	2026-11-19 02:38:43.577076+05:30	f	[]	[]
997	1	Q-M4-1D1113AA94	4	Which option correctly answers this question: Which TCP mechanism helps recover from lost segments?	{"MAC learning","VLAN tagging","Domain delegation",Retransmission}	4	\N	1.00	2026-11-19 02:38:43.580688+05:30	f	[]	[]
998	1	Q-M4-F9DBAD6AFA	4	Which option correctly answers this question: What is the range of TCP/UDP port numbers?	{"0 to 4095","1 to 1024 only","0 to 255","0 to 65535"}	4	\N	1.00	2026-11-19 02:38:43.583901+05:30	f	[]	[]
999	1	Q-M4-66082095D0	4	In a computer-networking context, Which TCP flag commonly acknowledges received data?	{URG,RST,FIN,ACK}	4	\N	1.00	2026-11-19 02:38:43.587489+05:30	f	[]	[]
1002	1	Q-M4-22A4BBAC3D	4	Scenario check: A learner is reviewing this networking point: SYN is used during TCP connection establishment. Which answer is correct? Which TCP flag is used to initiate a connection?	{SYN,RST,PSH,FIN}	1	\N	1.00	2026-11-19 02:38:43.596023+05:30	f	[]	[]
1003	1	Q-M4-5FFEBC47E8	4	Select the best answer. What is the main difference between flow control and congestion control?	{"Flow control encrypts; congestion control compresses","Flow control routes; congestion control resolves names","Flow control protects the receiver; congestion control protects the network","They are identical"}	3	\N	1.00	2026-11-19 02:38:43.599821+05:30	f	[]	[]
1004	1	Q-M4-1AC3444C93	4	Identify the correct networking concept or value: What is a socket commonly defined by?	{"A URL and file extension","An IP address and a port number","A VLAN ID and frame size","A MAC address and cable length"}	2	\N	1.00	2026-11-19 02:38:43.603584+05:30	f	[]	[]
1005	1	Q-M4-0A467B8A06	4	Identify the correct networking concept or value: What does multiplexing at the transport layer allow?	{"Multiple application conversations to share network services","Routers to share one MAC address","DNS names to become IP headers","Multiple cables to become one fibre"}	1	\N	1.00	2026-11-19 02:38:43.606821+05:30	f	[]	[]
1006	1	Q-M4-E636D58B44	4	In a computer-networking context, What is the purpose of a TCP sequence number?	{"To select an Ethernet cable","To identify a DNS zone","To represent an IPv6 prefix","To identify byte positions in the data stream"}	4	\N	1.00	2026-11-19 02:38:43.610391+05:30	f	[]	[]
1007	1	Q-M4-1D0F6BCA01	4	Select the best answer. What is the purpose of the TCP receive window?	{"To select the DNS resolver","To specify the Wi-Fi channel","To set the IP address class","To advertise how much data the receiver can accept"}	4	\N	1.00	2026-11-19 02:38:43.613227+05:30	f	[]	[]
1008	1	Q-M4-88867A78B0	4	Scenario check: A learner is reviewing this networking point: TCP retransmits data when loss is inferred or a timer expires. Which answer is correct? Which TCP mechanism helps recover from lost segments?	{"MAC learning",Retransmission,"VLAN tagging","Domain delegation"}	2	\N	1.00	2026-11-19 02:38:43.616304+05:30	f	[]	[]
1009	1	Q-M4-DCDC71F541	4	In a computer-networking context, Which port is commonly used by SMTP for server-to-server mail transfer?	{161,22,67,25}	4	\N	1.00	2026-11-19 02:38:43.620396+05:30	f	[]	[]
1010	1	Q-M4-6343DD9BBF	4	Choose the most accurate answer. Which port is commonly used by SMTP for server-to-server mail transfer?	{161,22,25,67}	3	\N	1.00	2026-11-19 02:38:43.623293+05:30	f	[]	[]
1011	1	Q-M4-E8858EFFBD	4	Choose the most accurate answer. What is a port number used to identify?	{"An application process or service endpoint","A physical switch socket only","A router's geographic location","A cable category"}	1	\N	1.00	2026-11-19 02:38:43.626243+05:30	f	[]	[]
1012	1	Q-M4-A721FA1856	4	Which option correctly answers this question: What is the purpose of the TCP receive window?	{"To select the DNS resolver","To set the IP address class","To advertise how much data the receiver can accept","To specify the Wi-Fi channel"}	3	\N	1.00	2026-11-19 02:38:43.629029+05:30	f	[]	[]
1013	1	Q-M4-FE435AD854	4	Choose the most accurate answer. Which TCP mechanism helps recover from lost segments?	{"Domain delegation",Retransmission,"MAC learning","VLAN tagging"}	2	\N	1.00	2026-11-19 02:38:43.632035+05:30	f	[]	[]
1014	1	Q-M4-40F621194F	4	Identify the correct networking concept or value: Which port is commonly used by SMTP for server-to-server mail transfer?	{161,22,67,25}	4	\N	1.00	2026-11-19 02:38:43.635283+05:30	f	[]	[]
1015	1	Q-M4-FDC511B3E4	4	In a computer-networking context, What is the range of TCP/UDP port numbers?	{"0 to 255","1 to 1024 only","0 to 4095","0 to 65535"}	4	\N	1.00	2026-11-19 02:38:43.639481+05:30	f	[]	[]
1016	1	Q-M4-32AF78DDDF	4	Select the best answer. What is congestion control designed to avoid?	{"Overloading the network with excessive traffic","Using port numbers","Resolving IP addresses","Creating Ethernet frames"}	1	\N	1.00	2026-11-19 02:38:43.642684+05:30	f	[]	[]
1017	1	Q-M4-CCF18EA49F	4	Select the best answer. What is the range of TCP/UDP port numbers?	{"0 to 4095","1 to 1024 only","0 to 65535","0 to 255"}	3	\N	1.00	2026-11-19 02:38:43.64566+05:30	f	[]	[]
1018	1	Q-M4-B4FF53CD66	4	Which option correctly answers this question: Which TCP flag is used to initiate a connection?	{PSH,RST,SYN,FIN}	3	\N	1.00	2026-11-19 02:38:43.648651+05:30	f	[]	[]
1019	1	Q-M4-8FCC5D95B4	4	Select the best answer. Which TCP mechanism helps recover from lost segments?	{Retransmission,"MAC learning","Domain delegation","VLAN tagging"}	1	\N	1.00	2026-11-19 02:38:43.65155+05:30	f	[]	[]
1020	1	Q-M4-0CE260A2A4	4	Select the best answer. What does a TCP acknowledgement number indicate?	{"The number of routers in the path","The UDP checksum length","The next byte expected from the other side","The sender's MAC address"}	3	\N	1.00	2026-11-19 02:38:43.654642+05:30	f	[]	[]
1021	1	Q-M4-5ED13B8F33	4	In a computer-networking context, What does a TCP acknowledgement number indicate?	{"The number of routers in the path","The UDP checksum length","The next byte expected from the other side","The sender's MAC address"}	3	\N	1.00	2026-11-19 02:38:43.657509+05:30	f	[]	[]
1022	1	Q-M4-DB1755EEB7	4	Choose the most accurate answer. Which port is commonly associated with DNS queries?	{143,20,3389,53}	4	\N	1.00	2026-11-19 02:38:43.6606+05:30	f	[]	[]
1023	1	Q-M4-FEDFA12920	4	Select the best answer. Which transport protocol is connectionless and has a small header?	{FTP,UDP,TCP,Ethernet}	2	\N	1.00	2026-11-19 02:38:43.663612+05:30	f	[]	[]
1024	1	Q-M4-AA4DDCC399	4	In a computer-networking context, Which port is the default for HTTP?	{80,25,110,21}	1	\N	1.00	2026-11-19 02:38:43.667394+05:30	f	[]	[]
1025	1	Q-M4-BF6C197569	4	Select the best answer. Which transport protocol is commonly used for real-time voice or video when low delay is important?	{"TCP only",ICMP,ARP,UDP}	4	\N	1.00	2026-11-19 02:38:43.670967+05:30	f	[]	[]
1026	1	Q-M4-9E000777F2	4	Scenario check: A learner is reviewing this networking point: SMTP server-to-server transfer commonly uses TCP port 25. Which answer is correct? Which port is commonly used by SMTP for server-to-server mail transfer?	{25,161,67,22}	1	\N	1.00	2026-11-19 02:38:43.673939+05:30	f	[]	[]
1027	1	Q-M4-C7F9BBB3CF	4	Which option correctly answers this question: What is congestion control designed to avoid?	{"Using port numbers","Resolving IP addresses","Creating Ethernet frames","Overloading the network with excessive traffic"}	4	\N	1.00	2026-11-19 02:38:43.67678+05:30	f	[]	[]
1028	1	Q-M4-0EA3D0F1BC	4	Select the best answer. Which port is commonly used by SMTP for server-to-server mail transfer?	{67,22,25,161}	3	\N	1.00	2026-11-19 02:38:43.679588+05:30	f	[]	[]
1029	1	Q-M4-117550FAA7	4	Select the best answer. How many steps are in the standard TCP connection handshake?	{One,Two,Five,Three}	4	\N	1.00	2026-11-19 02:38:43.682024+05:30	f	[]	[]
1030	1	Q-M4-DDBEA8427B	4	In a computer-networking context, Which transport protocol is connectionless and has a small header?	{Ethernet,UDP,TCP,FTP}	2	\N	1.00	2026-11-19 02:38:43.684462+05:30	f	[]	[]
1031	1	Q-M4-B7E07C4540	4	Select the best answer. What is a port number used to identify?	{"A router's geographic location","A physical switch socket only","An application process or service endpoint","A cable category"}	3	\N	1.00	2026-11-19 02:38:43.687479+05:30	f	[]	[]
1032	1	Q-M4-895E96A67F	4	In a computer-networking context, What is a port number used to identify?	{"An application process or service endpoint","A router's geographic location","A physical switch socket only","A cable category"}	1	\N	1.00	2026-11-19 02:38:43.690756+05:30	f	[]	[]
1033	1	Q-M4-7D55DE6E80	4	Scenario check: A learner is reviewing this networking point: DNS commonly uses port 53 over UDP or TCP. Which answer is correct? Which port is commonly associated with DNS queries?	{143,53,20,3389}	2	\N	1.00	2026-11-19 02:38:43.693607+05:30	f	[]	[]
1034	1	Q-M4-E99E73C38E	4	Select the best answer. Which transport protocol provides a connection-oriented byte stream?	{TCP,IP,UDP,ARP}	1	\N	1.00	2026-11-19 02:38:43.696239+05:30	f	[]	[]
1035	1	Q-M4-8777A92C66	4	Scenario check: A learner is reviewing this networking point: TCP and UDP port fields are 16 bits wide. Which answer is correct? What is the range of TCP/UDP port numbers?	{"0 to 65535","1 to 1024 only","0 to 255","0 to 4095"}	1	\N	1.00	2026-11-19 02:38:43.699233+05:30	f	[]	[]
1036	1	Q-M4-E99DE0BFA3	4	Choose the most accurate answer. Which transport protocol is connectionless and has a small header?	{FTP,Ethernet,TCP,UDP}	4	\N	1.00	2026-11-19 02:38:43.702229+05:30	f	[]	[]
1037	1	Q-M4-FDFCC5B7AD	4	Identify the correct networking concept or value: Which transport protocol provides a connection-oriented byte stream?	{ARP,UDP,TCP,IP}	3	\N	1.00	2026-11-19 02:38:43.705248+05:30	f	[]	[]
1038	1	Q-M4-F21A038502	4	Choose the most accurate answer. What is the range of TCP/UDP port numbers?	{"0 to 255","1 to 1024 only","0 to 65535","0 to 4095"}	3	\N	1.00	2026-11-19 02:38:43.708074+05:30	f	[]	[]
1039	1	Q-M4-EEFA679736	4	Identify the correct networking concept or value: Which TCP flag commonly acknowledges received data?	{URG,FIN,ACK,RST}	3	\N	1.00	2026-11-19 02:38:43.711084+05:30	f	[]	[]
1040	1	Q-M4-D7D91B1A65	4	Choose the most accurate answer. What does a TCP acknowledgement number indicate?	{"The UDP checksum length","The number of routers in the path","The sender's MAC address","The next byte expected from the other side"}	4	\N	1.00	2026-11-19 02:38:43.714084+05:30	f	[]	[]
1041	1	Q-M4-EF090839BE	4	Identify the correct networking concept or value: What does a TCP acknowledgement number indicate?	{"The number of routers in the path","The next byte expected from the other side","The sender's MAC address","The UDP checksum length"}	2	\N	1.00	2026-11-19 02:38:43.717198+05:30	f	[]	[]
1042	1	Q-M4-07ECC8634E	4	Identify the correct networking concept or value: Which TCP mechanism helps recover from lost segments?	{Retransmission,"Domain delegation","MAC learning","VLAN tagging"}	1	\N	1.00	2026-11-19 02:38:43.720424+05:30	f	[]	[]
1043	1	Q-M4-B64BFA148F	4	Choose the most accurate answer. What is the purpose of a TCP sequence number?	{"To identify byte positions in the data stream","To identify a DNS zone","To represent an IPv6 prefix","To select an Ethernet cable"}	1	\N	1.00	2026-11-19 02:38:43.723263+05:30	f	[]	[]
1044	1	Q-M4-CC12F88C1F	4	Select the best answer. Which port is the default for HTTP?	{110,21,25,80}	4	\N	1.00	2026-11-19 02:38:43.725829+05:30	f	[]	[]
1045	1	Q-M4-EC31E94E51	4	Scenario check: A learner is reviewing this networking point: HTTPS commonly uses TCP port 443. Which answer is correct? Which port is the default for HTTPS?	{69,53,23,443}	4	\N	1.00	2026-11-19 02:38:43.728411+05:30	f	[]	[]
1046	1	Q-M4-9104DB840F	4	Identify the correct networking concept or value: Which port is commonly associated with DNS queries?	{3389,20,53,143}	3	\N	1.00	2026-11-19 02:38:43.731556+05:30	f	[]	[]
1047	1	Q-M4-CD549CCEE8	4	In a computer-networking context, Which transport protocol is commonly used for real-time voice or video when low delay is important?	{ICMP,"TCP only",ARP,UDP}	4	\N	1.00	2026-11-19 02:38:43.734831+05:30	f	[]	[]
1048	1	Q-M4-9B1991F6D6	4	Scenario check: A learner is reviewing this networking point: The mechanisms address different limits: receiver capacity versus network load. Which answer is correct? What is the main difference between flow control and congestion control?	{"Flow control encrypts; congestion control compresses","They are identical","Flow control protects the receiver; congestion control protects the network","Flow control routes; congestion control resolves names"}	3	\N	1.00	2026-11-19 02:38:43.738299+05:30	f	[]	[]
1049	1	Q-M4-6DBF9EA612	4	Choose the most accurate answer. What is congestion control designed to avoid?	{"Using port numbers","Resolving IP addresses","Overloading the network with excessive traffic","Creating Ethernet frames"}	3	\N	1.00	2026-11-19 02:38:43.74155+05:30	f	[]	[]
1050	1	Q-M4-143235E328	4	Scenario check: A learner is reviewing this networking point: Congestion control adjusts sending behaviour to network conditions. Which answer is correct? What is congestion control designed to avoid?	{"Resolving IP addresses","Using port numbers","Creating Ethernet frames","Overloading the network with excessive traffic"}	4	\N	1.00	2026-11-19 02:38:43.744636+05:30	f	[]	[]
1051	1	Q-M5-31534D006A	5	Which option correctly answers this question: Which protocol securely provides remote command-line login?	{Telnet,SSH,HTTP,TFTP}	2	\N	1.00	2026-11-19 02:38:43.747323+05:30	f	[]	[]
1052	1	Q-M5-68FDE6E4C2	5	Choose the most accurate answer. Which protocol synchronizes clocks across networked systems?	{TFTP,SMTP,ICMP,NTP}	4	\N	1.00	2026-11-19 02:38:43.750016+05:30	f	[]	[]
1053	1	Q-M5-27A73582F4	5	Scenario check: A learner is reviewing this networking point: FTP supports file transfers using separate control and data connections. Which answer is correct? Which protocol is used for file transfer in its traditional form?	{FTP,DNS,DHCP,ICMP}	1	\N	1.00	2026-11-19 02:38:43.752883+05:30	f	[]	[]
1054	1	Q-M5-2B45B82CA8	5	Choose the most accurate answer. Which protocol allows a user to access and manage email stored on a server?	{ICMP,RIP,ARP,IMAP}	4	\N	1.00	2026-11-19 02:38:43.755728+05:30	f	[]	[]
1055	1	Q-M5-149D448BF4	5	Choose the most accurate answer. Which protocol commonly downloads email to a client?	{NTP,BGP,POP3,SNMP}	3	\N	1.00	2026-11-19 02:38:43.758669+05:30	f	[]	[]
1056	1	Q-M5-674BA03B28	5	Which option correctly answers this question: Which DNS record identifies a mail exchanger for a domain?	{"AAAA record","MX record","CNAME record","NS record"}	2	\N	1.00	2026-11-19 02:38:43.761528+05:30	f	[]	[]
1057	1	Q-M5-C877DA7A7B	5	Identify the correct networking concept or value: Which HTTP status code indicates that the requested resource was not found?	{"304 Not Modified","201 Created","200 OK","404 Not Found"}	4	\N	1.00	2026-11-19 02:38:43.764389+05:30	f	[]	[]
1058	1	Q-M5-FE9B526B70	5	In a computer-networking context, Which HTTP status code indicates that the requested resource was not found?	{"304 Not Modified","200 OK","201 Created","404 Not Found"}	4	\N	1.00	2026-11-19 02:38:43.766762+05:30	f	[]	[]
1059	1	Q-M5-038596F920	5	Identify the correct networking concept or value: What is a firewall primarily used for?	{"Filtering network traffic according to security rules","Assigning domain names","Increasing cable bandwidth","Replacing all routing protocols"}	1	\N	1.00	2026-11-19 02:38:43.769308+05:30	f	[]	[]
1060	1	Q-M5-5E47F188A0	5	Choose the most accurate answer. Which protocol is commonly used to send email between mail servers?	{IMAP,POP3,SMTP,DHCP}	3	\N	1.00	2026-11-19 02:38:43.771756+05:30	f	[]	[]
1061	1	Q-M5-3E84C4DCB6	5	In a computer-networking context, Which application protocol translates domain names into IP addresses?	{SMTP,SNMP,FTP,DNS}	4	\N	1.00	2026-11-19 02:38:43.774762+05:30	f	[]	[]
1062	1	Q-M5-88B1F7AE81	5	In a computer-networking context, Which DNS record maps a hostname to an IPv4 address?	{"A record","PTR record","TXT record","MX record"}	1	\N	1.00	2026-11-19 02:38:43.777553+05:30	f	[]	[]
1063	1	Q-M5-F63BD5CC77	5	Select the best answer. Which protocol securely provides remote command-line login?	{HTTP,TFTP,SSH,Telnet}	3	\N	1.00	2026-11-19 02:38:43.780223+05:30	f	[]	[]
1064	1	Q-M5-BBCA19EB94	5	Identify the correct networking concept or value: Which protocol is used to transfer web pages between browsers and servers?	{ICMP,ARP,RIP,HTTP}	4	\N	1.00	2026-11-19 02:38:43.782373+05:30	f	[]	[]
1065	1	Q-M5-2AC925CD89	5	Select the best answer. Which protocol commonly downloads email to a client?	{POP3,BGP,NTP,SNMP}	1	\N	1.00	2026-11-19 02:38:43.784512+05:30	f	[]	[]
1066	1	Q-M5-FEA9D5AA34	5	Identify the correct networking concept or value: Which protocol commonly downloads email to a client?	{POP3,BGP,NTP,SNMP}	1	\N	1.00	2026-11-19 02:38:43.787148+05:30	f	[]	[]
1067	1	Q-M5-6746482257	5	Which option correctly answers this question: Which protocol synchronizes clocks across networked systems?	{ICMP,SMTP,NTP,TFTP}	3	\N	1.00	2026-11-19 02:38:43.789858+05:30	f	[]	[]
1068	1	Q-M5-42F010A4B3	5	In a computer-networking context, Which protocol is used to transfer web pages between browsers and servers?	{RIP,ARP,ICMP,HTTP}	4	\N	1.00	2026-11-19 02:38:43.792742+05:30	f	[]	[]
1069	1	Q-M5-F864242E01	5	Select the best answer. What does HTTPS add to HTTP?	{"TLS-based protection for the connection","Automatic IP address assignment","Ethernet collision detection","A new MAC address"}	1	\N	1.00	2026-11-19 02:38:43.795681+05:30	f	[]	[]
1070	1	Q-M5-9A154D3C16	5	Which option correctly answers this question: Which HTTP status code indicates that the requested resource was not found?	{"404 Not Found","200 OK","201 Created","304 Not Modified"}	1	\N	1.00	2026-11-19 02:38:43.798402+05:30	f	[]	[]
1071	1	Q-M5-8A5F06177E	5	Select the best answer. Which protocol allows a user to access and manage email stored on a server?	{IMAP,ARP,RIP,ICMP}	1	\N	1.00	2026-11-19 02:38:43.801378+05:30	f	[]	[]
1072	1	Q-M5-DDEFBA6C41	5	Which option correctly answers this question: Which protocol allows a user to access and manage email stored on a server?	{ARP,IMAP,ICMP,RIP}	2	\N	1.00	2026-11-19 02:38:43.804263+05:30	f	[]	[]
1073	1	Q-M5-F341AFA757	5	Scenario check: A learner is reviewing this networking point: GET requests a representation of a resource. Which answer is correct? Which HTTP method is commonly used to retrieve a resource?	{CONNECT,POST,DELETE,GET}	4	\N	1.00	2026-11-19 02:38:43.80718+05:30	f	[]	[]
1074	1	Q-M5-8F96E32C83	5	Which option correctly answers this question: What does HTTPS add to HTTP?	{"A new MAC address","Automatic IP address assignment","TLS-based protection for the connection","Ethernet collision detection"}	3	\N	1.00	2026-11-19 02:38:43.809733+05:30	f	[]	[]
1075	1	Q-M5-909CCF2EA0	5	In a computer-networking context, Which protocol commonly downloads email to a client?	{NTP,BGP,POP3,SNMP}	3	\N	1.00	2026-11-19 02:38:43.812583+05:30	f	[]	[]
1076	1	Q-M5-5857E62B67	5	Scenario check: A learner is reviewing this networking point: HTTP is an application-layer protocol for web communication. Which answer is correct? Which protocol is used to transfer web pages between browsers and servers?	{RIP,ICMP,ARP,HTTP}	4	\N	1.00	2026-11-19 02:38:43.815294+05:30	f	[]	[]
1077	1	Q-M5-D88EEE6DF3	5	Choose the most accurate answer. Which application protocol translates domain names into IP addresses?	{FTP,SMTP,SNMP,DNS}	4	\N	1.00	2026-11-19 02:38:43.817244+05:30	f	[]	[]
1078	1	Q-M5-BAD202F7D9	5	Scenario check: A learner is reviewing this networking point: An AAAA record stores an IPv6 address. Which answer is correct? Which DNS record maps a hostname to an IPv6 address?	{"MX record","A record","AAAA record","SOA record"}	3	\N	1.00	2026-11-19 02:38:43.819975+05:30	f	[]	[]
1079	1	Q-M5-CD3203C46F	5	Scenario check: A learner is reviewing this networking point: IMAP synchronizes access to server-stored mail and folders. Which answer is correct? Which protocol allows a user to access and manage email stored on a server?	{ICMP,RIP,IMAP,ARP}	3	\N	1.00	2026-11-19 02:38:43.823156+05:30	f	[]	[]
1080	1	Q-M5-956F29A95F	5	Identify the correct networking concept or value: Which protocol securely provides remote command-line login?	{SSH,HTTP,TFTP,Telnet}	1	\N	1.00	2026-11-19 02:38:43.825742+05:30	f	[]	[]
1081	1	Q-M5-FE5398A590	5	Identify the correct networking concept or value: What does HTTPS add to HTTP?	{"Ethernet collision detection","TLS-based protection for the connection","Automatic IP address assignment","A new MAC address"}	2	\N	1.00	2026-11-19 02:38:43.827855+05:30	f	[]	[]
1082	1	Q-M5-C710CF4C6B	5	Choose the most accurate answer. What is the purpose of a URL?	{"To assign a MAC address","To identify the location of a resource and how to access it","To calculate a subnet mask","To detect frame errors"}	2	\N	1.00	2026-11-19 02:38:43.83003+05:30	f	[]	[]
1083	1	Q-M5-9131742367	5	Select the best answer. Which HTTP status code indicates that a resource was successfully found and returned?	{"500 Internal Server Error","200 OK","301 Moved Permanently","404 Not Found"}	2	\N	1.00	2026-11-19 02:38:43.832527+05:30	f	[]	[]
1084	1	Q-M5-4D518AAD93	5	Which option correctly answers this question: Which protocol commonly downloads email to a client?	{BGP,POP3,SNMP,NTP}	2	\N	1.00	2026-11-19 02:38:43.83581+05:30	f	[]	[]
1085	1	Q-M5-A7DEC78F57	5	In a computer-networking context, Which protocol is commonly used to send email between mail servers?	{POP3,DHCP,IMAP,SMTP}	4	\N	1.00	2026-11-19 02:38:43.839087+05:30	f	[]	[]
1086	1	Q-M5-33191E103E	5	Choose the most accurate answer. Which HTTP status code indicates that the requested resource was not found?	{"200 OK","201 Created","304 Not Modified","404 Not Found"}	4	\N	1.00	2026-11-19 02:38:43.8423+05:30	f	[]	[]
1087	1	Q-M5-6F357702E9	5	Scenario check: A learner is reviewing this networking point: POP3 is a mail retrieval protocol. Which answer is correct? Which protocol commonly downloads email to a client?	{NTP,SNMP,BGP,POP3}	4	\N	1.00	2026-11-19 02:38:43.844905+05:30	f	[]	[]
1088	1	Q-M5-A567AC5518	5	In a computer-networking context, Which protocol is used for file transfer in its traditional form?	{ICMP,DHCP,DNS,FTP}	4	\N	1.00	2026-11-19 02:38:43.846934+05:30	f	[]	[]
1089	1	Q-M5-CD6BC4F434	5	In a computer-networking context, What does HTTPS add to HTTP?	{"Ethernet collision detection","A new MAC address","Automatic IP address assignment","TLS-based protection for the connection"}	4	\N	1.00	2026-11-19 02:38:43.848922+05:30	f	[]	[]
1090	1	Q-M5-EC4DB84989	5	Choose the most accurate answer. Which HTTP status code indicates that a resource was successfully found and returned?	{"404 Not Found","200 OK","301 Moved Permanently","500 Internal Server Error"}	2	\N	1.00	2026-11-19 02:38:43.851354+05:30	f	[]	[]
1091	1	Q-M5-44D3FAD0DA	5	Select the best answer. What is the purpose of a URL?	{"To calculate a subnet mask","To identify the location of a resource and how to access it","To detect frame errors","To assign a MAC address"}	2	\N	1.00	2026-11-19 02:38:43.854044+05:30	f	[]	[]
1092	1	Q-M5-737B43ACF7	5	In a computer-networking context, Which protocol securely provides remote command-line login?	{SSH,HTTP,TFTP,Telnet}	1	\N	1.00	2026-11-19 02:38:43.856233+05:30	f	[]	[]
1093	1	Q-M5-222D485A73	5	Identify the correct networking concept or value: Which DNS record maps a hostname to an IPv4 address?	{"TXT record","MX record","PTR record","A record"}	4	\N	1.00	2026-11-19 02:38:43.85902+05:30	f	[]	[]
1094	1	Q-M5-A04486E11D	5	Scenario check: A learner is reviewing this networking point: 200 indicates successful handling of the request. Which answer is correct? Which HTTP status code indicates that a resource was successfully found and returned?	{"500 Internal Server Error","301 Moved Permanently","200 OK","404 Not Found"}	3	\N	1.00	2026-11-19 02:38:43.861558+05:30	f	[]	[]
1095	1	Q-M5-5903C07E34	5	Identify the correct networking concept or value: Which protocol is used for file transfer in its traditional form?	{FTP,DHCP,ICMP,DNS}	1	\N	1.00	2026-11-19 02:38:43.863664+05:30	f	[]	[]
1096	1	Q-M5-A28147B013	5	Identify the correct networking concept or value: Which protocol automatically assigns IP configuration to hosts?	{NTP,SNMP,SMTP,DHCP}	4	\N	1.00	2026-11-19 02:38:43.866236+05:30	f	[]	[]
1097	1	Q-M5-E7F1B94F56	5	Which option correctly answers this question: Which HTTP method is commonly used to retrieve a resource?	{POST,CONNECT,DELETE,GET}	4	\N	1.00	2026-11-19 02:38:43.868613+05:30	f	[]	[]
1098	1	Q-M5-D35A3C4311	5	Select the best answer. Which protocol is used to transfer web pages between browsers and servers?	{ICMP,HTTP,RIP,ARP}	2	\N	1.00	2026-11-19 02:38:43.87128+05:30	f	[]	[]
1099	1	Q-M5-1E937EBD2E	5	Select the best answer. Which protocol synchronizes clocks across networked systems?	{SMTP,TFTP,ICMP,NTP}	4	\N	1.00	2026-11-19 02:38:43.873426+05:30	f	[]	[]
1100	1	Q-M5-AD4992E867	5	Identify the correct networking concept or value: Which HTTP status code indicates that a resource was successfully found and returned?	{"200 OK","500 Internal Server Error","301 Moved Permanently","404 Not Found"}	1	\N	1.00	2026-11-19 02:38:43.875282+05:30	f	[]	[]
1101	1	Q-M5-4F04664DCB	5	Identify the correct networking concept or value: Which application protocol translates domain names into IP addresses?	{FTP,DNS,SNMP,SMTP}	2	\N	1.00	2026-11-19 02:38:43.877274+05:30	f	[]	[]
1102	1	Q-M5-238964A56A	5	Identify the correct networking concept or value: Which protocol allows a user to access and manage email stored on a server?	{ICMP,RIP,ARP,IMAP}	4	\N	1.00	2026-11-19 02:38:43.880196+05:30	f	[]	[]
1103	1	Q-M5-C5565A0539	5	Scenario check: A learner is reviewing this networking point: DHCP dynamically provides addresses and other configuration. Which answer is correct? Which protocol automatically assigns IP configuration to hosts?	{SNMP,NTP,DHCP,SMTP}	3	\N	1.00	2026-11-19 02:38:43.883442+05:30	f	[]	[]
1104	1	Q-M5-0E39517175	5	Identify the correct networking concept or value: Which protocol is used to monitor and manage network devices?	{FTP,SNMP,HTTP,ARP}	2	\N	1.00	2026-11-19 02:38:43.886607+05:30	f	[]	[]
1105	1	Q-M5-A30AA339E8	5	Which option correctly answers this question: Which protocol automatically assigns IP configuration to hosts?	{NTP,DHCP,SMTP,SNMP}	2	\N	1.00	2026-11-19 02:38:43.889349+05:30	f	[]	[]
1106	1	Q-M5-BD35745509	5	Scenario check: A learner is reviewing this networking point: 404 indicates that the server cannot find the requested resource. Which answer is correct? Which HTTP status code indicates that the requested resource was not found?	{"404 Not Found","200 OK","201 Created","304 Not Modified"}	1	\N	1.00	2026-11-19 02:38:43.89165+05:30	f	[]	[]
1107	1	Q-M5-420E1A26B4	5	In a computer-networking context, Which DNS record maps a hostname to an IPv6 address?	{"A record","AAAA record","SOA record","MX record"}	2	\N	1.00	2026-11-19 02:38:43.893586+05:30	f	[]	[]
1108	1	Q-M5-8577C0B5B8	5	Scenario check: A learner is reviewing this networking point: A firewall permits or blocks traffic based on configured policy. Which answer is correct? What is a firewall primarily used for?	{"Filtering network traffic according to security rules","Assigning domain names","Replacing all routing protocols","Increasing cable bandwidth"}	1	\N	1.00	2026-11-19 02:38:43.895452+05:30	f	[]	[]
1109	1	Q-M5-FFAF13CE44	5	Which option correctly answers this question: Which protocol is used for file transfer in its traditional form?	{FTP,DHCP,ICMP,DNS}	1	\N	1.00	2026-11-19 02:38:43.897471+05:30	f	[]	[]
1110	1	Q-M5-CA37999CC3	5	Choose the most accurate answer. Which protocol securely provides remote command-line login?	{Telnet,HTTP,SSH,TFTP}	3	\N	1.00	2026-11-19 02:38:43.899524+05:30	f	[]	[]
1111	1	Q-M5-4EC5237478	5	Which option correctly answers this question: What is the purpose of a URL?	{"To calculate a subnet mask","To detect frame errors","To assign a MAC address","To identify the location of a resource and how to access it"}	4	\N	1.00	2026-11-19 02:38:43.902861+05:30	f	[]	[]
1112	1	Q-M5-53FD257E5D	5	Which option correctly answers this question: Which HTTP status code indicates that a resource was successfully found and returned?	{"500 Internal Server Error","404 Not Found","301 Moved Permanently","200 OK"}	4	\N	1.00	2026-11-19 02:38:43.905505+05:30	f	[]	[]
1113	1	Q-M5-9B60422FFB	5	Choose the most accurate answer. Which DNS record maps a hostname to an IPv4 address?	{"PTR record","TXT record","A record","MX record"}	3	\N	1.00	2026-11-19 02:38:43.90782+05:30	f	[]	[]
1114	1	Q-M5-514A5F6F11	5	In a computer-networking context, What is the purpose of a URL?	{"To assign a MAC address","To calculate a subnet mask","To identify the location of a resource and how to access it","To detect frame errors"}	3	\N	1.00	2026-11-19 02:38:43.910617+05:30	f	[]	[]
1115	1	Q-M5-04254547D1	5	Choose the most accurate answer. Which protocol automatically assigns IP configuration to hosts?	{NTP,SMTP,DHCP,SNMP}	3	\N	1.00	2026-11-19 02:38:43.912967+05:30	f	[]	[]
1116	1	Q-M5-75AF63D64B	5	Scenario check: A learner is reviewing this networking point: An A record stores an IPv4 address for a name. Which answer is correct? Which DNS record maps a hostname to an IPv4 address?	{"TXT record","PTR record","MX record","A record"}	4	\N	1.00	2026-11-19 02:38:43.914906+05:30	f	[]	[]
1117	1	Q-M5-29AB749373	5	Scenario check: A learner is reviewing this networking point: SSH provides encrypted remote login and command execution. Which answer is correct? Which protocol securely provides remote command-line login?	{HTTP,TFTP,SSH,Telnet}	3	\N	1.00	2026-11-19 02:38:43.916765+05:30	f	[]	[]
1118	1	Q-M5-437AB4ABC2	5	Scenario check: A learner is reviewing this networking point: Telnet is an older, plaintext remote terminal protocol. Which answer is correct? Which protocol sends remote terminal data without encryption by default?	{Telnet,SFTP,HTTPS,SSH}	1	\N	1.00	2026-11-19 02:38:43.918658+05:30	f	[]	[]
1119	1	Q-M5-10E08C8F94	5	Choose the most accurate answer. Which DNS record maps a hostname to an IPv6 address?	{"SOA record","MX record","A record","AAAA record"}	4	\N	1.00	2026-11-19 02:38:43.921577+05:30	f	[]	[]
1120	1	Q-M5-836F71F9A4	5	Which option correctly answers this question: Which DNS record maps a hostname to an IPv6 address?	{"A record","AAAA record","MX record","SOA record"}	2	\N	1.00	2026-11-19 02:38:43.923538+05:30	f	[]	[]
1121	1	Q-M5-B01371C338	5	Choose the most accurate answer. What does HTTPS add to HTTP?	{"TLS-based protection for the connection","A new MAC address","Automatic IP address assignment","Ethernet collision detection"}	1	\N	1.00	2026-11-19 02:38:43.925969+05:30	f	[]	[]
1122	1	Q-M5-76BC2FD4C2	5	Which option correctly answers this question: Which protocol is commonly used to send email between mail servers?	{DHCP,POP3,SMTP,IMAP}	3	\N	1.00	2026-11-19 02:38:43.928275+05:30	f	[]	[]
1123	1	Q-M5-C4AC2FC5C4	5	Choose the most accurate answer. Which protocol sends remote terminal data without encryption by default?	{SSH,Telnet,SFTP,HTTPS}	2	\N	1.00	2026-11-19 02:38:43.930855+05:30	f	[]	[]
1124	1	Q-M5-EA1F708B13	5	Select the best answer. Which protocol sends remote terminal data without encryption by default?	{Telnet,HTTPS,SSH,SFTP}	1	\N	1.00	2026-11-19 02:38:43.933559+05:30	f	[]	[]
1125	1	Q-M5-83D0A92F44	5	In a computer-networking context, Which protocol automatically assigns IP configuration to hosts?	{SMTP,NTP,DHCP,SNMP}	3	\N	1.00	2026-11-19 02:38:43.936238+05:30	f	[]	[]
1126	1	Q-M5-55C6E381F9	5	In a computer-networking context, What is a firewall primarily used for?	{"Assigning domain names","Filtering network traffic according to security rules","Replacing all routing protocols","Increasing cable bandwidth"}	2	\N	1.00	2026-11-19 02:38:43.938993+05:30	f	[]	[]
1127	1	Q-M5-E1CF06B73B	5	Choose the most accurate answer. Which HTTP method is commonly used to retrieve a resource?	{DELETE,CONNECT,POST,GET}	4	\N	1.00	2026-11-19 02:38:43.941387+05:30	f	[]	[]
1128	1	Q-M5-2F20BF4CEA	5	Scenario check: A learner is reviewing this networking point: HTTPS uses TLS to protect HTTP communication. Which answer is correct? What does HTTPS add to HTTP?	{"Ethernet collision detection","A new MAC address","Automatic IP address assignment","TLS-based protection for the connection"}	4	\N	1.00	2026-11-19 02:38:43.943298+05:30	f	[]	[]
1129	1	Q-M5-14691B2894	5	In a computer-networking context, Which protocol allows a user to access and manage email stored on a server?	{IMAP,RIP,ARP,ICMP}	1	\N	1.00	2026-11-19 02:38:43.945464+05:30	f	[]	[]
1130	1	Q-M5-C930F46483	5	Which option correctly answers this question: Which application protocol translates domain names into IP addresses?	{DNS,SNMP,SMTP,FTP}	1	\N	1.00	2026-11-19 02:38:43.947689+05:30	f	[]	[]
1131	1	Q-M5-C8E572CA5C	5	In a computer-networking context, Which HTTP status code indicates that a resource was successfully found and returned?	{"404 Not Found","301 Moved Permanently","500 Internal Server Error","200 OK"}	4	\N	1.00	2026-11-19 02:38:43.949839+05:30	f	[]	[]
1132	1	Q-M5-5E1C0CE51C	5	Select the best answer. Which protocol is used for file transfer in its traditional form?	{FTP,DNS,ICMP,DHCP}	1	\N	1.00	2026-11-19 02:38:43.952503+05:30	f	[]	[]
1133	1	Q-M5-A76B7BCA65	5	Which option correctly answers this question: Which protocol is used to transfer web pages between browsers and servers?	{ICMP,RIP,ARP,HTTP}	4	\N	1.00	2026-11-19 02:38:43.955653+05:30	f	[]	[]
1134	1	Q-M5-09C909D809	5	In a computer-networking context, Which HTTP method is commonly used to retrieve a resource?	{GET,POST,DELETE,CONNECT}	1	\N	1.00	2026-11-19 02:38:43.957951+05:30	f	[]	[]
1135	1	Q-M5-44589DF72E	5	Select the best answer. Which application protocol translates domain names into IP addresses?	{FTP,SNMP,SMTP,DNS}	4	\N	1.00	2026-11-19 02:38:43.959593+05:30	f	[]	[]
1136	1	Q-M5-4717DEC891	5	Select the best answer. Which protocol automatically assigns IP configuration to hosts?	{NTP,SMTP,SNMP,DHCP}	4	\N	1.00	2026-11-19 02:38:43.961196+05:30	f	[]	[]
1137	1	Q-M5-51AD84EB75	5	Choose the most accurate answer. Which protocol is used to monitor and manage network devices?	{HTTP,SNMP,FTP,ARP}	2	\N	1.00	2026-11-19 02:38:43.963061+05:30	f	[]	[]
1138	1	Q-M5-158C08FF36	5	Which option correctly answers this question: Which protocol is used to monitor and manage network devices?	{ARP,HTTP,SNMP,FTP}	3	\N	1.00	2026-11-19 02:38:43.965515+05:30	f	[]	[]
1139	1	Q-M5-B4B01332E4	5	Identify the correct networking concept or value: Which DNS record identifies a mail exchanger for a domain?	{"MX record","AAAA record","NS record","CNAME record"}	1	\N	1.00	2026-11-19 02:38:43.968679+05:30	f	[]	[]
1140	1	Q-M5-AF9C820E48	5	Scenario check: A learner is reviewing this networking point: SNMP supports monitoring and management of network equipment. Which answer is correct? Which protocol is used to monitor and manage network devices?	{ARP,SNMP,FTP,HTTP}	2	\N	1.00	2026-11-19 02:38:43.972139+05:30	f	[]	[]
1141	1	Q-M5-CC9E4CD3B4	5	Identify the correct networking concept or value: Which DNS record maps a hostname to an IPv6 address?	{"SOA record","AAAA record","MX record","A record"}	2	\N	1.00	2026-11-19 02:38:43.975534+05:30	f	[]	[]
1142	1	Q-M5-BA3EC32BFA	5	Scenario check: A learner is reviewing this networking point: The Domain Name System resolves names to records such as IP addresses. Which answer is correct? Which application protocol translates domain names into IP addresses?	{FTP,DNS,SMTP,SNMP}	2	\N	1.00	2026-11-19 02:38:43.97861+05:30	f	[]	[]
1143	1	Q-M5-0B18775A2B	5	Select the best answer. Which DNS record maps a hostname to an IPv4 address?	{"TXT record","A record","PTR record","MX record"}	2	\N	1.00	2026-11-19 02:38:43.981079+05:30	f	[]	[]
1144	1	Q-M5-822584A21E	5	In a computer-networking context, Which protocol synchronizes clocks across networked systems?	{ICMP,NTP,SMTP,TFTP}	2	\N	1.00	2026-11-19 02:38:43.98356+05:30	f	[]	[]
1145	1	Q-M5-312DB71898	5	Which option correctly answers this question: What is a firewall primarily used for?	{"Replacing all routing protocols","Filtering network traffic according to security rules","Increasing cable bandwidth","Assigning domain names"}	2	\N	1.00	2026-11-19 02:38:43.988365+05:30	f	[]	[]
1146	1	Q-M5-44F1DA8C62	5	Select the best answer. Which protocol is commonly used to send email between mail servers?	{SMTP,IMAP,POP3,DHCP}	1	\N	1.00	2026-11-19 02:38:43.991342+05:30	f	[]	[]
1147	1	Q-M5-2775878849	5	Select the best answer. Which DNS record identifies a mail exchanger for a domain?	{"AAAA record","MX record","CNAME record","NS record"}	2	\N	1.00	2026-11-19 02:38:43.994222+05:30	f	[]	[]
1148	1	Q-M5-20F32884CC	5	Scenario check: A learner is reviewing this networking point: A URL identifies a resource using a scheme and location information. Which answer is correct? What is the purpose of a URL?	{"To identify the location of a resource and how to access it","To calculate a subnet mask","To detect frame errors","To assign a MAC address"}	1	\N	1.00	2026-11-19 02:38:43.996354+05:30	f	[]	[]
1149	1	Q-M5-218D68E612	5	Identify the correct networking concept or value: Which protocol sends remote terminal data without encryption by default?	{SFTP,SSH,Telnet,HTTPS}	3	\N	1.00	2026-11-19 02:38:43.998926+05:30	f	[]	[]
1150	1	Q-M5-18052D27B3	5	Which option correctly answers this question: Which protocol sends remote terminal data without encryption by default?	{HTTPS,SFTP,SSH,Telnet}	4	\N	1.00	2026-11-19 02:38:44.001129+05:30	f	[]	[]
1151	1	Q-M5-DFC06DB4B2	5	Scenario check: A learner is reviewing this networking point: MX records specify mail servers for a domain. Which answer is correct? Which DNS record identifies a mail exchanger for a domain?	{"AAAA record","CNAME record","NS record","MX record"}	4	\N	1.00	2026-11-19 02:38:44.003675+05:30	f	[]	[]
1152	1	Q-M5-912AD08DB3	5	Identify the correct networking concept or value: What is the purpose of a URL?	{"To calculate a subnet mask","To detect frame errors","To identify the location of a resource and how to access it","To assign a MAC address"}	3	\N	1.00	2026-11-19 02:38:44.005587+05:30	f	[]	[]
1153	1	Q-M5-45CACFE53A	5	Identify the correct networking concept or value: Which protocol synchronizes clocks across networked systems?	{SMTP,ICMP,TFTP,NTP}	4	\N	1.00	2026-11-19 02:38:44.008937+05:30	f	[]	[]
1154	1	Q-M5-5BA018D9E4	5	Choose the most accurate answer. What is a firewall primarily used for?	{"Replacing all routing protocols","Filtering network traffic according to security rules","Assigning domain names","Increasing cable bandwidth"}	2	\N	1.00	2026-11-19 02:38:44.011244+05:30	f	[]	[]
1155	1	Q-M5-E7DD73DD19	5	Select the best answer. Which HTTP method is commonly used to retrieve a resource?	{POST,CONNECT,GET,DELETE}	3	\N	1.00	2026-11-19 02:38:44.013981+05:30	f	[]	[]
1156	1	Q-M5-38781ABA8F	5	Choose the most accurate answer. Which DNS record identifies a mail exchanger for a domain?	{"AAAA record","MX record","CNAME record","NS record"}	2	\N	1.00	2026-11-19 02:38:44.016565+05:30	f	[]	[]
1157	1	Q-M5-EB36BF260B	5	Identify the correct networking concept or value: Which protocol is commonly used to send email between mail servers?	{POP3,SMTP,IMAP,DHCP}	2	\N	1.00	2026-11-19 02:38:44.019359+05:30	f	[]	[]
1158	1	Q-M5-824B78B827	5	Choose the most accurate answer. Which protocol is used to transfer web pages between browsers and servers?	{RIP,ARP,ICMP,HTTP}	4	\N	1.00	2026-11-19 02:38:44.022154+05:30	f	[]	[]
1159	1	Q-M5-4D9775BDAC	5	In a computer-networking context, Which protocol is used to monitor and manage network devices?	{SNMP,FTP,ARP,HTTP}	1	\N	1.00	2026-11-19 02:38:44.024439+05:30	f	[]	[]
1160	1	Q-M5-1387B80E2D	5	Select the best answer. Which protocol is used to monitor and manage network devices?	{ARP,FTP,HTTP,SNMP}	4	\N	1.00	2026-11-19 02:38:44.026663+05:30	f	[]	[]
1161	1	Q-M5-42F6E4A42A	5	Which option correctly answers this question: Which DNS record maps a hostname to an IPv4 address?	{"PTR record","TXT record","A record","MX record"}	3	\N	1.00	2026-11-19 02:38:44.02935+05:30	f	[]	[]
1162	1	Q-M5-687FE3321E	5	Scenario check: A learner is reviewing this networking point: SMTP is used to submit and relay email. Which answer is correct? Which protocol is commonly used to send email between mail servers?	{IMAP,SMTP,POP3,DHCP}	2	\N	1.00	2026-11-19 02:38:44.031114+05:30	f	[]	[]
1163	1	Q-M5-4AC14BED50	5	Scenario check: A learner is reviewing this networking point: Network Time Protocol synchronizes system clocks. Which answer is correct? Which protocol synchronizes clocks across networked systems?	{ICMP,TFTP,SMTP,NTP}	4	\N	1.00	2026-11-19 02:38:44.032537+05:30	f	[]	[]
1164	1	Q-M5-1468497112	5	Identify the correct networking concept or value: Which HTTP method is commonly used to retrieve a resource?	{GET,POST,CONNECT,DELETE}	1	\N	1.00	2026-11-19 02:38:44.034269+05:30	f	[]	[]
1165	1	Q-M5-DA070861AD	5	Choose the most accurate answer. Which protocol is used for file transfer in its traditional form?	{DNS,DHCP,ICMP,FTP}	4	\N	1.00	2026-11-19 02:38:44.03702+05:30	f	[]	[]
1166	1	Q-M5-1A5B502BDA	5	In a computer-networking context, Which protocol sends remote terminal data without encryption by default?	{Telnet,SFTP,SSH,HTTPS}	1	\N	1.00	2026-11-19 02:38:44.040135+05:30	f	[]	[]
1167	1	Q-M5-3F9352F898	5	Select the best answer. What is a firewall primarily used for?	{"Assigning domain names","Filtering network traffic according to security rules","Increasing cable bandwidth","Replacing all routing protocols"}	2	\N	1.00	2026-11-19 02:38:44.041958+05:30	f	[]	[]
1168	1	Q-M5-47CDABBD8F	5	In a computer-networking context, Which DNS record identifies a mail exchanger for a domain?	{"MX record","NS record","CNAME record","AAAA record"}	1	\N	1.00	2026-11-19 02:38:44.043484+05:30	f	[]	[]
1169	1	Q-M5-BE021BF894	5	Select the best answer. Which DNS record maps a hostname to an IPv6 address?	{"AAAA record","SOA record","MX record","A record"}	1	\N	1.00	2026-11-19 02:38:44.044993+05:30	f	[]	[]
1170	1	Q-M5-87190991DA	5	Select the best answer. Which HTTP status code indicates that the requested resource was not found?	{"201 Created","304 Not Modified","404 Not Found","200 OK"}	3	\N	1.00	2026-11-19 02:38:44.046517+05:30	f	[]	[]
\.


--
-- Data for Name: relogin_authorization; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.relogin_authorization (id, session_id, student_usn, assigned_workstation_id, target_workstation_id, token_id, token_hash, reason, status, authorized_by, authorized_at, expires_at, is_one_time_used, created_at) FROM stdin;
\.


--
-- Data for Name: secure_package; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.secure_package (id, session_id, package_uid, encrypted_payload, encrypted_key_hex, iv_hex, signature_hex, digest_hex, status, exported_at, exported_by, created_at) FROM stdin;
\.


--
-- Data for Name: security_violation_log; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.security_violation_log (id, session_id, student_usn, workstation_id, violation_type, label, description, current_question_index, remaining_seconds, answered_count, logged_at) FROM stdin;
\.


--
-- Data for Name: session_roster_snapshot; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.session_roster_snapshot (session_id, student_id, usn, full_name, date_of_birth) FROM stdin;
\.


--
-- Data for Name: session_token; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.session_token (token_hash, account_id, expires) FROM stdin;
b9477ea3c5d5ac40f7816010920424c8e1f6f215f3a6504fc6c7cb9829862800	1	2026-11-19 11:22:58.026066+05:30
8031cfb8d4405ca93de1d86fae73f94f86546014e2a091e7ed146a4ff6823db7	3	2026-11-19 11:30:44.854259+05:30
32a0a624d192036fdec15443ed37ec8e990d0f92fbc2798e4591b8b5de6ef15e	1	2026-11-19 11:30:48.573249+05:30
aa826ab114348227ed5d8e44101e2f4965d5846558712108a8dde281e611fa11	2	2026-11-19 11:30:52.233317+05:30
88df9c84134247e361932e3e05c6bb4e14f1eb1c13d8f21e7e5c088266a43943	5	2026-11-19 11:30:55.906816+05:30
13b6f5252bc834c04826c07cd45299561b8cf06114713aea09037f6cc4465deb	4	2026-11-19 11:30:59.872161+05:30
947ed296e468b9ee55e8cf502f93eade443cdcf2e6ea350877e87755ae4956ed	15	2026-11-19 03:31:31.202187+05:30
7cf20ba8eadddbab5b2b153d55b8860fe112c090b86a7b37d259f540eb8de69b	3	2026-11-19 11:54:56.377783+05:30
86a12f88f8acfc831793fa37537e4ed2cdddc56e56824e6cc75f2f51c77c6bb6	5	2026-11-19 12:12:55.586442+05:30
dd4e4eff6cd1a646244fc50c81be780360f63b63839640b9f2c9c863fa84a2dd	5	2026-11-19 12:13:03.674929+05:30
22baf85e21e55be54b3fc56ea26a78ee36b5671306df0c59bff76e966096135e	5	2026-11-19 12:13:28.348168+05:30
841ec3b47db9a7b4da25d5edfbc6a87d72b16bd52a6d6f240f536fb181eb4083	5	2026-11-19 12:13:38.079596+05:30
ec265d4de90bd8e67ff613c05cab7ccfca1c3119b8e86a850be5d50b1fbd77b7	5	2026-11-19 12:14:36.922492+05:30
304460888b54ada7220f495e7cbbe72c1ba6120c2ec4bd7b34052a203bfbdc32	5	2026-11-19 12:21:30.150637+05:30
47ea46ed050324300f3b6c980d9912476e380793204ad65871ad2a2eebcfecaa	5	2026-11-19 12:21:41.600549+05:30
4510327a2140732393ccd0df304abef1ced8252c78922c9136cf7d3454a2a21a	5	2026-11-19 12:31:07.975057+05:30
4276c1d67c68e1d044b9a011cd2bb83494616272b5a7aaf93f00d5db656b8c36	5	2026-11-19 12:32:56.315008+05:30
8493e027fdb533889f4625660209dfaec5e6fdbd4f0d99b99f863186322e47b1	1	2026-11-19 12:55:09.808657+05:30
1a492ff8d46e689dacf1869c08ec2f0d2e5790c690a9f5459a42e9e4d93a5864	1	2026-11-19 12:55:38.526622+05:30
bffeb17408ed5086482f69e54fd812397dc45f773f03e1a3119e206cc539b4d7	5	2026-11-19 12:59:45.709387+05:30
abe0a49f9d7600a29b0650cfe85f3268290fbd8e98e2f1599fd8bf734161382c	5	2026-11-19 13:00:01.505968+05:30
7188b6e9ff07f1302db4856e77734397bbc54875072d97daede467ec7a97bef1	5	2026-11-19 13:00:12.198452+05:30
cbb1575054854aa7ed31a1a50511bebab2208d42ee6221b4d8fd0c6511985baf	5	2026-11-19 13:00:28.369817+05:30
985350bde5d820639a70cde7cdfb0fe571ac3e852d8639b758dd71f06d24981a	5	2026-11-19 13:00:59.82463+05:30
25405f9f38e9d324bcf923fa634d578bc98cb55f7bdf4e68282f45bba0a45262	5	2026-11-19 13:02:10.01654+05:30
3b1226655f79e3d4bd484bfa726d8c125ebecfccc301bfc564a305b37e045fea	5	2026-11-19 13:04:38.865686+05:30
94e7e4a3bac5d7392bc52f89161ac8bb15b9b51cd9c619f60f37cde73d013f40	5	2026-11-19 13:08:25.352796+05:30
c7dc8f04caa07a67ba62b372cbcee4dbc470983a19dbb6fc8f8277abe797ab9e	1	2026-11-19 13:12:04.4025+05:30
dae5db5613c9604b527f43af9266867e93524a16244150b6a3979e0bbcdc53a1	5	2026-11-19 13:12:55.769729+05:30
4a5d66bce32a6d4fdc8c20fef7c56407aba9c6aeb0cd887759dc82b14b1f490b	5	2026-11-19 13:16:59.596013+05:30
fa6bc63dc42561bba582c6584e86dfcded76fbd64e4d49061bbf63e2a3dce4f4	5	2026-11-19 13:20:29.210721+05:30
1e751389669a03cd23c5d47ce19b9bda670d8f42ab694298866c6690c7ffc636	16	2026-11-19 05:21:24.949549+05:30
a890a4efd080b8e047419e3e2936204ef3a2d4703bb208115e61618a8276490a	16	2026-11-19 05:25:28.679998+05:30
ecc559813eec14de1230bd140b2b0e24101eb820ae8166dafacb9494f4011d26	16	2026-11-19 05:28:06.448071+05:30
07d6f4544b4c03f8feb470069f1c6c6ca8844ae8de4a68b7e99deb952beda8f0	16	2026-11-19 05:34:28.026867+05:30
5e29aeae55df223263ee53a390e7ac386a11c481c3a7d61d46fe34c1e0ec0dc5	5	2026-11-19 13:43:06.054327+05:30
7b61770521745d1984f3589e0e7b2045287d69b20330f35f3a123e0ec30ce795	3	2026-11-19 13:48:13.576084+05:30
5bc3704479debadd152b86e197bd99f09c681ea886dfe8f7e8507c1f73fb6ac0	3	2026-11-19 13:48:50.055657+05:30
25c36e409376316a5f0543dc87bfd0b79f96f426ac8104971cd1caabdf7e8a95	5	2026-11-19 14:03:02.803358+05:30
5219ad9aa82cbe8a0a35811153c6b75e4ec805619b3358e8a17b11bd8adfa353	5	2026-11-19 14:03:31.047222+05:30
6071f01e027c8db97a1d344a2637f3a8ba8cfbec371ba37c647936650c3090f3	5	2026-11-19 14:03:51.364534+05:30
71bec82f92b75a1cd41babc647dc21292c7a5fa51880969d956d9994a4023595	5	2026-11-19 14:04:21.415303+05:30
ea4a0d1a4b54cf16327b4bce1079f1e3cf1485e846403dcb334cb19a483da253	5	2026-11-19 14:04:37.912403+05:30
567a691e9a5e9a0b34d58af39c7fbac74493e8709703329d871d0980161e9369	5	2026-11-19 14:05:29.159237+05:30
503aaa38dd809e6e65c418eb6a58db30cab0d004f5a588f93dd168f83707c832	5	2026-11-19 14:11:39.300674+05:30
a1b46e3995e6a7124593bd82ec67d10db2cb67c9402fcdcb796706d923206816	5	2026-11-19 14:12:33.091241+05:30
57e1c82e88b9e1e98498660a6d08d15ab8c56f70339f4d0bcf1d81040ef3165d	5	2026-11-19 14:14:08.307445+05:30
bb33e0c8d950eb63592c604a35a302951f6afa76f7e065f935cddbc13416cba8	5	2026-11-19 14:14:20.122015+05:30
42de37efdd6a0e3e06a1f40a158a9d63434fad8be9abcf1f34a931a4e40e2527	5	2026-11-19 14:14:34.54988+05:30
3594d67eb1e7268c64bf01c2d3d714d3fb8e840ce6b3181c7a8d2ef78b72a36a	5	2026-11-19 14:14:46.095234+05:30
279f09b210ed9253e5bd777b42b7bd34a0a082db555e3444d866adb7d6d1fa6a	5	2026-11-19 14:15:05.898454+05:30
8eedf90cff5817cc187b831a79b2d825bcf0cf446b206333b585a14afa543bbe	5	2026-11-19 14:15:57.82254+05:30
e1dab544289855f1b2879ee8305b2a71da537eb4c43a695be06d7e7092965834	5	2026-11-19 14:30:45.16617+05:30
ea19bd2707d1ea54452aaaf9a9bf6afb425f40b7c668c251f1892fbe2c3a04cd	5	2026-11-19 14:34:35.030427+05:30
49a31c332786d869e94e5cfac285df3c086a5e867cd1c45e98be3b500895bc3f	5	2026-11-19 14:34:52.641067+05:30
ce731986ed8064cb904ad7790550872bc2d06ece3fab69f846701b0112c6fa91	5	2026-11-19 14:35:28.286068+05:30
\.


--
-- Data for Name: session_transfer_history; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.session_transfer_history (id, session_id, student_usn, from_workstation, to_workstation, authorization_id, reason, transferred_by, transferred_at) FROM stdin;
\.


--
-- Data for Name: session_unlock_credential; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.session_unlock_credential (id, session_id, sitting_name, masked_preview, verifier_hash, salt, iterations, revision, status, generated_by, generated_at, expires_at, last_synced_at) FROM stdin;
\.


--
-- Data for Name: student_roster; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.student_roster (id, usn, full_name, date_of_birth, group_id, department_id, semester, section, created_at) FROM stdin;
1	4MH25CS021	Candidate 4MH25CS021	2007-01-07	1	1	4	A	2026-11-18 23:31:29.349634+05:30
5	4MH24CS004	Amrutha Hegde	2006-05-15	45	2	5	C	2026-11-18 23:45:20.283055+05:30
6	4MH24CS005	Ananya Shetty	2005-09-18	45	2	5	C	2026-11-18 23:45:20.284187+05:30
7	4MH24CS006	Anirudh Bhat	2005-09-03	45	2	5	C	2026-11-18 23:45:20.285053+05:30
8	4MH24CS007	Apoorva Nayak	2005-08-23	45	2	5	C	2026-11-18 23:45:20.28594+05:30
9	4MH24CS008	Arjun Deshpande	2005-07-11	45	2	5	C	2026-11-18 23:45:20.286626+05:30
10	4MH24CS009	Bhavana Kamath	2006-05-13	45	2	5	C	2026-11-18 23:45:20.287379+05:30
11	4MH24CS010	Chetan Kumar M	2005-06-22	45	2	5	C	2026-11-18 23:45:20.288091+05:30
12	4MH24CS011	Darshan Patil	2006-04-12	45	2	5	C	2026-11-18 23:45:20.288756+05:30
13	4MH24CS012	Deepika Joshi	2006-05-15	45	2	5	C	2026-11-18 23:45:20.289454+05:30
14	4MH24CS013	Dhanush Urs	2006-07-31	45	2	5	C	2026-11-18 23:45:20.290068+05:30
15	4MH24CS014	Divya Murthy	2006-02-04	45	2	5	C	2026-11-18 23:45:20.290593+05:30
16	4MH24CS015	Gagan Prasad	2005-06-14	45	2	5	C	2026-11-18 23:45:20.291116+05:30
17	4MH24CS016	Harshitha N	2006-02-27	45	2	5	C	2026-11-18 23:45:20.291602+05:30
18	4MH24CS017	Karthik Acharya	2005-12-03	45	2	5	C	2026-11-18 23:45:20.292234+05:30
19	4MH24CS018	Kavya Hegde	2005-05-17	45	2	5	C	2026-11-18 23:45:20.292734+05:30
20	4MH24CS019	Keerthana S	2005-05-16	45	2	5	C	2026-11-18 23:45:20.293173+05:30
21	4MH24CS020	Manoj Gowda	2005-06-17	45	2	5	C	2026-11-18 23:45:20.293607+05:30
22	4MH24CS021	Meghana Pai	2005-08-20	45	2	5	C	2026-11-18 23:45:20.294077+05:30
23	4MH24CS022	Nikhil Sharma	2005-08-28	45	2	5	C	2026-11-18 23:45:20.294586+05:30
24	4MH24CS023	Nithya Shree R	2006-01-14	45	2	5	C	2026-11-18 23:45:20.295358+05:30
25	4MH24CS024	Pranav Shenoy	2006-03-05	45	2	5	C	2026-11-18 23:45:20.296435+05:30
26	4MH24CS025	Priyanka Kulkarni	2005-05-14	45	2	5	C	2026-11-18 23:45:20.297536+05:30
27	4MH24CS026	Rakshith V	2006-02-12	45	2	5	C	2026-11-18 23:45:20.298718+05:30
28	4MH24CS027	Rohan Menon	2005-08-10	45	2	5	C	2026-11-18 23:45:20.299307+05:30
29	4MH24CS028	Sahana Bharadwaj	2006-05-02	45	2	5	C	2026-11-18 23:45:20.299773+05:30
30	4MH24CS029	Shreyas Alva	2006-03-29	45	2	5	C	2026-11-18 23:45:20.300219+05:30
31	4MH24CS030	Sneha Raj	2006-04-25	45	2	5	C	2026-11-18 23:45:20.300669+05:30
2	4MH24CS001	Test Student 1	2004-05-15	2	2	5	A	2026-11-18 23:45:20.27564+05:30
33	4MH24CS099	Jane Doe	2004-08-20	2	2	5	A	2026-11-19 01:06:38.655896+05:30
3	4MH24CS002	Test Student 2	2004-06-12	2	2	5	A	2026-11-18 23:45:20.279408+05:30
4	4MH24CS003	Test Student 3	2004-07-18	2	2	5	A	2026-11-18 23:45:20.281356+05:30
\.


--
-- Data for Name: student_session_result; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.student_session_result (id, import_id, session_id, usn, full_name, assigned_version, total_questions, correct_count, incorrect_count, unanswered_count, score, passed, submission_status) FROM stdin;
\.


--
-- Data for Name: subject; Type: TABLE DATA; Schema: public; Owner: campusexam
--

COPY public.subject (id, code, name, department_id, semester, applicable_sections) FROM stdin;
1	MH25CS003	OS	2	5	{"Section A","Section B"}
3	21CS52	Data Structures and Algorithms	2	5	{"Section A","Section B"}
4	21CS53	Logic Design & Computer Organization	2	5	{"Section A","Section B"}
5	21CS32	Data Structures and Algorithms	2	3	{"Section A","Section B"}
6	21CS33	Logic Design & Computer Organization	2	3	{"Section A","Section B"}
\.


--
-- Name: academic_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.academic_group_id_seq', 112, true);


--
-- Name: account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.account_id_seq', 16, true);


--
-- Name: answer_key_correction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.answer_key_correction_id_seq', 1, false);


--
-- Name: attempt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.attempt_id_seq', 1, false);


--
-- Name: audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.audit_id_seq', 74, true);


--
-- Name: bank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.bank_id_seq', 1, false);


--
-- Name: computer_assignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.computer_assignment_id_seq', 1, false);


--
-- Name: course_outcome_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.course_outcome_review_id_seq', 1, false);


--
-- Name: course_outcome_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.course_outcome_revision_id_seq', 1, false);


--
-- Name: course_outcome_statement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.course_outcome_statement_id_seq', 1, false);


--
-- Name: course_outcome_submission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.course_outcome_submission_id_seq', 1, false);


--
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.department_id_seq', 55, true);


--
-- Name: exam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.exam_id_seq', 1, false);


--
-- Name: examination_cycle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.examination_cycle_id_seq', 1, true);


--
-- Name: examination_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.examination_session_id_seq', 4, true);


--
-- Name: generated_paper_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.generated_paper_id_seq', 8, true);


--
-- Name: lab_result_import_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.lab_result_import_id_seq', 1, false);


--
-- Name: paper_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.paper_version_id_seq', 1, false);


--
-- Name: question_bank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.question_bank_id_seq', 5, true);


--
-- Name: question_bank_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.question_bank_item_id_seq', 1170, true);


--
-- Name: question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.question_id_seq', 1, false);


--
-- Name: relogin_authorization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.relogin_authorization_id_seq', 1, false);


--
-- Name: secure_package_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.secure_package_id_seq', 1, false);


--
-- Name: security_violation_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.security_violation_log_id_seq', 3, true);


--
-- Name: session_transfer_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.session_transfer_history_id_seq', 1, false);


--
-- Name: session_unlock_credential_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.session_unlock_credential_id_seq', 1, false);


--
-- Name: student_roster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.student_roster_id_seq', 35, true);


--
-- Name: student_session_result_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.student_session_result_id_seq', 1, false);


--
-- Name: subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: campusexam
--

SELECT pg_catalog.setval('public.subject_id_seq', 6, true);


--
-- Name: academic_group academic_group_department_academic_session_study_year_semes_key; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.academic_group
    ADD CONSTRAINT academic_group_department_academic_session_study_year_semes_key UNIQUE (department, academic_session, study_year, semester, section);


--
-- Name: academic_group academic_group_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.academic_group
    ADD CONSTRAINT academic_group_pkey PRIMARY KEY (id);


--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- Name: account account_username_key; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_username_key UNIQUE (username);


--
-- Name: answer_key_correction answer_key_correction_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.answer_key_correction
    ADD CONSTRAINT answer_key_correction_pkey PRIMARY KEY (id);


--
-- Name: answer answer_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.answer
    ADD CONSTRAINT answer_pkey PRIMARY KEY (attempt_id, "position");


--
-- Name: assignment assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.assignment
    ADD CONSTRAINT assignment_pkey PRIMARY KEY (exam_id, student_id);


--
-- Name: attempt attempt_id_exam_id_key; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.attempt
    ADD CONSTRAINT attempt_id_exam_id_key UNIQUE (id, exam_id);


--
-- Name: attempt attempt_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.attempt
    ADD CONSTRAINT attempt_pkey PRIMARY KEY (id);


--
-- Name: audit audit_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.audit
    ADD CONSTRAINT audit_pkey PRIMARY KEY (id);


--
-- Name: bank bank_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.bank
    ADD CONSTRAINT bank_pkey PRIMARY KEY (id);


--
-- Name: bank_scope bank_scope_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.bank_scope
    ADD CONSTRAINT bank_scope_pkey PRIMARY KEY (bank_id, group_id);


--
-- Name: computer_assignment computer_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.computer_assignment
    ADD CONSTRAINT computer_assignment_pkey PRIMARY KEY (id);


--
-- Name: computer_assignment computer_assignment_session_id_computer_number_key; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.computer_assignment
    ADD CONSTRAINT computer_assignment_session_id_computer_number_key UNIQUE (session_id, computer_number);


--
-- Name: course_outcome_review course_outcome_review_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.course_outcome_review
    ADD CONSTRAINT course_outcome_review_pkey PRIMARY KEY (id);


--
-- Name: course_outcome_revision course_outcome_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.course_outcome_revision
    ADD CONSTRAINT course_outcome_revision_pkey PRIMARY KEY (id);


--
-- Name: course_outcome_revision course_outcome_revision_submission_id_revision_number_key; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.course_outcome_revision
    ADD CONSTRAINT course_outcome_revision_submission_id_revision_number_key UNIQUE (submission_id, revision_number);


--
-- Name: course_outcome_statement course_outcome_statement_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.course_outcome_statement
    ADD CONSTRAINT course_outcome_statement_pkey PRIMARY KEY (id);


--
-- Name: course_outcome_statement course_outcome_statement_revision_id_co_code_key; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.course_outcome_statement
    ADD CONSTRAINT course_outcome_statement_revision_id_co_code_key UNIQUE (revision_id, co_code);


--
-- Name: course_outcome_submission course_outcome_submission_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.course_outcome_submission
    ADD CONSTRAINT course_outcome_submission_pkey PRIMARY KEY (id);


--
-- Name: course_outcome_submission course_outcome_submission_subject_id_academic_session_key; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.course_outcome_submission
    ADD CONSTRAINT course_outcome_submission_subject_id_academic_session_key UNIQUE (subject_id, academic_session);


--
-- Name: department department_code_key; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_code_key UNIQUE (code);


--
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);


--
-- Name: exam exam_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.exam
    ADD CONSTRAINT exam_pkey PRIMARY KEY (id);


--
-- Name: exam_question exam_question_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.exam_question
    ADD CONSTRAINT exam_question_pkey PRIMARY KEY (exam_id, "position");


--
-- Name: examination_cycle examination_cycle_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.examination_cycle
    ADD CONSTRAINT examination_cycle_pkey PRIMARY KEY (id);


--
-- Name: examination_session examination_session_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.examination_session
    ADD CONSTRAINT examination_session_pkey PRIMARY KEY (id);


--
-- Name: faculty_scope faculty_scope_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.faculty_scope
    ADD CONSTRAINT faculty_scope_pkey PRIMARY KEY (faculty_id, group_id, subject_id);


--
-- Name: generated_paper generated_paper_bank_id_paper_number_key; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.generated_paper
    ADD CONSTRAINT generated_paper_bank_id_paper_number_key UNIQUE (bank_id, paper_number);


--
-- Name: generated_paper generated_paper_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.generated_paper
    ADD CONSTRAINT generated_paper_pkey PRIMARY KEY (id);


--
-- Name: generated_paper_question generated_paper_question_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.generated_paper_question
    ADD CONSTRAINT generated_paper_question_pkey PRIMARY KEY (paper_id, paper_position);


--
-- Name: lab_result_import lab_result_import_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.lab_result_import
    ADD CONSTRAINT lab_result_import_pkey PRIMARY KEY (id);


--
-- Name: lab_result_import lab_result_import_session_id_key; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.lab_result_import
    ADD CONSTRAINT lab_result_import_session_id_key UNIQUE (session_id);


--
-- Name: paper_version paper_version_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.paper_version
    ADD CONSTRAINT paper_version_pkey PRIMARY KEY (id);


--
-- Name: paper_version_question paper_version_question_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.paper_version_question
    ADD CONSTRAINT paper_version_question_pkey PRIMARY KEY (version_id, display_position);


--
-- Name: paper_version paper_version_session_id_version_letter_key; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.paper_version
    ADD CONSTRAINT paper_version_session_id_version_letter_key UNIQUE (session_id, version_letter);


--
-- Name: question_bank_item question_bank_item_bank_id_question_uid_key; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.question_bank_item
    ADD CONSTRAINT question_bank_item_bank_id_question_uid_key UNIQUE (bank_id, question_uid);


--
-- Name: question_bank_item question_bank_item_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.question_bank_item
    ADD CONSTRAINT question_bank_item_pkey PRIMARY KEY (id);


--
-- Name: question_bank question_bank_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.question_bank
    ADD CONSTRAINT question_bank_pkey PRIMARY KEY (id);


--
-- Name: question question_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- Name: relogin_authorization relogin_authorization_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.relogin_authorization
    ADD CONSTRAINT relogin_authorization_pkey PRIMARY KEY (id);


--
-- Name: relogin_authorization relogin_authorization_token_hash_key; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.relogin_authorization
    ADD CONSTRAINT relogin_authorization_token_hash_key UNIQUE (token_hash);


--
-- Name: relogin_authorization relogin_authorization_token_id_key; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.relogin_authorization
    ADD CONSTRAINT relogin_authorization_token_id_key UNIQUE (token_id);


--
-- Name: secure_package secure_package_package_uid_key; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.secure_package
    ADD CONSTRAINT secure_package_package_uid_key UNIQUE (package_uid);


--
-- Name: secure_package secure_package_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.secure_package
    ADD CONSTRAINT secure_package_pkey PRIMARY KEY (id);


--
-- Name: secure_package secure_package_session_id_key; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.secure_package
    ADD CONSTRAINT secure_package_session_id_key UNIQUE (session_id);


--
-- Name: security_violation_log security_violation_log_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.security_violation_log
    ADD CONSTRAINT security_violation_log_pkey PRIMARY KEY (id);


--
-- Name: session_roster_snapshot session_roster_snapshot_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.session_roster_snapshot
    ADD CONSTRAINT session_roster_snapshot_pkey PRIMARY KEY (session_id, student_id);


--
-- Name: session_token session_token_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.session_token
    ADD CONSTRAINT session_token_pkey PRIMARY KEY (token_hash);


--
-- Name: session_transfer_history session_transfer_history_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.session_transfer_history
    ADD CONSTRAINT session_transfer_history_pkey PRIMARY KEY (id);


--
-- Name: session_unlock_credential session_unlock_credential_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.session_unlock_credential
    ADD CONSTRAINT session_unlock_credential_pkey PRIMARY KEY (id);


--
-- Name: session_unlock_credential session_unlock_credential_session_id_sitting_name_revision_key; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.session_unlock_credential
    ADD CONSTRAINT session_unlock_credential_session_id_sitting_name_revision_key UNIQUE (session_id, sitting_name, revision);


--
-- Name: student_roster student_roster_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.student_roster
    ADD CONSTRAINT student_roster_pkey PRIMARY KEY (id);


--
-- Name: student_roster student_roster_usn_key; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.student_roster
    ADD CONSTRAINT student_roster_usn_key UNIQUE (usn);


--
-- Name: student_session_result student_session_result_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.student_session_result
    ADD CONSTRAINT student_session_result_pkey PRIMARY KEY (id);


--
-- Name: student_session_result student_session_result_session_id_usn_key; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.student_session_result
    ADD CONSTRAINT student_session_result_session_id_usn_key UNIQUE (session_id, usn);


--
-- Name: subject subject_code_key; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_code_key UNIQUE (code);


--
-- Name: subject subject_pkey; Type: CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (id);


--
-- Name: attempt_due; Type: INDEX; Schema: public; Owner: campusexam
--

CREATE INDEX attempt_due ON public.attempt USING btree (deadline) WHERE (submitted IS NULL);


--
-- Name: idx_account_dept_role; Type: INDEX; Schema: public; Owner: campusexam
--

CREATE INDEX idx_account_dept_role ON public.account USING btree (department_id, role);


--
-- Name: idx_co_submission_dept_sem; Type: INDEX; Schema: public; Owner: campusexam
--

CREATE INDEX idx_co_submission_dept_sem ON public.course_outcome_submission USING btree (department_id, semester);


--
-- Name: idx_exam_session_sched; Type: INDEX; Schema: public; Owner: campusexam
--

CREATE INDEX idx_exam_session_sched ON public.examination_session USING btree (session_date, sitting, assigned_lab);


--
-- Name: idx_key_corr_session; Type: INDEX; Schema: public; Owner: campusexam
--

CREATE INDEX idx_key_corr_session ON public.answer_key_correction USING btree (session_id, status);


--
-- Name: idx_qb_item_bank_mod; Type: INDEX; Schema: public; Owner: campusexam
--

CREATE INDEX idx_qb_item_bank_mod ON public.question_bank_item USING btree (bank_id, module_number);


--
-- Name: idx_relogin_auth_session_usn; Type: INDEX; Schema: public; Owner: campusexam
--

CREATE INDEX idx_relogin_auth_session_usn ON public.relogin_authorization USING btree (session_id, student_usn, status);


--
-- Name: idx_sec_violation_session_usn; Type: INDEX; Schema: public; Owner: campusexam
--

CREATE INDEX idx_sec_violation_session_usn ON public.security_violation_log USING btree (session_id, student_usn);


--
-- Name: idx_session_transfer_session_usn; Type: INDEX; Schema: public; Owner: campusexam
--

CREATE INDEX idx_session_transfer_session_usn ON public.session_transfer_history USING btree (session_id, student_usn);


--
-- Name: idx_student_roster_dept_sem; Type: INDEX; Schema: public; Owner: campusexam
--

CREATE INDEX idx_student_roster_dept_sem ON public.student_roster USING btree (department_id, semester, section);


--
-- Name: idx_unlock_cred_session; Type: INDEX; Schema: public; Owner: campusexam
--

CREATE INDEX idx_unlock_cred_session ON public.session_unlock_credential USING btree (session_id, status);


--
-- Name: one_active_attempt; Type: INDEX; Schema: public; Owner: campusexam
--

CREATE UNIQUE INDEX one_active_attempt ON public.attempt USING btree (exam_id, student_id) WHERE (submitted IS NULL);


--
-- Name: question_prompt_key; Type: INDEX; Schema: public; Owner: campusexam
--

CREATE UNIQUE INDEX question_prompt_key ON public.question USING btree (bank_id, lower(btrim(prompt)));


--
-- Name: uq_active_unlock_credential; Type: INDEX; Schema: public; Owner: campusexam
--

CREATE UNIQUE INDEX uq_active_unlock_credential ON public.session_unlock_credential USING btree (session_id, sitting_name) WHERE (status = 'Active'::text);


--
-- Name: academic_group academic_group_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.academic_group
    ADD CONSTRAINT academic_group_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.department(id);


--
-- Name: account account_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.department(id);


--
-- Name: account account_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.academic_group(id);


--
-- Name: answer answer_attempt_id_exam_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.answer
    ADD CONSTRAINT answer_attempt_id_exam_id_fkey FOREIGN KEY (attempt_id, exam_id) REFERENCES public.attempt(id, exam_id);


--
-- Name: answer answer_exam_id_position_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.answer
    ADD CONSTRAINT answer_exam_id_position_fkey FOREIGN KEY (exam_id, "position") REFERENCES public.exam_question(exam_id, "position");


--
-- Name: answer_key_correction answer_key_correction_decided_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.answer_key_correction
    ADD CONSTRAINT answer_key_correction_decided_by_fkey FOREIGN KEY (decided_by) REFERENCES public.account(id);


--
-- Name: answer_key_correction answer_key_correction_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.answer_key_correction
    ADD CONSTRAINT answer_key_correction_session_id_fkey FOREIGN KEY (session_id) REFERENCES public.examination_session(id) ON DELETE CASCADE;


--
-- Name: answer_key_correction answer_key_correction_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.answer_key_correction
    ADD CONSTRAINT answer_key_correction_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subject(id);


--
-- Name: answer_key_correction answer_key_correction_submitted_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.answer_key_correction
    ADD CONSTRAINT answer_key_correction_submitted_by_fkey FOREIGN KEY (submitted_by) REFERENCES public.account(id);


--
-- Name: assignment assignment_exam_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.assignment
    ADD CONSTRAINT assignment_exam_id_fkey FOREIGN KEY (exam_id) REFERENCES public.exam(id);


--
-- Name: assignment assignment_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.assignment
    ADD CONSTRAINT assignment_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.account(id);


--
-- Name: attempt attempt_exam_id_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.attempt
    ADD CONSTRAINT attempt_exam_id_student_id_fkey FOREIGN KEY (exam_id, student_id) REFERENCES public.assignment(exam_id, student_id);


--
-- Name: audit audit_actor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.audit
    ADD CONSTRAINT audit_actor_fkey FOREIGN KEY (actor) REFERENCES public.account(id);


--
-- Name: bank bank_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.bank
    ADD CONSTRAINT bank_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.account(id);


--
-- Name: bank_scope bank_scope_bank_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.bank_scope
    ADD CONSTRAINT bank_scope_bank_id_fkey FOREIGN KEY (bank_id) REFERENCES public.bank(id);


--
-- Name: bank_scope bank_scope_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.bank_scope
    ADD CONSTRAINT bank_scope_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.academic_group(id);


--
-- Name: bank bank_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.bank
    ADD CONSTRAINT bank_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subject(id);


--
-- Name: computer_assignment computer_assignment_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.computer_assignment
    ADD CONSTRAINT computer_assignment_session_id_fkey FOREIGN KEY (session_id) REFERENCES public.examination_session(id) ON DELETE CASCADE;


--
-- Name: course_outcome_review course_outcome_review_reviewed_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.course_outcome_review
    ADD CONSTRAINT course_outcome_review_reviewed_by_fkey FOREIGN KEY (reviewed_by) REFERENCES public.account(id);


--
-- Name: course_outcome_review course_outcome_review_submission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.course_outcome_review
    ADD CONSTRAINT course_outcome_review_submission_id_fkey FOREIGN KEY (submission_id) REFERENCES public.course_outcome_submission(id) ON DELETE CASCADE;


--
-- Name: course_outcome_revision course_outcome_revision_submission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.course_outcome_revision
    ADD CONSTRAINT course_outcome_revision_submission_id_fkey FOREIGN KEY (submission_id) REFERENCES public.course_outcome_submission(id) ON DELETE CASCADE;


--
-- Name: course_outcome_revision course_outcome_revision_uploaded_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.course_outcome_revision
    ADD CONSTRAINT course_outcome_revision_uploaded_by_fkey FOREIGN KEY (uploaded_by) REFERENCES public.account(id);


--
-- Name: course_outcome_statement course_outcome_statement_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.course_outcome_statement
    ADD CONSTRAINT course_outcome_statement_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES public.course_outcome_revision(id) ON DELETE CASCADE;


--
-- Name: course_outcome_submission course_outcome_submission_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.course_outcome_submission
    ADD CONSTRAINT course_outcome_submission_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.account(id);


--
-- Name: course_outcome_submission course_outcome_submission_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.course_outcome_submission
    ADD CONSTRAINT course_outcome_submission_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.department(id);


--
-- Name: course_outcome_submission course_outcome_submission_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.course_outcome_submission
    ADD CONSTRAINT course_outcome_submission_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subject(id) ON DELETE CASCADE;


--
-- Name: exam exam_bank_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.exam
    ADD CONSTRAINT exam_bank_id_fkey FOREIGN KEY (bank_id) REFERENCES public.bank(id);


--
-- Name: exam_question exam_question_exam_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.exam_question
    ADD CONSTRAINT exam_question_exam_id_fkey FOREIGN KEY (exam_id) REFERENCES public.exam(id);


--
-- Name: examination_cycle examination_cycle_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.examination_cycle
    ADD CONSTRAINT examination_cycle_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.account(id);


--
-- Name: examination_session examination_session_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.examination_session
    ADD CONSTRAINT examination_session_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.account(id);


--
-- Name: examination_session examination_session_cycle_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.examination_session
    ADD CONSTRAINT examination_session_cycle_id_fkey FOREIGN KEY (cycle_id) REFERENCES public.examination_cycle(id);


--
-- Name: examination_session examination_session_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.examination_session
    ADD CONSTRAINT examination_session_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.department(id);


--
-- Name: examination_session examination_session_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.examination_session
    ADD CONSTRAINT examination_session_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.academic_group(id);


--
-- Name: examination_session examination_session_selected_paper_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.examination_session
    ADD CONSTRAINT examination_session_selected_paper_id_fkey FOREIGN KEY (selected_paper_id) REFERENCES public.generated_paper(id);


--
-- Name: examination_session examination_session_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.examination_session
    ADD CONSTRAINT examination_session_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subject(id);


--
-- Name: faculty_scope faculty_scope_faculty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.faculty_scope
    ADD CONSTRAINT faculty_scope_faculty_id_fkey FOREIGN KEY (faculty_id) REFERENCES public.account(id);


--
-- Name: faculty_scope faculty_scope_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.faculty_scope
    ADD CONSTRAINT faculty_scope_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.academic_group(id);


--
-- Name: faculty_scope faculty_scope_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.faculty_scope
    ADD CONSTRAINT faculty_scope_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subject(id);


--
-- Name: generated_paper generated_paper_bank_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.generated_paper
    ADD CONSTRAINT generated_paper_bank_id_fkey FOREIGN KEY (bank_id) REFERENCES public.question_bank(id);


--
-- Name: generated_paper_question generated_paper_question_paper_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.generated_paper_question
    ADD CONSTRAINT generated_paper_question_paper_id_fkey FOREIGN KEY (paper_id) REFERENCES public.generated_paper(id) ON DELETE CASCADE;


--
-- Name: generated_paper_question generated_paper_question_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.generated_paper_question
    ADD CONSTRAINT generated_paper_question_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.question_bank_item(id);


--
-- Name: lab_result_import lab_result_import_approved_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.lab_result_import
    ADD CONSTRAINT lab_result_import_approved_by_fkey FOREIGN KEY (approved_by) REFERENCES public.account(id);


--
-- Name: lab_result_import lab_result_import_imported_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.lab_result_import
    ADD CONSTRAINT lab_result_import_imported_by_fkey FOREIGN KEY (imported_by) REFERENCES public.account(id);


--
-- Name: lab_result_import lab_result_import_released_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.lab_result_import
    ADD CONSTRAINT lab_result_import_released_by_fkey FOREIGN KEY (released_by) REFERENCES public.account(id);


--
-- Name: lab_result_import lab_result_import_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.lab_result_import
    ADD CONSTRAINT lab_result_import_session_id_fkey FOREIGN KEY (session_id) REFERENCES public.examination_session(id);


--
-- Name: paper_version paper_version_paper_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.paper_version
    ADD CONSTRAINT paper_version_paper_id_fkey FOREIGN KEY (paper_id) REFERENCES public.generated_paper(id);


--
-- Name: paper_version_question paper_version_question_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.paper_version_question
    ADD CONSTRAINT paper_version_question_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.question_bank_item(id);


--
-- Name: paper_version_question paper_version_question_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.paper_version_question
    ADD CONSTRAINT paper_version_question_version_id_fkey FOREIGN KEY (version_id) REFERENCES public.paper_version(id) ON DELETE CASCADE;


--
-- Name: paper_version paper_version_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.paper_version
    ADD CONSTRAINT paper_version_session_id_fkey FOREIGN KEY (session_id) REFERENCES public.examination_session(id) ON DELETE CASCADE;


--
-- Name: question_bank question_bank_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.question_bank
    ADD CONSTRAINT question_bank_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.account(id);


--
-- Name: question_bank question_bank_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.question_bank
    ADD CONSTRAINT question_bank_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.department(id);


--
-- Name: question_bank question_bank_finalized_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.question_bank
    ADD CONSTRAINT question_bank_finalized_by_fkey FOREIGN KEY (finalized_by) REFERENCES public.account(id);


--
-- Name: question question_bank_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_bank_id_fkey FOREIGN KEY (bank_id) REFERENCES public.bank(id);


--
-- Name: question_bank_item question_bank_item_bank_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.question_bank_item
    ADD CONSTRAINT question_bank_item_bank_id_fkey FOREIGN KEY (bank_id) REFERENCES public.question_bank(id) ON DELETE CASCADE;


--
-- Name: question_bank question_bank_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.question_bank
    ADD CONSTRAINT question_bank_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subject(id);


--
-- Name: relogin_authorization relogin_authorization_authorized_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.relogin_authorization
    ADD CONSTRAINT relogin_authorization_authorized_by_fkey FOREIGN KEY (authorized_by) REFERENCES public.account(id);


--
-- Name: relogin_authorization relogin_authorization_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.relogin_authorization
    ADD CONSTRAINT relogin_authorization_session_id_fkey FOREIGN KEY (session_id) REFERENCES public.examination_session(id) ON DELETE CASCADE;


--
-- Name: secure_package secure_package_exported_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.secure_package
    ADD CONSTRAINT secure_package_exported_by_fkey FOREIGN KEY (exported_by) REFERENCES public.account(id);


--
-- Name: secure_package secure_package_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.secure_package
    ADD CONSTRAINT secure_package_session_id_fkey FOREIGN KEY (session_id) REFERENCES public.examination_session(id);


--
-- Name: security_violation_log security_violation_log_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.security_violation_log
    ADD CONSTRAINT security_violation_log_session_id_fkey FOREIGN KEY (session_id) REFERENCES public.examination_session(id) ON DELETE CASCADE;


--
-- Name: session_roster_snapshot session_roster_snapshot_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.session_roster_snapshot
    ADD CONSTRAINT session_roster_snapshot_session_id_fkey FOREIGN KEY (session_id) REFERENCES public.examination_session(id) ON DELETE CASCADE;


--
-- Name: session_roster_snapshot session_roster_snapshot_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.session_roster_snapshot
    ADD CONSTRAINT session_roster_snapshot_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student_roster(id);


--
-- Name: session_token session_token_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.session_token
    ADD CONSTRAINT session_token_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id) ON DELETE CASCADE;


--
-- Name: session_transfer_history session_transfer_history_authorization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.session_transfer_history
    ADD CONSTRAINT session_transfer_history_authorization_id_fkey FOREIGN KEY (authorization_id) REFERENCES public.relogin_authorization(id);


--
-- Name: session_transfer_history session_transfer_history_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.session_transfer_history
    ADD CONSTRAINT session_transfer_history_session_id_fkey FOREIGN KEY (session_id) REFERENCES public.examination_session(id) ON DELETE CASCADE;


--
-- Name: session_transfer_history session_transfer_history_transferred_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.session_transfer_history
    ADD CONSTRAINT session_transfer_history_transferred_by_fkey FOREIGN KEY (transferred_by) REFERENCES public.account(id);


--
-- Name: session_unlock_credential session_unlock_credential_generated_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.session_unlock_credential
    ADD CONSTRAINT session_unlock_credential_generated_by_fkey FOREIGN KEY (generated_by) REFERENCES public.account(id);


--
-- Name: session_unlock_credential session_unlock_credential_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.session_unlock_credential
    ADD CONSTRAINT session_unlock_credential_session_id_fkey FOREIGN KEY (session_id) REFERENCES public.examination_session(id) ON DELETE CASCADE;


--
-- Name: student_roster student_roster_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.student_roster
    ADD CONSTRAINT student_roster_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.department(id);


--
-- Name: student_roster student_roster_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.student_roster
    ADD CONSTRAINT student_roster_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.academic_group(id);


--
-- Name: student_session_result student_session_result_import_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.student_session_result
    ADD CONSTRAINT student_session_result_import_id_fkey FOREIGN KEY (import_id) REFERENCES public.lab_result_import(id) ON DELETE CASCADE;


--
-- Name: student_session_result student_session_result_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.student_session_result
    ADD CONSTRAINT student_session_result_session_id_fkey FOREIGN KEY (session_id) REFERENCES public.examination_session(id);


--
-- Name: subject subject_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: campusexam
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.department(id);


--
-- PostgreSQL database dump complete
--

\unrestrict mxiTuDsqcmILNh1v8k6eVDy57OzcWV3s8BMauuSoEARfZtaNmBLtOFa2fD1GDKT

