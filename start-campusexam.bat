@echo off
title ProTick - CampusExam System
echo ===================================================
echo Starting CampusExam System (Backend + 3 Portals)...
echo ===================================================
cd /d "%~dp0\CampusExam"
powershell -ExecutionPolicy Bypass -File ".\start-all.ps1"
pause
