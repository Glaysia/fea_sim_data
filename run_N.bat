@echo off
REM run_N.bat
REM Usage: run_N.bat [N]
REM If N is omitted, defaults to 2 instances.

REM === 1. 인스턴스 수 설정 ===
if "%~1"=="" (
  set "N=4"
) else (
  set "N=%~1"
)

REM === 2. 스크립트 및 로그 디렉터리 경로 ===
set "SCRIPTDIR=%~dp0"
set "FOREVER=%SCRIPTDIR%run_1.bat"

if not exist "%SCRIPTDIR%logs" (
  mkdir "%SCRIPTDIR%logs"
)

REM === 3. 병렬 실행 ===
for /L %%i in (0,1,%N%-1) do (
  REM title: Instance %%i, /b: background, cmd /c: 뒤 명령만 실행
  start "Instance %%i" /b cmd /c ^
    ""%FOREVER%" %%i > "%SCRIPTDIR%logs\%%i.out.log" 2> "%SCRIPTDIR%logs\%%i.err.log"" 
  echo Launched instance %%i
)

REM === 4. 완료 메시지 ===
echo All %N% instances of run_1.bat have been launched.
