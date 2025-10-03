@echo off
REM ------------------------------
REM Pre-run script to download a file on Windows, show progress and file size
REM ------------------------------

REM Set the URL of the file to download
SET FILE_URL=https://examplefile.com/file-download/340

REM Set the filename
SET FILE_NAME=requirements.txt

REM Temporary folder (current working directory)
SET TEMP_FOLDER=%CD%
echo Downloading to temporary folder: %TEMP_FOLDER%

REM Download the file using PowerShell with progress
powershell -Command ^
    "$wc = New-Object System.Net.WebClient; ^
    $wc.DownloadFile('%FILE_URL%', '%TEMP_FOLDER%\%FILE_NAME%'); ^
    $size = (Get-Item '%TEMP_FOLDER%\%FILE_NAME%').Length; ^
    Write-Host '✅ File downloaded successfully: %TEMP_FOLDER%\%FILE_NAME%'; ^
    Write-Host '📦 File size: ' ([math]::Round($size/1KB,2)) ' KB'"

IF %ERRORLEVEL% EQU 0 (
    echo Download step completed
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

