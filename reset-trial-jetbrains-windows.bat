@echo off
NET SESSION >nul 2>&1
IF %errorLevel% NEQ 0 (
    echo This script requires administrator privileges.
    echo Please right-click on the script and select "Run as administrator"
    pause
    exit /B 1
)

SETLOCAL
REM Only remove specific evaluation-related files
IF EXIST "%APPDATA%\JetBrains" (
    del "%APPDATA%\JetBrains\PermanentUserId"
    del "%APPDATA%\JetBrains\PermanentDeviceId"
    del "%APPDATA%\JetBrains\*\*.key"
    del "%APPDATA%\JetBrains\*\*.license"
    del "%APPDATA%\JetBrains\*\bl"
    del "%APPDATA%\JetBrains\*\crl"
)

REM Clear JavaSoft registry entries
REG DELETE "HKEY_CURRENT_USER\Software\JavaSoft" /f

ENDLOCAL