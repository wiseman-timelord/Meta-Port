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

:: Check the status of %APPDATA%\MetaQuotes
if not exist "%APPDATA%\MetaQuotes\" (
    echo Metatrader requires re-installing on system.
    timeout /t 5 /nobreak >nul
    exit
)

:: If it's a directory in AppData, proceed to copy and replace
if exist "%APPDATA%\MetaQuotes\*" (
    if not exist "%FULL_METAQUOTES_PATH%\" (
        mkdir "%FULL_METAQUOTES_PATH%"
        echo ..Created MetaQuotes in the script's directory
    )
    echo Found MetaQuotes directory. Copying to script's MetaQuotes directory...
    xcopy "%APPDATA%\MetaQuotes" "%FULL_METAQUOTES_PATH%" /E /H /C /I
    if %ERRORLEVEL% neq 0 (
        echo Failed to copy MetaQuotes directory. Please check manually.
        goto EndScript
    )
    echo Copy successful. Proceeding...
)

:: Handling symbolic link scenarios
for /f "tokens=*" %%i in ('dir "%APPDATA%\MetaQuotes" /aL /b') do set LINK_TARGET=%%i
if defined LINK_TARGET (
    if not exist "%FULL_METAQUOTES_PATH%\" (
        echo Metatrader requires re-installing on system.
        timeout /t 5 /nobreak >nul
        exit
    ) else (
        :: Validate if the symbolic link points to the script's MetaQuotes directory
        if "%LINK_TARGET%" neq "%FULL_METAQUOTES_PATH%" (
            :: Update symbolic link to point to the correct directory
            rmdir "%APPDATA%\MetaQuotes"
            mklink /D "%APPDATA%\MetaQuotes" "%FULL_METAQUOTES_PATH%"
            if %ERRORLEVEL% neq 0 (
                echo Failed to create symlink. Ensure script is run as Administrator.
                goto EndScript
            )
        )
    )
)


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

:: Handle unexpected issues
:EndScript
echo.
echo An issue was encountered. Script terminating.
pause
timeout /t 5 /nobreak >nul
exit
