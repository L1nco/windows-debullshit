@echo off
REM Ativa o plano de energia de Alto Desempenho
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

REM Desativa hibernação (libera espaço do hiberfil.sys)
powercfg /hibernate off

REM Desativa timeout de desligamento do monitor (plugado)
powercfg /change monitor-timeout-ac 0

REM Desativa suspensão automática (plugado)
powercfg /change standby-timeout-ac 0

REM Desativa Fast Startup (pode causar problemas com dual boot e drivers)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d 0 /f

echo Plano de alto desempenho ativado.
pause
