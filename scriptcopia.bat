@echo off
xcopy /E C:\Windows\SYSVOL E:\
echo La carpeta se ha copiado %date% a las %time% >> E:\Registro.log
pause
