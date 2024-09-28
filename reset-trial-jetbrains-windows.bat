@echo off
SETLOCAL

REM Delete registry key and JetBrains folder
IF EXIST "%APPDATA%\JetBrains" (
    del "%APPDATA%\JetBrains\PermanentUserId"
    del "%APPDATA%\JetBrains\PermanentDeviceId"
    del "%APPDATA%\JetBrains\*\*.key"
    del "%APPDATA%\JetBrains\*\*.license"
    del "%APPDATA%\JetBrains\*\bl"
    del "%APPDATA%\JetBrains\*\crl"
)

REG DELETE "HKEY_CURRENT_USER\Software\JavaSoft" /f

ENDLOCAL