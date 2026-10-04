@echo off
chcp 65001 >nul
setlocal

set "STARTUP_DIR=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "SHORTCUT_PATH=%STARTUP_DIR%\WinampNotify.lnk"

:: Remove the startup shortcut
if exist "%SHORTCUT_PATH%" (
    del /f /q "%SHORTCUT_PATH%"
    echo [SUCCESS] Startup shortcut removed.
) else (
    echo [INFO] Shortcut was not found in startup.
)

:: Terminate background pythonw processes if running (optional)
echo Terminating background winamp_notify processes...
powershell -NoProfile -Command "Get-CimInstance Win32_Process | Where-Object { $_.CommandLine -like '*winamp_notify.py*' } | ForEach-Object { Stop-Process -Id $_.ProcessId -Force }" 2>nul

echo [DONE]
pause