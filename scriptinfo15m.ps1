date >> C:\log\infoproces.dat
echo "1. Los valores que estan consumiendo mas de 25MB de memoria virtual." >> C:\log\infoproces.dat
echo "---------------------------------------------------------------------" >> C:\log\infoproces.dat
Get-Process | where {$_.virtualmemorysize -gt 250000000} | sort-object virtualmemorysize -descending >> C:\log\infoproces.dat
echo "2. Los valores cuya zona de memoria establecida para trabajar sea mayor a 50MB." >> C:\log\infoproces.dat
echo "---------------------------------------------------------------------" >> C:\log\infoproces.dat
(Get-Process).where{$_.WS-gt 50MB} >> C:\log\infoproces.dat
echo "3. Los procesos que estén consumiendo más del 5% de la CPU." >> C:\log\infoproces.dat
echo "---------------------------------------------------------------------" >> C:\log\infoproces.dat
Get-Process | Where-Object { $_.CPU -gt 5 } >> C:\log\infoproces.dat
echo "4. Número de procesos que se están ejecutando en el sistema." >> C:\log\infoproces.dat
echo "---------------------------------------------------------------------" >> C:\log\infoproces.dat
(Get-Process).count >> C:\log\infoproces.dat
