@echo off

goto choice

:choice
echo You sure? [Y/N]
set /P c=">"
if /I "%c%" EQU "Y" goto disk
if /I "%c%" EQU "N" goto end
goto choice

:disk
CLS
echo Current disk:%CD:~0,3%
echo.
echo Do you want to bomb this disk? [Y/N]
echo.
set /P c=">"
if /I "%c%" EQU "Y" goto start
if /I "%c%" EQU "N" goto change_disk
goto disk

:start
CLS
echo Current directory:%CD%
echo.
echo Do you want to bomb this directory? [Y/N]
echo.
set /P c=">"
if /I "%c%" EQU "Y" goto file_bomb
if /I "%c%" EQU "N" goto change_dir
goto start

:change_dir
CLS
dir
echo.
echo type 'con' if in the right directory
echo Dirctory to enter (.. to go up one)
echo.
set /P c=">"
if /I "%c%" EQU "CON" goto start
cd %c%
goto change_dir

:change_disk
CLS
fsutil fsinfo drives
echo.
echo Current disk:%CD:~0,3%
echo.
echo type 'con' if in the right disk
echo Disk to change to
echo.
set /P c=">"
if /I "%c%" EQU "CON" goto disk
%c%:
goto change_disk

:file_bomb
CLS
md %random%
goto file_bomb

:end
echo.
echo good choice
timeout /t 5