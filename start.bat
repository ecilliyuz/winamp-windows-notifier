@echo off
setlocal

:: Resolve absolute paths
set "TARGET_DIR=%~dp0"
set "TARGET_FILE=%TARGET_DIR%winamp_notify.py"
set "STARTUP_DIR=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "SHORTCUT_PATH=%STARTUP_DIR%\WinampNotify.lnk"

if not exist "%TARGET_FILE%" (
echo [ERROR] winamp_notify.py was not found in the current directory!
pause
exit /b 1
)

:: Create a silent background shortcut using pythonw.exe
powershell -NoProfile -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%SHORTCUT_PATH%');$s.TargetPath = 'pythonw.exe'; $s.Arguments = '"%TARGET_FILE%"'; $s.WorkingDirectory = '%TARGET_DIR%'; $s.WindowStyle = 7; $s.Save()"

if exist "%SHORTCUT_PATH%" (
echo [SUCCESS] Winamp Track Notifier added to Startup successfully!
echo Shortcut: %SHORTCUT_PATH%
) else (
echo [ERROR] Failed to create the startup shortcut.
)

pause