:Elimina el script anterior
del archivo.txt
 
 
@echo off

echo "/  \    /  \ ____\_ |__  /   _____/|  | |__| __| _/____   ______
echo "\   \/\/   // __ \| __ \ \_____  \ |  | |  |/ __ |/ __ \ /  ___/
echo " \        /\  ___/| \_\ \/        \|  |_|  / /_/ \  ___/ \___ \ 
echo "  \__/\  /  \___  >___  /_______  /|____/__\____ |\___  >____  >
echo "       \/       \/    \/        \/              \/    \/     \/ 
	   
::Recorre el csv llamando a WriteCSV para cada linea ignorando la cabecera
for /f "skip=1 tokens=1-4 delims=;" %%a in (info.csv) do call :WriteCVS "%%a"
::Manda al final santandose el WriteCVS
GOTO Done
 
::Funcion que procesa cada fila

:WriteCVS

set curdir=%cd%
set curdrive=%~d0

echo "el drive actual es " %curdrive%

ECHO "Getting: " %~1
C:
cd "C:\Program Files (x86)\Google\Chrome\Application\" 
chrome.exe %~1
d:
cd %curdir%

ECHO Campo 1: '%~1'>>archivo.txt

pause
GOTO EOF
 
::Al terminar añade un comentario
:Done
ECHO Fin del proceso>>archivo.txt
 
 
:EOF