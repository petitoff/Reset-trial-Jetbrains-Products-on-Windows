@echo off
SETLOCAL

REM Define IDE names
SET IDE_NAMES="WebStorm" "IntelliJ" "CLion" "Rider" "GoLand" "PhpStorm" "Resharper" "PyCharm"

REM Delete eval folder with license key and options.xml which contains a reference to it
FOR %%I IN (%IDE_NAMES%) DO (
    FOR /D %%a IN ("%USERPROFILE%\.%%I*") DO (
        IF EXIST "%%a\config\eval" (
            RD /S /Q "%%a\config\eval"
        )
        IF EXIST "%%a\config\options\other.xml" (
            DEL /Q "%%a\config\options\other.xml"
        )
    )
)

REM Delete registry key and JetBrains folder
IF EXIST "%APPDATA%\JetBrains" (
    RMDIR /S /Q "%APPDATA%\JetBrains"
)

REG DELETE "HKEY_CURRENT_USER\Software\JavaSoft" /f

ENDLOCAL