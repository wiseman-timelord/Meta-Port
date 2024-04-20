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

::LaunchMetaTrader
echo.
echo Launching MetaTrader...
if exist ".\terminal64.exe" (
    start /min "" ".\terminal64.exe" /portable
    echo MetaTrader Launched.
) else (
    echo terminal64.exe Missing!
)
goto EOF

:: Script Exit
:EOF
echo.
echo ...Script Complete.
timeout /t 5 /nobreak >nul
exit
