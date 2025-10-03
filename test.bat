@echo off
REM ------------------------------
REM Pre-run script to download a file on Windows and check folder
REM ------------------------------

REM Set the URL of the file to download
SET FILE_URL=https://raw.githubusercontent.com/kadircorrea/sc/refs/heads/master/requirements.txt

REM Set the filename
SET FILE_NAME=requirements.txt

REM Temporary folder (current working directory)
SET TEMP_FOLDER=%CD%
echo Downloading to temporary folder: %TEMP_FOLDER%

REM Download the file using PowerShell
powershell -Command "Invoke-WebRequest -Uri '%FILE_URL%' -OutFile '%TEMP_FOLDER%\%FILE_NAME%'"

IF %ERRORLEVEL% EQU 0 (
    echo ✅ File downloaded successfully: %TEMP_FOLDER%\%FILE_NAME%
) ELSE (
    echo ❌ Download failed
    exit /b 1
)

REM Define Downloads folder
SET DOWNLOADS_FOLDER=C:\Users\sauce\Downloads
echo Copying file to Downloads folder: %DOWNLOADS_FOLDER%

REM Copy the file to Downloads folder
copy "%TEMP_FOLDER%\%FILE_NAME%" "%DOWNLOADS_FOLDER%\%FILE_NAME%" /Y

IF %ERRORLEVEL% EQU 0 (
    echo ✅ File copied successfully to Downloads folder
) ELSE (
    echo ❌ Failed to copy file to Downloads folder
    exit /b 1
)

REM List files in Downloads folder
echo -----------------------------
echo Files in Downloads folder:
dir "%DOWNLOADS_FOLDER%"
echo -----------------------------
