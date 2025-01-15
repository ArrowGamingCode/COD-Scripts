@echo off
echo This script finds where the Anti-cheat is installed.
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
echo Where is Ricochet installed?
for /f "tokens=16" %%i in ('driverquery /v ^| findstr /i "randgrid"') do set "l1=%%i"

set "location=%l1:\??\=%"
set "location=%location% of Duty HQ\Randgrid.sys"
echo %location%
pause
