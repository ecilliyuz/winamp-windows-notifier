@echo off
setlocalset "STARTUP_DIR=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "SHORTCUT_PATH=%STARTUP_DIR%\WinampNotify.lnk":: Remove the startup shortcut
if exist "%SHORTCUT_PATH%" (
del /f /q "%SHORTCUT_PATH%"
echo [SUCCESS] Startup shortcut removed.
) else (
echo [INFO] No startup shortcut was found.
):: Terminate running background instances of winamp_notify.py
echo Stopping running background processes...
powershell -NoProfile -Command "Get-CimInstance Win32_Process | Where-Object { $_.CommandLine -like '*winamp_notify.py*' } \vert{} ForEach-Object { Stop-Process -Id$_.ProcessId -Force }" 2>nulecho [DONE] Cleanup completed.
pause