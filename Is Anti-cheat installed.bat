@echo off
echo This script tests if the Anti-cheat is installed.
echo Check https://github.com/ArrowGamingCode/ for updates.
echo.
:: Check for admin
openfiles >nul 2>&1
if %errorlevel% NEQ 0 (
    echo This must be run as an administrator!
    pause
    exit /b 1
)
driverquery | findstr /i "randgrid" >nul && ( echo/ AntiCheat Found  ) || ( echo/ AntiCheat Not Found )
pause