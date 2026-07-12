@echo off
chcp 65001 >nul
cd /d "%~dp0"
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0CoopCutscenesPatch.ps1" -Action Restore
echo.
pause
