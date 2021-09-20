@echo off
REM Starts Google Drive if it isn't already running.

setlocal

set gdrivedir=%PROGRAMFILES%\Google\Drive File Stream\launch.bat
tasklist /fi "ImageName eq GoogleDriveFS.exe" /fo csv 2>NUL ^
    | find /I "GoogleDriveFS.exe">NUL

if %ERRORLEVEL% EQU 0 (
    REM echo Google Drive is running so everything is just fine
    exit /B 0
)
REM echo Oh noes Google Drive ain't runnin'

REM Run Google Drive...
"%gdrivedir%"

if %ERRORLEVEL% NEQ 0 (
    echo Try updating Google Drive. We expected to find %gdrivedir%
    timeout /t 10
    exit /B 1
)

endlocal
exit /B 0
