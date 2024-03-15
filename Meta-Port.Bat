@echo off

:: Initialization
title MetaTrader5 Environment
color 0E
cd /d "%~dp0"
echo.
echo Script Initialized...
echo.
echo.

:: Launching MetaTrader 5 in Portable Mode
echo Launching MetaTrader 5 in Portable Mode..
start "" ".\terminal64.exe" /portable
echo ..MetaTrader 5 Launched.
echo.
timeout /t 1 /nobreak >nul

:: Script Exit
echo.
echo ...Script Complete.
timeout /t 5 /nobreak >nul
exit
