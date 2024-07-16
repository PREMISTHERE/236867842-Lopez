@echo off

:menu
cls
echo ---------UTILITIES-----------
echo.
echo Select a utility:
echo 1. ipconfig
echo 2. tasklist/taskkill
echo 3. chkdsk
echo 4. format
echo 5. defrag
echo 6. find
echo 7. attrib
echo 8. Exit
echo.
echo -----------------------------
set /p choice="Enter your choice (1-8): "

if "%choice%"=="1" (
    call :ipconfig
) else if "%choice%"=="2" (
    call :tasklist_taskkill
) else if "%choice%"=="3" (
    call :chkdsk
) else if "%choice%"=="4" (
    call :format
) else if "%choice%"=="5" (
    call :defrag
) else if "%choice%"=="6" (
    call :find
) else if "%choice%"=="7" (
    call :attrib
) else if "%choice%"=="8" (
    call :exit
) else (
    echo Invalid choice. Please enter a number between 1 and 8.
    pause
    goto :menu
)

goto :menu

:ipconfig
ipconfig
pause
goto :menu

:tasklist_taskkill
cls
echo ---------------------
echo Select an option:
echo 1. Display running processes (tasklist)
echo 2. Terminate a process (taskkill)
echo 3. Back to main menu
echo ---------------------
set /p taskchoice="Enter your choice (1-3): "

if "%taskchoice%"=="1" (
    tasklist
    pause
    goto :tasklist_taskkill
) else if "%taskchoice%"=="2" (
    set /p pid="Enter the PID of the process to terminate: "
    taskkill /PID %pid% /F
    echo Process with PID %pid% terminated.
    pause
    goto :tasklist_taskkill
) else if "%taskchoice%"=="3" (
    goto :menu
) else (
    echo Invalid choice. Please enter a number between 1 and 3.
    pause
    goto :tasklist_taskkill
)

goto :menu

:chkdsk
chkdsk
pause
goto :menu

:format
cls
echo ---------------------
echo WARNING: Formatting a drive will erase all data on it.
echo ---------------------
set /p drive="Enter the drive letter you want to format (e.g., C:): "
echo Are you sure you want to format %drive%? (Y/N)
set /p confirmation=
if /i "%confirmation%"=="Y" (
    format %drive%
) else (
    echo Formatting canceled.
)
pause
goto :menu

:defrag
defrag
pause
goto :menu

:find
cls
set /p file="Enter the full path of the file you want to search within: "
if not exist "%file%" (
    echo The file "%file%" does not exist.
    pause
    goto :menu
)
set /p search="Enter the string you want to search for: "
echo.
echo Searching for "%search%" in "%file%"...
echo.
findstr /i "%search%" "%file%"
if %errorlevel%==0 (
    echo.
    echo Search completed.
) else (
    echo.
    echo No matches found for "%search%" in "%file%".
)
pause
goto :menu




:attrib
cls
set /p file="Enter the filename or directory: "
attrib %file%
pause
goto :menu

:exit
cls
pause
exit /b