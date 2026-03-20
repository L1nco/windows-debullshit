@echo off
REM ============================================================
REM  Desativa acesso remoto — Windows 11
REM ============================================================

REM Desativa Assistência Remota
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v fAllowFullControl /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v fAllowToGetHelp /t REG_DWORD /d 0 /f

REM Desativa Área de Trabalho Remota
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f

REM Para e desativa o serviço de Registro Remoto
sc stop RemoteRegistry
sc config RemoteRegistry start= disabled

REM Para e desativa o serviço de Acesso Remoto
sc stop RemoteAccess
sc config RemoteAccess start= disabled

echo Acesso remoto desativado.
pause
