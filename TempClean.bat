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
ECHO  Cleaning Temporary Files...
ECHO.
CALL :CLEANUP
ECHO.
PAUSE

GOTO :EOF

:CLEANUP

%DRIVE%\Tools\HSTART /NOCONSOLE /WAIT "%DRIVE%\Tools\CCleaner.exe /AUTO"

SET DRIVE=

GOTO :EOF

EXIT