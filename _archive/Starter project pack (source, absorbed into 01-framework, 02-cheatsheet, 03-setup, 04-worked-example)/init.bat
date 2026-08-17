@echo off
rem ── /init — Agentic Project Scaffold (double-click entry) ──
set TARGET=%1
if "%TARGET%"=="" (
  set /p TARGET=Enter target project path: 
)
powershell.exe -NoExit -File "%~dp0init.ps1" -Target "%TARGET%"
