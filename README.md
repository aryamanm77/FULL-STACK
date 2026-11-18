# ProTick - Comprehensive Examination System & Smart Document Converter
**Maharaja Institute of Technology Mysore (MIT Mysore)**  
*An Autonomous Institution Affiliated to VTU, Belagavi · Approved by AICTE, New Delhi*

---

## 🏛 Overview

ProTick is an enterprise-grade, offline-first examination management platform tailored for autonomous engineering colleges. The system provides airtight exam security, instant local failover, seamless question paper conversion, and dedicated portals for Academic Administrators (HOD), the Controller of Examinations (COE), and Students.

---

## 📦 System Architecture & Portals

The complete solution is composed of the following interconnected systems:

| Service / Portal | Port | Technology | Purpose |
| :--- | :--- | :--- | :--- |
| **High-Performance Core Backend** | `8080` | Java 17, PostgreSQL, JDBC | High-concurrency offline exam state engine, question bank management, grading engine, and lockdown violation monitor. |
| **HOD / Admin Portal** | `3000` | React, TypeScript, Tailwind CSS, Vite | Subject configuration, student list imports, question uploads, answer key mapping, and publishing to COE. |
| **COE Portal** | `3001` | React, TypeScript, Tailwind CSS, Vite | Final exam approval, scheduling, room allocations, real-time proctoring, and grade sheet generation. |
| **Student Exam Portal** | `3002` | React, TypeScript, Tailwind CSS, Vite | Secure student testing environment with fullscreen lockdown, tab-switch penalties, and offline response sync. |
| **Smart Document Converter** | `5001` (API) <br> `5173` (UI) | Express, Vite, Mammoth, Tesseract OCR, ExcelJS | Converts raw Word (.docx) and PDF question banks into structured, module-segregated multi-sheet Excel question banks. |

---

## 🚀 Quick Start Guide

### Prerequisites
- **Operating System**: Windows 10 or 11 (64-bit)
- **Java**: JDK 17 or higher (Ensure `java` and `javac` are in your PATH)
- **Node.js**: v18 or v20+ (Ensure `node` and `npm` are in your PATH)
- **PostgreSQL**: PostgreSQL 15, 16, or 17 (Default port: `5432`)

---

### Step 1: Database Setup
1. Run `install-postgres.bat` (if PostgreSQL is not already installed; it will install or download PostgreSQL 16 unattended with password `password`).
2. Run `setup-local-db.bat`.
   - This automatically creates the `campusexam` database and user.
   - It automatically restores the full pre-configured database state from `database_dump.sql` (including sample subjects, questions, student rosters, and schedules).

### Step 2: Install Node Dependencies (First time only)
In each frontend folder, install dependencies:
```bash
# Admin Portal
cd CampusExam/frontend/admin-portal && npm install

# COE Portal
cd ../coe-portal && npm install

# Student Portal
cd "../student-portal (Final)" && npm install

# Smart Converter
cd ../../../Converter && npm install
```
*(Note: If using the pre-packaged offline zip release, all `node_modules` are already included!)*

### Step 3: Launch All Systems
- **Double-click `start-campusexam.bat`**:
  Launches the Java Core Backend (8080), Admin Portal (3000), COE Portal (3001), and Student Portal (3002).
- **Double-click `start-converter.bat`**:
  Launches the Smart Document Converter UI and API.

---

## 🔐 Default Credentials

| Portal | URL | Default Username | Default Password |
| :--- | :--- | :--- | :--- |
| **Admin / HOD Portal** | `http://localhost:3000` | `admin` | `password1234` |
| **COE Portal** | `http://localhost:3001` | `coe` | `password1234` |
| **Student Exam Portal** | `http://localhost:3002` | `4MH21CS001` (or any valid USN) | `password1234` |

---

## 🛡 Exam Security & Lockdown Features
- **Fullscreen Enforcement**: Students cannot exit full-screen mode without triggering an exam lockdown warning.
- **Tab-Switch & Blur Detection**: Leaving the exam tab registers a security violation.
- **Three-Strike Lockdown**: After 3 recorded violations, the test screen locks completely and requires an invigilator/admin override code to resume.
- **Offline Response Sync**: Answers are buffered in encrypted local storage and continuously synchronized with the Java backend every few seconds.

---

## 📂 Repository Layout
```text
├── CampusExam/
│   ├── CampusExam.java             # Core Java Backend (Single-binary architecture)
│   ├── lib/postgresql.jar          # Official PostgreSQL JDBC Driver
│   ├── schema.sql                  # Relational Schema Definition
│   ├── database_dump.sql           # Complete Database State Dump
│   ├── run.ps1                     # Backend compilation and startup script
│   ├── start-all.ps1               # Multi-portal orchestration script
│   └── frontend/
│       ├── admin-portal/           # HOD & Academic Management UI
│       ├── coe-portal/             # Controller of Examinations UI
│       └── student-portal (Final)/ # High-Security Student Examination UI
├── Converter/                      # Intelligent Question Paper & OCR Conversion Engine
│   ├── client/                     # Converter React/Vite SPA
│   ├── server/                     # Mammoth, OCR, & Excel Generation API
│   └── package.json
├── database_dump.sql               # Authoritative PostgreSQL Dump
├── setup-local-db.bat              # Automated 1-Click Database Setup
├── start-campusexam.bat            # 1-Click Multi-Portal Launcher
├── start-converter.bat            # 1-Click Document Converter Launcher
├── install-postgres.bat            # Automated PostgreSQL 16 Installer
└── README_HOW_TO_RUN_ON_NEW_COMPUTER.txt
```

---
*Developed for Maharaja Institute of Technology Mysore.*
