@echo off
REM ============================================================
REM  Desativa Game Bar e Xbox — Windows 11
REM ============================================================

REM Desativa Game Bar
reg add "HKCU\Software\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\GameBar" /v UseNexusForGameBarEnabled /t REG_DWORD /d 0 /f

REM Desativa gravação em background (Game DVR)
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f

REM Desativa Xbox Game Monitoring
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f

REM Desativa notificações do Xbox
reg add "HKCU\Software\Microsoft\GameBar" /v ShowStartupPanel /t REG_DWORD /d 0 /f

REM Remove app Xbox (opcional — comentado por segurança)
REM PowerShell -Command "Get-AppxPackage *Xbox* | Remove-AppxPackage"

echo Game Bar e Xbox desativados.
pause
