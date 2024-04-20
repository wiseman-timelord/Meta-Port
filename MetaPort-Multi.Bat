@echo off

:: Initialization
title MetaEditor5 Environment
mode 40,14
color 80
cd /d "%~dp0"
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
SET TMP=.\temp
SET TEMP=.\temp
echo ..Temporary Directories Set.
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
choice /C 12X /N /M "Select; Options = 1-2, Exit = X:"

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
