@echo off
title ProTick - Configure College PostgreSQL Server
echo ===================================================
echo Configure College PostgreSQL Server Connection
echo ===================================================
cd /d "%~dp0\CampusExam"
powershell -ExecutionPolicy Bypass -File ".\configure-college-db.ps1"
pause
