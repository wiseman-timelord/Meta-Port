@echo off

:: Initialization
title MetaEditor5 Environment
mode 35,26
color 80
cd /d "%~dp0"
SET "SCRIPT_DIR=%~dp0"
SET "FULL_METAQUOTES_PATH=%SCRIPT_DIR%MetaQuotes"
echo.
echo Launcher Initialized...
echo.
echo.

:: Environment Setup
echo Setting Temporary Dirs..
if not exist ".\temp\" (
    mkdir ".\temp"
    echo ..Created .\temp
)
if not exist ".\MetaQuotes\" (
    mkdir ".\MetaQuotes"
    echo ..Created .\MetaQuotes
)
SET TMP=.\temp
SET TEMP=.\temp
echo ..Temporary Directories Set.
echo.

:: Check if %APPDATA%\MetaQuotes is a directory and delete it
if exist "%APPDATA%\MetaQuotes\" (
    echo Found existing MetaQuotes directory. Attempting to delete...
    rd /s /q "%APPDATA%\MetaQuotes"
    if %ERRORLEVEL% == 0 (
        echo MetaQuotes directory deleted successfully.
    ) else (
        echo Failed to delete the MetaQuotes directory. Please check manually.
        goto EndScript
    )
)

:: Create a symlink from %APPDATA%\MetaQuotes to .\MetaQuotes
mklink /D "%APPDATA%\MetaQuotes" "%FULL_METAQUOTES_PATH%"
if %ERRORLEVEL% == 0 (
    echo Symlink created successfully.
) else (
    echo Failed to create symlink. Ensure script is run as Administrator.
)
echo.

timeout /t 1 /nobreak >nul

:: Launching MetaEditor 5 in Portable Mode
echo Launching MetaEditor 5 Portable..
if exist ".\MetaEditor64.exe" (
    start "" ".\MetaEditor64.exe" /portable
    echo ..MetaEditor 5 Portable Launched.
) else (
    echo ...MetaEditor64.exe Missing!
)
echo.
timeout /t 1 /nobreak >nul
goto EOF

:: Script Exit
:EOF
echo.
echo ...Script Complete.
pause
timeout /t 5 /nobreak >nul
exit

:: Handle unexpected issues
:EndScript
echo.
echo An issue was encountered. Script terminating.
pause
timeout /t 5 /nobreak >nul
exit
