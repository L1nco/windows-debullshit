@echo off
REM ============================================================
REM  Desativa Cortana — compatível com Windows 11
REM ============================================================

REM Desativa Cortana via política de grupo
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f

REM Remove integração de voz acima da tela de bloqueio
reg add "HKCU\Software\Microsoft\Speech_OneCore\Preferences" /v VoiceActivationEnableAboveLockscreen /t REG_DWORD /d 0 /f

REM Desativa ativação por voz
reg add "HKCU\Software\Microsoft\Speech_OneCore\Preferences" /v VoiceActivationOn /t REG_DWORD /d 0 /f

REM Desativa Cortana na tela de bloqueio
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortanaAboveLock /t REG_DWORD /d 0 /f

REM Desativa busca na nuvem via Cortana
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCloudSearch /t REG_DWORD /d 0 /f

REM Desativa o app Cortana no Windows 11 (via provisionamento)
PowerShell -Command "Get-AppxPackage -AllUsers *Microsoft.549981C3F5F10* | Remove-AppxPackage -AllUsers" 2>nul

echo Cortana desativada.
pause
