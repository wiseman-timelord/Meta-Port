@echo off

:: Initialization
title MetaEditor5 Environment
color 0E
cd /d "%~dp0"
echo.
echo Script Initialized...
echo.
echo.

:: Environment Setup
echo Setting Temporary Dirs..
SET TMP=.\temp
SET TEMP=.\temp
echo ..Temporary Directories Set.
echo.
timeout /t 1 /nobreak >nul

:: Launching MetaTrader 5 in Portable Mode
echo Launching MetaEditor 5 in Portable Mode..
start "" ".\MetaEditor64.exe" /portable
echo ..MetaEditor 5 Launched.
echo.
timeout /t 1 /nobreak >nul

:: Script Exit
echo.
echo ...Script Complete.
timeout /t 5 /nobreak >nul
exit
