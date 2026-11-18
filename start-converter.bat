@echo off
title ProTick - Smart Document Converter
echo ===================================================
echo Starting ProTick Smart Document Converter...
echo ===================================================
cd /d "%~dp0\Converter"
npm run dev
pause
