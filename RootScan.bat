@ECHO OFF
COLOR 5E

SETLOCAL ENABLEDELAYEDEXPANSION

For %%I In (D:,E:,F:,G:,H:,I:,J:,K:,L:,M:,N:,O:,P:,Q:,R:,S:,T:,U:,V:,W:,X:,Y:,Z:) Do If Exist "%%I\Tools\wget.exe" SET DRIVE=!DRIVE!%%I

ECHO.
ECHO.
ECHO       Alfred University - Clean Kit
ECHO *****************************************
ECHO.
ECHO.
ECHO   Downloading rootkit scannning tools...
ECHO.
CALL :DOWNLOAD
ECHO.
ECHO       Scanning for infected files
ECHO. 
ECHO           Please be patient
CALL :SCAN
ECHO.
ECHO             Scan Complete
ECHO.
PAUSE
ECHO.
ECHO             Cleaning Up...
CALL :CLEANUP
ECHO.
PAUSE

GOTO :EOF

:DOWNLOAD

MKDIR %TEMP%\TDSSKiller\

%DRIVE%\Tools\HSTART /NOCONSOLE /WAIT "%DRIVE%\Tools\wget -P %TEMP%\TDSSKiller\ --quiet http://support.kaspersky.com/downloads/utils/tdsskiller.zip"

%DRIVE%\Tools\HSTART /NOCONSOLE /WAIT "%DRIVE%\Tools\7za e -o%TEMP%\TDSSKiller\ %TEMP%\TDSSKiller\TDSSKiller.zip"

GOTO :EOF

:SCAN

START /WAIT %TEMP%\TDSSKiller\TDSSKiller.exe -dcexact -silent

GOTO :EOF

:RESULTS

type %TEMP%\TDSSKiller\log.txt

GOTO :EOF

:CLEANUP

del /F /Q %TEMP%\TDSSKiller\*.*
rmdir %TEMP%\TDSSKiller

GOTO :EOF
EXIT