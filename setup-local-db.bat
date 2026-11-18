@echo off
title Setup CampusExam Database
echo ================================================================
echo Initializing Local CampusExam PostgreSQL Database
echo ================================================================
powershell -ExecutionPolicy Bypass -File "%~dp0init-local-db.ps1"
pause
