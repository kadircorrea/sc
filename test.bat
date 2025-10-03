@echo off
REM ------------------------------
REM Pre-run script to download a file on Windows and check folder
REM ------------------------------

REM Set the URL of the file to download
SET FILE_URL=https://raw.githubusercontent.com/kadircorrea/sc/refs/heads/master/requirements.txt

REM Set the output filename
SET OUTPUT_FILE=requirements.txt

REM Define Downloads folder (default for IEUser)
SET DOWNLOADS_FOLDER=C:\Users\sauce\Downloads

REM Show target folder
echo Downloading to folder: %DOWNLOADS_FOLDER%

REM Download using PowerShell
powershell -Command "Invoke-WebRequest -Uri '%FILE_URL%' -OutFile '%DOWNLOADS_FOLDER%\%FILE_NAME%'"

IF %ERRORLEVEL% EQU 0 (
    echo ✅ File downloaded successfully: %DOWNLOADS_FOLDER%\%FILE_NAME%
) ELSE (
    echo ❌ Download failed
    exit /b 1
)

REM List files in Downloads folder
echo -----------------------------
echo Files in Downloads folder:
dir "%DOWNLOADS_FOLDER%"
echo -----------------------------
