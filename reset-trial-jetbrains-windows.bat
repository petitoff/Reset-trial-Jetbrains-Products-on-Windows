@echo off
title JetBrains Trial Reset Utility
color 0A
SETLOCAL EnableDelayedExpansion

echo ===================================================
echo         JetBrains Trial Reset Utility
echo ===================================================
echo.
echo This utility will reset the trial period for JetBrains products
echo by removing evaluation-related files and registry entries.
echo.
echo Please close all JetBrains applications before continuing.
echo.

NET SESSION >nul 2>&1
IF %errorLevel% NEQ 0 (
    color 0C
    echo ERROR: This script requires administrator privileges.
    echo Please right-click on the script and select "Run as administrator"
    echo.
    pause
    exit /B 1
)

echo Checking for running JetBrains processes...
set "running_processes="

for %%p in (idea64.exe pycharm64.exe webstorm64.exe phpstorm64.exe rider64.exe datagrip64.exe clion64.exe goland64.exe rubymine64.exe idea.exe pycharm.exe webstorm.exe phpstorm.exe rider.exe datagrip.exe clion.exe goland.exe rubymine.exe) do (
    tasklist /FI "IMAGENAME eq %%p" 2>NUL | find /I /C "%%p" > nul
    if !ERRORLEVEL! EQU 0 (
        if defined running_processes (
            set "running_processes=!running_processes!, %%p"
        ) else (
            set "running_processes=%%p"
        )
    )
)

if defined running_processes (
    color 0E
    echo.
    echo WARNING: The following JetBrains processes are still running:
    echo !running_processes!
    echo.
    echo Please close all JetBrains applications before continuing.
    echo.
    pause
    exit /B 1
)

echo Checking for JetBrains data...
timeout /t 1 > nul

set /p confirm=Are you sure you want to continue? [Y/N]: 
if /i "%confirm%" NEQ "Y" (
    echo Operation cancelled by user.
    pause
    exit /B 0
)

echo.
echo Processing...

set "success=0"
echo [    ] Removing evaluation files
IF EXIST "%APPDATA%\JetBrains" (
    del "%APPDATA%\JetBrains\PermanentUserId" 2>nul
    del "%APPDATA%\JetBrains\PermanentDeviceId" 2>nul
    del "%APPDATA%\JetBrains\*\*.key" 2>nul
    del "%APPDATA%\JetBrains\*\*.license" 2>nul
    del "%APPDATA%\JetBrains\*\bl" 2>nul
    del "%APPDATA%\JetBrains\*\crl" 2>nul
    set "success=1"
    echo [DONE] Removed evaluation files
) else (
    echo [ -- ] No JetBrains folder found
)

echo [    ] Clearing registry entries
REG DELETE "HKEY_CURRENT_USER\Software\JavaSoft" /f >nul 2>&1
if !errorlevel! EQU 0 (
    echo [DONE] Registry entries cleared
) else (
    echo [ -- ] No registry entries to clear
)

echo.
if "%success%"=="1" (
    color 0A
    echo ===================================================
    echo            Reset completed successfully!
    echo ===================================================
) else (
    color 0E
    echo ===================================================
    echo   No JetBrains data found or nothing was changed
    echo ===================================================
)
echo.
echo You can now restart your JetBrains applications.
echo.

ENDLOCAL
pause