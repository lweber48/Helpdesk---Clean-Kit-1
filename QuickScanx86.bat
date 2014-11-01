@ECHO OFF
COLOR 5E

SETLOCAL ENABLEDELAYEDEXPANSION

For %%I In (D:,E:,F:,G:,H:,I:,J:,K:,L:,M:,N:,O:,P:,Q:,R:,S:,T:,U:,V:,W:,X:,Y:,Z:) Do If Exist "%%I\Tools\wget.exe" SET DRIVE=!DRIVE!%%I

ECHO.
ECHO.
ECHO      Alfred University - Clean Kit
ECHO ***************************************
ECHO.
ECHO.
ECHO Stopping malicious processes and services...
START /WAIT %DRIVE%\Tools\rkill.exe
ECHO.
ECHO.
ECHO  Downloading virus scan tools...
ECHO.
CALL :DOWNLOAD
ECHO.
ECHO  Scanning for infected files...
ECHO.
CALL :SCAN
ECHO.
ECHO  Scan Results:
ECHO.
ECHO.
CALL :RESULTS
ECHO.
PAUSE
ECHO.
ECHO  Cleaning Up...
ECHO.
CALL :CLEANUP
ECHO.
PAUSE

GOTO :EOF

:DOWNLOAD

%DRIVE%\Tools\HSTART /NOCONSOLE /WAIT "%DRIVE%\Tools\wget -P %DRIVE%\Tools\ --quiet http://downloadcenter.mcafee.com/products/mcafee-avert/stinger/stinger.exe"

GOTO :EOF

:SCAN

START /WAIT %DRIVE%\Tools\stinger --SILENT --GO --DELETE

START /WAIT %DRIVE%\Tools\MSRTx86.exe /Q

GOTO :EOF

:RESULTS

type %DRIVE%\Tools\stinger.txt

GOTO :EOF

:CLEANUP

%DRIVE%\Tools\HSTART /NOCONSOLE /WAIT "%DRIVE%\Tools\CCleaner.exe /AUTO"

del %DRIVE%\Tools\stinger*.*

GOTO :EOF
EXIT