@echo off
REM ============================================================
REM  Otimizações de memória e CPU — Windows 11
REM ============================================================

REM Desativa paginação do kernel para disco (melhora RAM)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v DisablePagingExecutive /t REG_DWORD /d 1 /f

REM Aumenta cache do sistema em vez de apps
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v LargeSystemCache /t REG_DWORD /d 0 /f

REM Desativa prefetch e superfetch (SSD — pode deixar ligado em HDD)
sc config SysMain start= disabled
sc stop SysMain

REM Desativa compressão de memória automática (pode ajudar em sistemas com 16GB+)
PowerShell -Command "Disable-MMAgent -MemoryCompression" 2>nul

REM Prioriza programas em vez de serviços em background
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 26 /f

REM Desativa HPET (High Precision Event Timer) — melhora latência em jogos
bcdedit /deletevalue useplatformclock 2>nul
bcdedit /set useplatformtick yes 2>nul
bcdedit /set disabledynamictick yes 2>nul

echo Otimizacoes de memoria e CPU aplicadas.
pause
