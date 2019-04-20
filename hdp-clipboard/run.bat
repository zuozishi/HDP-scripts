@ECHO OFF&PUSHD %~DP0 &TITLE "HDP Clipboard Tool"

mode con lines=20

:menu

cls
echo.
echo select a file to copy
echo ==============================
echo.
echo 1. core-site.xml
echo.
echo 2. hdfs-site.xml
echo.
echo 3. yarn-site.xml
echo.
echo q. exit
echo.
echo ==============================
echo.
echo.

set /p user_input=Input a number:
if %user_input% equ 1 call :CopyFile core-site.xml
if %user_input% equ 2 call :CopyFile hdfs-site.xml
if %user_input% equ 3 call :CopyFile yarn-site.xml
if %user_input% equ q goto end
pause
goto menu

:CopyFile
type %1 | clip
echo Copy Complete!!!

:end