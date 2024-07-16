::BSCRIPT02.bat

@echo off
setlocal enabledelayedexpansion

:menu
cls
echo ----------------
echo Select a shape:
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
echo 4. Exit
echo.
echo ----------------
set /p choice="Enter your choice (1-4): "

if "%choice%"=="1" (
    call :circle
) else if "%choice%"=="2" (
    call :triangle
) else if "%choice%"=="3" (
    call :quadrilateral
) else if "%choice%"=="4" (
    call :Exit
) else (
    echo Invalid choice. Please enter a number between 1 and 3.
    timeout /t 3 >nul
    goto :menu
)

exit /b

:circle
cls
set /p radius="Enter the radius of the circle: "
set /a area=3*radius*radius
echo.
echo The area of the circle with radius %radius% is %area% square units.
pause
goto :menu

:triangle
cls
set /p a="Enter the length of side a: "
set /p b="Enter the length of side b: "
set /p c="Enter the length of side c: "

set /a s=(a+b+c)/2
set /a area=s*(s-a)*(s-b)*(s-c)

REM Newton's method for approximating square roots
set "x=%area%"
set "eps=0.0000001"
:loop
set /a "y=(x+(area/x))/2"
set /a "diff=y-x"
if %diff% lss 0 set /a "diff=-diff"
if %diff% gtr %eps% set "x=%y%" & goto loop

echo.
echo The area of the triangle is %x% square units.
pause
goto :menu




:quadrilateral
cls
set /p length="Enter the length of the quadrilateral: "
set /p width="Enter the width of the quadrilateral: "

set /a area=length*width
echo.
echo The area of the quadrilateral is %area% square units.
pause
goto :menu


:Exit
exit /b
