@echo off
echo This script tests if the Steam BO6 is running, along with the Anti-cheat.
echo Check https://github.com/ArrowGamingCode/ for updates.

:: Check for admin
openfiles >nul 2>&1
if %errorlevel% NEQ 0 (
    echo This must be run as an administrator!
    pause
    exit /b 1
)
echo.
driverquery | findstr /i "randgrid" >nul && ( echo Ricochet is installed ) || ( echo Ricochet not found )
echo.
echo Is Ricochet running?
for /f "tokens=6" %%i in ('driverquery /v ^| findstr /i "randgrid"') do @echo %%i
echo.

:: List of processes to check if running
set "processList=bootstrapper.exe bootstrapperCrashHandler.exe cod.exe codCrashHandler.exe codinstallcleaner.exe codinstallprep.exe"
set processList=%processList% CrashLogsGenerator.exe cod22-cod.exe codCrashHandler.exe cod23-cod.exe codCrashHandler.exe
set processList=%processList% sp22-cod.exe sp22-codCrashHandler.exe codCrashHandler.exe sp23-cod.exe codCrashHandler.exe sp24-cod.exe

echo Are these processes running?
echo.
for %%p in (%processList%) do (
    tasklist /fi "imagename eq %%p" /fo csv | findstr /i "%%p" >nul
    if errorlevel 1 (
        echo %%p - No
    ) else (
        echo %%p - Yes!
    )
)

pause
