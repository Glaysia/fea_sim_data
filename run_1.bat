@echo off
REM run_1.bat
REM Usage: run_1.bat INDEX

REM index argument
SET "INDEX=%~1"

REM Path to Python executable
SET "PYTHON=.\.venv\Scripts\python.exe"
REM Path to the script you want to run
SET "SCRIPT=.\script.py"

:LOOP
REM print timestamp and start message
echo [%DATE% %TIME%] Starting script.py...
REM execute the target script
"%PYTHON%" "%SCRIPT%" "%INDEX%"
REM capture exit code
SET "RETCODE=%ERRORLEVEL%"
REM wait 10 seconds without break
timeout /t 10 /nobreak >nul
REM print timestamp and restart message
echo [%DATE% %TIME%] script.py exited (code=%RETCODE%). Restarting...
goto :LOOP
