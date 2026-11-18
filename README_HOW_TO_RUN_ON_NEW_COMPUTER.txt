================================================================================
  MAHARAJA INSTITUTE OF TECHNOLOGY MYSORE - OFFLINE EXAMINATION SYSTEM (PROTICK)
================================================================================

This package contains the ENTIRE system ready to run on any Windows computer:
1. Java High-Performance Offline Backend (Port 8080)
2. HOD / Admin Portal (Port 3000)
3. COE (Controller of Examinations) Portal (Port 3001)
4. Student Exam Portal with Lockdown & Offline Sync (Port 3002)
5. Smart Question Paper & Student Document Converter (Ports 5001 & 5173)
6. Complete PostgreSQL Database Dump (database_dump.sql) with all data
7. Offline PostgreSQL 16 installer (postgresql-installer.exe)

--------------------------------------------------------------------------------
PREREQUISITES ON THE NEW COMPUTER
--------------------------------------------------------------------------------
1. Windows 10 or 11 (64-bit)
2. Java JDK 17 or higher (Ensure 'java' and 'javac' are available in PATH)
3. Node.js v18 or v20+ (Ensure 'node' and 'npm' are available in PATH)
4. PostgreSQL 16 (If not already installed, use the included installer below)

--------------------------------------------------------------------------------
STEP-BY-STEP SETUP (Takes less than 2 minutes)
--------------------------------------------------------------------------------

STEP 1: INSTALL POSTGRESQL (Skip if PostgreSQL 15/16/17 is already installed)
  - Double-click: install-postgres.bat
  - This runs the included offline installer and sets the superuser password to 'password'.

STEP 2: RESTORE DATABASE & SCHEMAS
  - Double-click: setup-local-db.bat
  - This automatically creates the 'campusexam' database and user, and restores
    all preloaded questions, subjects, student records, and exam schedules from
    'database_dump.sql'.

STEP 3: START CAMPUS EXAM PORTALS
  - Double-click: start-campusexam.bat
  - This launches 4 terminal windows:
      * [Port 8080] Java Backend API
      * [Port 3000] HOD / Admin Portal:    http://localhost:3000
      * [Port 3001] COE Portal:             http://localhost:3001
      * [Port 3002] Student Exam Portal:    http://localhost:3002

STEP 4: START DOCUMENT CONVERTER (Optional, if uploading PDF/Word question banks)
  - Double-click: start-converter.bat
  - Converter Web App: http://localhost:5173

--------------------------------------------------------------------------------
DEFAULT LOGIN CREDENTIALS
--------------------------------------------------------------------------------
1. HOD / Admin Portal (http://localhost:3000)
   - Username: admin
   - Password: password1234

2. COE Portal (http://localhost:3001)
   - Username: coe
   - Password: password1234

3. Student Exam Portal (http://localhost:3002)
   - USN: 4MH21CS001 (or any student USN in the database)
   - Password: password1234

--------------------------------------------------------------------------------
CONNECTING MULTIPLE COMPUTERS IN A LAB (LAN MODE)
--------------------------------------------------------------------------------
If you want to run this computer as the Central Exam Server and let student
computers connect over LAN:
1. Double-click: configure-college-server.bat on this computer.
2. Note your LAN IP address (e.g. 192.168.1.100).
3. Student computers on the same network can access the portal via:
   http://192.168.1.100:3002
================================================================================
