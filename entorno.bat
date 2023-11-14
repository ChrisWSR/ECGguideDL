@echo off

echo Verificando e instalando Python...
powershell -Command "& {if (-not(Get-Command python -ErrorAction SilentlyContinue)) {Invoke-WebRequest -Uri 'https://www.python.org/ftp/python/3.9.0/python-3.9.0-amd64.exe' -OutFile 'python-installer.exe'; Start-Process './python-installer.exe' -ArgumentList '/quiet InstallAllUsers=1 PrependPath=1' -Wait; Remove-Item 'python-installer.exe'}}"

echo Creando entorno virtual...
pip install virtualenv
virtualenv myenv

echo Activando entorno virtual...
call .\myenv\Scripts\activate

echo Instalando librerias...
pip install pandas matplotlib numpy scipy pyserial peakutils xlwt tensorflow

echo Entorno y librerias listos.
pause
