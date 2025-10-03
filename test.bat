@echo off
REM ------------------------------
REM Pre-run script to download a file on Windows and check folder
REM ------------------------------

REM Set the URL of the file to download
SET FILE_URL=https://raw.githubusercontent.com/kadircorrea/sc/refs/heads/master/requirements.txt

REM Set the output filename
SET OUTPUT_FILE=requirements.txt

REM Show current working directory
echo Current working directory: %CD%

REM Download using PowerShell
powershell -Command "Invoke-WebRequest -Uri '%FILE_URL%' -OutFile '%OUTPUT_FILE%'"

IF %ERRORLEVEL% EQU 0 (
    echo ✅ File downloaded successfully: %OUTPUT_FILE%
) ELSE (
    echo ❌ Download failed
    exit /b 1
)

REM List files in current directory
echo -----------------------------
echo Files in current directory:
dir
echo -----------------------------
