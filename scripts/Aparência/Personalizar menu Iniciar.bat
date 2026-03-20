@echo off
REM ============================================================
REM  Personalizar menu Iniciar — Windows 11
REM ============================================================

REM Remove recomendações de apps no menu Iniciar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_IrisRecommendations /t REG_DWORD /d 0 /f

REM Desativa conteúdo de conta de consumidor (apps sugeridos)
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v DisableConsumerAccountStateContent /t REG_DWORD /d 1 /f

REM Desativa dicas e sugestões no menu Iniciar
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableSoftLanding /t REG_DWORD /d 1 /f

REM Desativa ações sugeridas (Smart Clipboard)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SmartActionPlatform\SmartClipboard" /v Disabled /t REG_DWORD /d 1 /f

REM Desativa experiências personalizadas com dados de diagnóstico
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f

REM Desativa notificações de engajamento do perfil
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v ScoobeSystemSettingEnabled /t REG_DWORD /d 0 /f

REM Desativa conteúdo subscrito variado
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-310093Enabled /t REG_DWORD /d 0 /f

echo Menu Iniciar personalizado.
pause
