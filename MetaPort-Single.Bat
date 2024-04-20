@echo off

:: Initialization
title MetaTrader5 Environment
mode 40,14
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

:: Check if %APPDATA%\MetaQuotes exists and copy it before deletion
if exist "%APPDATA%\MetaQuotes\" (
    echo Found existing MetaQuotes directory. Copying to script's MetaQuotes directory...
    xcopy "%APPDATA%\MetaQuotes" "%FULL_METAQUOTES_PATH%" /E /H /C /I
    if %ERRORLEVEL% == 0 (
        echo Copy successful. Deleting original MetaQuotes directory...
        rd /s /q "%APPDATA%\MetaQuotes"
        if %ERRORLEVEL% == 0 (
            echo MetaQuotes directory deleted successfully.
        ) else (
            echo Failed to delete the MetaQuotes directory. Please check manually.
            goto EndScript
        )
    ) else (
        echo Failed to copy MetaQuotes directory. Please check manually.
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

:: Display menu
cls
echo.
echo.
echo         MetaTrader Launch Menu
echo         ----------------------
echo.
echo      1. MetaTrader (Terminal64.exe)
echo.
echo     2. MetaEditor (MetaEditor64.exe)
echo.
echo.
choice /C 12X /N /M "Select; Options = 1-2, Exit = X:

:: Check choice and act accordingly
if %ERRORLEVEL% equ 1 goto LaunchMetaTrader
if %ERRORLEVEL% equ 2 goto LaunchMetaEditor
if %ERRORLEVEL% equ 3 goto ExitScript

:LaunchMetaTrader
close
echo.
echo Launching MetaTrader...
if exist ".\terminal64.exe" (
    start "" ".\terminal64.exe" /portable
    echo MetaTrader Launched.
) else (
    echo terminal64.exe Missing!
)
goto EOF

:LaunchMetaEditor
close
echo.
echo Launching MetaEditor...
if exist ".\MetaEditor64.exe" (
    start "" ".\MetaEditor64.exe" /portable
    echo MetaEditor Launched.
) else (
    echo MetaEditor64.exe Missing!
)
goto EOF

:: Script Exit
:EOF
echo.
echo ...Script Complete.
timeout /t 5 /nobreak >nul
exit

:: Handle unexpected issues
:EndScript
echo.
echo An issue was encountered. Script terminating.
pause
timeout /t 5 /nobreak >nul
exit
