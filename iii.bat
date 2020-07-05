@echo off
SET "CDIR=%~dp0"
SET "CDIR=%cd%"
:: for loop requires removing trailing backslash from %~dp0 output
SET "CDIR=%CDIR:~0,-1%"
FOR %%i IN ("%CDIR%") DO SET "PARENTFOLDERNAME=%%~nxi"
ECHO Parent folder: %PARENTFOLDERNAME%
ECHO Full path: %~dp0

@setlocal enableextensions enabledelayedexpansion
set str1=%~dp0
if not x%str1:workspace=%==x%str1% goto copiar
endlocal
goto end

:copiar
echo Copiando...
REM del C:\inetpub\wwwroot\sandbox\www\%PARENTFOLDERNAME%\ /S
XCopy *.* C:\inetpub\wwwroot\sandbox\www\%PARENTFOLDERNAME%\ /D /F /Y /S

:localhosttest
Echo Testing on localhost
REM se trata de armar aqui la ruta que abrira automaticamente 

"C:\Program Files\Mozilla Firefox\firefox.exe" http://localhost:9080/sandbox/www/index.html

:end