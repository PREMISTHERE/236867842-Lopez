@echo off
setlocal enabledelayedexpansion

REM Define source and destination folders
set SOURCE=C:\*.txt
set ARCHIVE=Z:\archive

REM Create archive directory if it doesn't exist
if not exist "%ARCHIVE%" mkdir "%ARCHIVE%"

REM List files sorted by date and move older files to archive
echo Archiving older text files...
for /f "tokens=*" %%A in ('dir "%SOURCE%" /b /o-d') do (
    echo Moving %%A to %ARCHIVE%
    move "C:\%%A" "%ARCHIVE%"
)

REM Change directory to archive
cd /d %ARCHIVE%

REM List archived files sorted by size and store them in a temp file
dir /b /o-s *.txt > sorted_files.txt

REM Display the sorted files and prompt the user for deletion
echo The following archived files are sorted by size:
type sorted_files.txt
echo.

REM Ask for user confirmation to delete files
set /p DELETE=Do you want to delete these old, large files? (y/n): 
if /i "%DELETE%"=="y" (
    for /f "tokens=*" %%B in (sorted_files.txt) do (
        del "%%B"
        echo Deleted %%B
    )
    echo All specified files have been deleted.
) else (
    echo No files were deleted.
)

REM Clean up
del sorted_files.txt

echo Script completed.
pause
