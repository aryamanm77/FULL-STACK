@echo off
title PostgreSQL 16 Installer - MIT CampusExam Setup
echo ================================================================
echo  Installing PostgreSQL 16 for CampusExam Local Environment
echo ================================================================
echo.

if not exist "%~dp0postgresql-installer.exe" (
    echo PostgreSQL installer not found locally in folder.
    echo Automatically downloading PostgreSQL 16 from official repository...
    powershell -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Write-Host 'Downloading (~390 MB)...' -ForegroundColor Cyan; (New-Object System.Net.WebClient).DownloadFile('https://get.enterprisedb.com/postgresql/postgresql-16.6-1-windows-x64.exe', '%~dp0postgresql-installer.exe'); Write-Host 'Download complete!' -ForegroundColor Green"
)

if not exist "%~dp0postgresql-installer.exe" (
    echo.
    echo Error: Could not download installer automatically.
    echo Please install PostgreSQL 15/16 manually from:
    echo https://www.postgresql.org/download/windows/
    pause
    exit /b 1
)

echo Starting installer with:
echo   - Port: 5432
echo   - Superuser (postgres) password: password
echo.
echo Please click "YES" if Windows asks for administrator permission.
echo.

"%~dp0postgresql-installer.exe" --mode unattended --superpassword password --servicepassword password --serverport 5432

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ================================================================
    echo  PostgreSQL 16 installed successfully!
    echo ================================================================
    echo Now initializing campusexam database and schema...
    powershell -ExecutionPolicy Bypass -File "%~dp0init-local-db.ps1"
) else (
    echo.
    echo Unattended mode finished or returned code %ERRORLEVEL%.
    echo Initializing local database...
    powershell -ExecutionPolicy Bypass -File "%~dp0init-local-db.ps1"
)

pause
