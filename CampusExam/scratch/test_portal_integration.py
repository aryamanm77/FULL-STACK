"""
Comprehensive Multi-Portal Integration Test
Maharaja Institute of Technology Mysore Examination Management System
Tests:
- Admin Portal (Principal & HOD v1 routes)
- COE Portal (COE v1 routes)
- Student Portal & Lab Server (Student CBT, Security lockdown, Atomic Re-login)
"""
import urllib.request
import urllib.parse
import json
import sys

BASE = "http://127.0.0.1:8080/api/"

def request(path, method="GET", data=None, token=None, headers=None):
    url = BASE + path
    hdrs = {}
    if token:
        hdrs["Authorization"] = f"Bearer {token}"
    if headers:
        hdrs.update(headers)
    req_data = None
    if data is not None:
        if isinstance(data, dict):
            req_data = json.dumps(data).encode("utf-8")
            hdrs["Content-Type"] = "application/json"
        elif isinstance(data, (bytes, str)):
            req_data = data.encode("utf-8") if isinstance(data, str) else data
    req = urllib.request.Request(url, data=req_data, headers=hdrs, method=method)
    try:
        with urllib.request.urlopen(req, timeout=10) as resp:
            resp_bytes = resp.read()
            content_type = resp.headers.get("Content-Type", "")
            if "application/json" in content_type:
                return resp.status, json.loads(resp_bytes.decode("utf-8")), resp.headers
            return resp.status, resp_bytes, resp.headers
    except urllib.error.HTTPError as e:
        body = e.read()
        try:
            return e.code, json.loads(body.decode("utf-8")), e.headers
        except Exception:
            return e.code, body, e.headers

def run_tests():
    print("==================================================================")
    print("STAGE 0 & 1: ADMIN PORTAL (PRINCIPAL & HOD) VERIFICATION")
    print("==================================================================")
    
    # 1. Health check
    status, body, _ = request("v1/health")
    assert status == 200 and body.get("success") is True, f"Health check failed: {body}"
    print("✓ v1/health passed")

    # 2. Admin / Principal Login
    status, body, _ = request("v1/auth/login", method="POST", data={"username": "admin", "password": "password1234"})
    assert status == 200 and body.get("success") is True, f"Principal login failed: {body}"
    admin_token = body["data"]["token"]
    admin_user = body["data"]["user"]
    assert admin_user["role"] in ("PRINCIPAL", "ADMIN"), f"Unexpected role: {admin_user}"
    print(f"✓ Principal authenticated: {admin_user.get('fullName', admin_user.get('username'))} ({admin_user['role']})")

    # 3. Principal /auth/me
    status, body, _ = request("v1/auth/me", token=admin_token)
    assert status == 200 and body.get("success") is True, f"/auth/me failed: {body}"
    print("✓ Principal /auth/me verified")

    # 4. Principal Dashboard
    status, body, _ = request("v1/principal/dashboard", token=admin_token)
    assert status == 200 and body.get("success") is True, f"Principal dashboard failed: {body}"
    print(f"✓ Principal dashboard retrieved: {body['data']['summary']}")

    # 5. Principal HODs & Departments List
    status, body, _ = request("v1/principal/hods", token=admin_token)
    assert status == 200 and body.get("success") is True, f"Principal hods failed: {body}"
    departments = body["data"]["departments"]
    hod_accounts = body["data"]["hodAccounts"]
    print(f"✓ Principal HODs directory retrieved: departments = {len(departments)}, hods = {len(hod_accounts)}")

    # 6. Principal Audit Logs
    status, body, _ = request("v1/principal/audit-logs", token=admin_token)
    assert status == 200 and body.get("success") is True
    print(f"✓ Principal audit logs retrieved: count = {len(body['data']['logs'])}")

    # 7. Test HOD login
    dept_id = departments[0]["id"]
    dept_code = departments[0]["code"]
    hod_username = f"hod_{dept_code.lower()}"
    
    # Try logging in with HOD
    status, body, _ = request("v1/auth/login", method="POST", data={"username": hod_username, "password": "password1234"})
    if status != 200:
        # Create HOD via principal
        status, body, _ = request("v1/principal/hods", method="POST", token=admin_token, data={
            "departmentId": dept_id,
            "name": f"HOD {dept_code}",
            "email": f"hod.{dept_code.lower()}@mitmysore.in",
            "contactNumber": "9876543210",
            "designation": "Professor & HOD",
            "password": "password1234"
        })
        if status == 200:
            hod_username = body["data"]["username"]
            print(f"✓ Created HOD {hod_username}")
            status, body, _ = request("v1/auth/login", method="POST", data={"username": hod_username, "password": "password1234"})
    
    assert status == 200 and body.get("success") is True, f"HOD login failed: {body}"
    hod_token = body["data"]["token"]
    print(f"✓ HOD authenticated: {body['data']['user'].get('fullName', body['data']['user']['username'])} (Department: {body['data']['user']['departmentCode']})")

    # 10. HOD Dashboard
    status, body, _ = request("v1/hod/dashboard", token=hod_token)
    assert status == 200 and body.get("success") is True, f"HOD dashboard failed: {body}"
    print(f"✓ HOD dashboard verified: {body['data']['summary']}")

    # 11. HOD Subjects
    status, body, _ = request("v1/hod/subjects", token=hod_token)
    assert status == 200 and body.get("success") is True
    subjects = body["data"]
    print(f"✓ HOD subjects retrieved: count = {len(subjects)}")

    if subjects:
        subj_id = subjects[0]["id"]
        # 12. HOD Course Outcomes List
        status, body, _ = request(f"v1/hod/subjects/{subj_id}/course-outcomes", token=hod_token)
        assert status == 200 and body.get("success") is True
        print(f"✓ HOD Course Outcomes for subject {subj_id} retrieved")

        # 13. HOD Upload Course Outcomes PDF document
        boundary = "---------------------------974767299852498929531610575"
        pdf_content = b"%PDF-1.4\n1 0 obj<</Type/Catalog/Pages 2 0 R>>endobj\n2 0 obj<</Type/Pages/Count 1/Kids[3 0 R]>>endobj\n3 0 obj<</Type/Page/MediaBox[0 0 612 792]>>endobj\nxref\n0 4\n0000000000 65535 f\n0000000009 00000 n\n0000000052 00000 n\n0000000108 00000 n\ntrailer<</Size 4/Root 1 0 R>>\nstartxref\n162\n%%EOF"
        parts = []
        parts.append(f"--{boundary}\r\nContent-Disposition: form-data; name=\"file\"; filename=\"CO_Syllabus.pdf\"\r\nContent-Type: application/pdf\r\n\r\n".encode())
        parts.append(pdf_content)
        parts.append(f"\r\n--{boundary}\r\nContent-Disposition: form-data; name=\"semesterNumber\"\r\n\r\n4\r\n".encode())
        parts.append(f"--{boundary}--\r\n".encode())
        multipart_data = b"".join(parts)
        
        status, body, _ = request(
            f"v1/hod/subjects/{subj_id}/course-outcomes",
            method="POST",
            token=hod_token,
            data=multipart_data,
            headers={"Content-Type": f"multipart/form-data; boundary={boundary}"}
        )
        assert status == 200 and body.get("success") is True, f"Upload CO failed: {body}"
        doc_id = body["data"]["uploadedRevision"]["id"]
        print(f"✓ Uploaded Course Outcomes PDF document (revision id: {doc_id})")

        # 14. HOD Download Course Outcomes PDF
        status, content, hdrs = request(f"v1/hod/subjects/{subj_id}/course-outcomes/{doc_id}/file", token=hod_token)
        assert status == 200, f"Download CO failed: {status}"
        assert content.startswith(b"%PDF-"), f"Downloaded content is not PDF: {content[:20]}"
        print(f"✓ Downloaded genuine Course Outcomes PDF binary ({len(content)} bytes)")

    print("\n==================================================================")
    print("STAGE 2: COE PORTAL VERIFICATION")
    print("==================================================================")

    # 15. COE Login
    # Check if a COE user exists or create one
    status, body, _ = request("v1/auth/coe/login", method="POST", data={"username": "coe", "password": "password1234"})
    if status != 200:
        # Create COE user using admin unversioned endpoint or login
        from urllib.request import Request, urlopen
        # Admin creates COE
        req = Request(BASE + "accounts", data=urllib.parse.urlencode({
            "username": "coe_test",
            "password": "password1234",
            "role": "COE",
            "full_name": "Controller of Examinations"
        }).encode(), headers={"Authorization": f"Bearer {admin_token}", "Content-Type": "application/x-www-form-urlencoded"})
        try:
            with urlopen(req) as r:
                pass
        except Exception:
            pass
        status, body, _ = request("v1/auth/coe/login", method="POST", data={"username": "coe_test", "password": "password1234"})
    
    assert status == 200 and body.get("success") is True, f"COE login failed: {body}"
    coe_token = body["data"]["token"]
    print(f"✓ COE authenticated: {body['data']['user'].get('fullName', body['data']['user']['username'])}")

    # 16. COE Scheduled Examinations
    status, body, _ = request("v1/examinations/scheduled", token=coe_token)
    assert status == 200 and body.get("success") is True, f"COE scheduled examinations failed: {body}"
    print(f"✓ COE scheduled examinations retrieved: count = {len(body['data'])}")

    # 17. COE Course Outcomes for review
    status, body, _ = request("v1/course-outcomes", token=coe_token)
    assert status == 200 and isinstance(body, list), f"COE course outcomes failed: {body}"
    print(f"✓ COE course outcomes retrieved: count = {len(body)}")

    # 18. COE Results Examinations
    status, body, _ = request("v1/results/examinations", token=coe_token)
    assert status == 200 and isinstance(body, list), f"COE results examinations failed: {body}"
    print(f"✓ COE results examinations retrieved: count = {len(body)}")

    # 19. COE Answer Key Corrections
    status, body, _ = request("v1/results/answer-key-corrections", token=coe_token)
    assert status == 200 and isinstance(body, list), f"COE answer key corrections failed: {body}"
    print(f"✓ COE answer key corrections list retrieved: count = {len(body)}")

    print("\n==================================================================")
    print("STAGE 3: STUDENT PORTAL & LAB SERVER VERIFICATION")
    print("==================================================================")

    # 20. Student Exam Session metadata
    status, body, _ = request("student/exam-session", headers={"Authorization": "Bearer 0123456789abcdef0123456789abcdef"})
    assert status == 200, f"Student exam session failed: {body}"
    print(f"✓ Student exam session metadata: Subject: {body['subjectName']}, Passing marks: {body['passingMarks']}")

    # 21. Student Instructions
    status, body, _ = request("student/instructions")
    assert status == 200, f"Student instructions failed: {body}"
    print("✓ Student exam instructions retrieved")

    # 22. Student Sanitized Questions (Zero answer keys)
    status, body, _ = request("student/exam/questions", headers={"Authorization": "Bearer 0123456789abcdef0123456789abcdef"})
    assert status == 200, f"Student exam questions failed: {body}"
    questions = body["questions"]
    assert len(questions) > 0, "No questions received"
    # Strict check: NO answer keys or correct answers exposed
    for q in questions:
        assert "correct" not in q, f"CRITICAL SECURITY VIOLATION: 'correct' field leaked in question {q}"
        assert "correctOption" not in q, f"CRITICAL SECURITY VIOLATION: 'correctOption' field leaked in question {q}"
        assert "explanation" not in q, f"Security violation: explanation leaked in question {q}"
    print(f"✓ STRICT SECURITY PASS: Delivered {len(questions)} sanitized questions with ZERO correct answers/explanations exposed")

    # 23. Student Save Answers (Autosave)
    answer_payload = {
        "examinationId": "EXAM-2026-BCS501",
        "sessionId": "1",
        "studentUsn": "4MH24CS001",
        "questionId": "1",
        "selectedOption": "B",
        "markedForReview": False,
        "visited": True,
        "assignedVersion": "A",
        "clientSequence": 1
    }
    status, body, _ = request("student/exam/answers", method="POST", data=answer_payload, headers={"Authorization": "Bearer 0123456789abcdef0123456789abcdef"})
    assert status == 200 and body.get("success") is True, f"Save answers failed: {body}"
    print("✓ Student response autosave persisted successfully")

    # 24. Security Lockdown Violation Logging
    violation_payload = {
        "violationType": "TAB_SWITCH",
        "label": "Tab Switch Violation",
        "description": "Student navigated away from active CBT tab",
        "studentUsn": "4MH24CS001",
        "examinationId": "EXAM-2026-BCS501",
        "currentQuestionIndex": 3,
        "remainingSeconds": 2600,
        "answeredCount": 3
    }
    status, body, _ = request("security/violation", method="POST", data=violation_payload)
    assert status == 200 and body.get("success") is True, f"Security violation failed: {body}"
    print("✓ Security violation recorded and locked down")

    # 25. Security Unlock with Invigilator Password
    unlock_payload = {
        "password": "MIT@CBT2026",
        "studentUsn": "4MH24CS001"
    }
    status, body, _ = request("security/unlock", method="POST", data=unlock_payload)
    assert status == 200 and body.get("success") is True, f"Security unlock failed: {body}"
    print("✓ Security unlock verified with authorized invigilator password")

    # 26. Security Audit Logs
    status, body, _ = request("security/audit-logs")
    assert status == 200 and isinstance(body, list), f"Security audit logs failed: {body}"
    print(f"✓ Security audit logs retrieved: count = {len(body)}")

    # 27. Emergency Recovery Instructor Login
    status, body, _ = request("instructor/login", method="POST", data={"recoveryId": "EMGR-LOGIN-01", "recoveryKey": "ProTick-0011"})
    assert status == 200 and body.get("authenticated") is True, f"Instructor login failed: {body}"
    print(f"✓ Instructor authenticated for emergency recovery: token = {body['token'][:16]}...")

    # 28. Emergency Recovery Re-login Authorisations List
    status, body, _ = request("recovery/relogin-authorisations")
    assert status == 200 and isinstance(body, list), f"Recovery authorizations list failed: {body}"
    print(f"✓ Emergency recovery re-login authorizations retrieved: count = {len(body)}")

    # 29. Emergency Recovery Re-login Approval (Atomic Token Generation)
    approve_payload = {
        "studentUsn": "4MH24CS001",
        "sourceWorkstation": "LAB01-PC-03",
        "reason": "Hardware failure - blue screen on PC-03"
    }
    status, body, _ = request("recovery/relogin-authorisations/approve", method="POST", data=approve_payload, headers={"Authorization": f"Bearer {body[0]['activeTokenId'] if body and 'activeTokenId' in body[0] else 'dummy_token'}"})
    assert status == 200 and body.get("success") is True, f"Approve relogin failed: {body}"
    relogin_token = body["token"]
    print(f"✓ Emergency re-login approved: tokenId = {relogin_token['tokenId']}")

    # 30. Emergency Recovery Atomic Re-Login Token Consumption
    consume_payload = {
        "tokenId": relogin_token["tokenId"],
        "token": relogin_token["token"],
        "targetWorkstation": "LAB01-PC-15",
        "studentUsn": "4MH24CS001"
    }
    status, body, _ = request("recovery/relogin-authorisations/consume", method="POST", data=consume_payload)
    assert status == 200 and body.get("success") is True, f"Consume relogin token failed: {body}"
    print(f"✓ Atomic re-login token consumed successfully on workstation LAB01-PC-15")

    # 31. Re-attempt consuming the SAME token (Must fail due to one-time use check)
    status, body, _ = request("recovery/relogin-authorisations/consume", method="POST", data=consume_payload)
    assert status == 409 or status == 400 or (isinstance(body, dict) and body.get("success") is False), f"Double-spending prevention failed! status={status}, body={body}"
    print("✓ Anti-Replay / Double-Spending Prevention Verified: Token cannot be consumed twice")

    # 32. Session Transfer History Audit
    status, body, _ = request("recovery/transfers")
    assert status == 200 and isinstance(body, list), f"Session transfers failed: {body}"
    print(f"✓ Session transfer audit history retrieved: count = {len(body)}")

    # 33. Student Exam Submission
    status, body, _ = request("student/exam/submit", method="POST", data={}, headers={"Authorization": "Bearer 0123456789abcdef0123456789abcdef"})
    assert status == 200 and body.get("success") is True, f"Submit attempt failed: {body}"
    assert "confirmationCode" in body, f"No confirmation code in response: {body}"
    assert "score" not in body and "marks" not in body, f"Score prematurely leaked in response: {body}"
    print(f"✓ Student Exam Submitted successfully: Confirmation Code = {body['confirmationCode']}")

    print("\n==================================================================")
    print("ALL MULTI-PORTAL STAGES VERIFIED WITH 100% SUCCESS!")
    print("==================================================================")

if __name__ == "__main__":
    run_tests()
