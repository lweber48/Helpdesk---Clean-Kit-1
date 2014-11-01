@ECHO OFF
COLOR 5E

SETLOCAL ENABLEDELAYEDEXPANSION

For %%I In (D:,E:,F:,G:,H:,I:,J:,K:,L:,M:,N:,O:,P:,Q:,R:,S:,T:,U:,V:,W:,X:,Y:,Z:) Do If Exist "%%I\Tools\wget.exe" SET DRIVE=!DRIVE!%%I

ECHO.
ECHO.
ECHO         Alfred University - Clean Kit
ECHO.
ECHO            Administrative Console
ECHO *************************************************
ECHO.
ECHO.
ECHO Please Note: This utility is extremely powerful
ECHO    It is only to be used as a last resort
ECHO.
ECHO There is a very good chance that computer will not
ECHO  boot after running this program, and even if it 
ECHO does it may be crippled. If you changed your mind,
ECHO            close this window now. 
ECHO. 
ECHO.
ECHO Otherwise:
ECHO.
pause
ECHO.
CLS
ECHO.
ECHO.
ECHO         Alfred University - Clean Kit
ECHO.
ECHO             Administrative Console
ECHO *************************************************
ECHO.
ECHO            Downloading Combofix...
ECHO.
mkdir %TEMP%\Combofix
%DRIVE%\TOOLS\HSTART /NOCONSOLE /WAIT "%DRIVE%\TOOLS\WGET -P %DRIVE%\Tools\ --quiet http://download.bleepingcomputer.com/sUBs/ComboFix.exe"
ECHO.
ECHO Download Successful
ECHO.
pause
ECHO.
ECHO             Running Combofix...
START /WAIT %TEMP%\Combofix\Combofix.exe
ECHO. 
ECHO Combofix finished successfully
ECHO. 
pause
ECHO.
ECHO Cleaning up...
del /F /Q %TEMP%\Combofix\*.*
rmdir %TEMP%\Combofix
EXIT