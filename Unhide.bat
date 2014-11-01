@ECHO OFF
COLOR 5E

SETLOCAL ENABLEDELAYEDEXPANSION

SET DRIVE=

For %%I In (D:,E:,F:,G:,H:,I:,J:,K:,L:,M:,N:,O:,P:,Q:,R:,S:,T:,U:,V:,W:,X:,Y:,Z:) Do If Exist "%%I\Tools\wget.exe" SET DRIVE=!DRIVE!%%I

ECHO.
ECHO.
ECHO      Alfred University - Clean Kit
ECHO ***************************************
ECHO.
ECHO.
ECHO  Stopping Malicious Processes...
ECHO.
START /WAIT %DRIVE%\Tools\rkill.exe
ECHO.
ECHO  Unhiding Files...
ECHO.
CALL :CLEANUP
ECHO.
PAUSE

GOTO :EOF

:CLEANUP

START /WAIT %DRIVE%\Tools\unhide.exe

GOTO :EOF

EXIT