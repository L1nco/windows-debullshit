@echo off
REM ============================================================
REM  Remove propagandas e conteúdo sugerido — Windows 11
REM ============================================================

REM Conteúdo sugerido nas configurações
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338393Enabled /d 0 /t REG_DWORD /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-353694Enabled /d 0 /t REG_DWORD /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-353696Enabled /d 0 /t REG_DWORD /f

REM Propagandas no Explorador de Arquivos
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSyncProviderNotifications /d 0 /t REG_DWORD /f

REM Desativa ID de publicidade personalizada
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /d 0 /t REG_DWORD /f

REM Desativa apps sugeridos no menu Iniciar
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SystemPaneSuggestionsEnabled /d 0 /t REG_DWORD /f

REM Desativa dicas e sugestões do Windows
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SoftLandingEnabled /d 0 /t REG_DWORD /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled /d 0 /t REG_DWORD /f

REM Desativa instalação automática de apps sugeridos
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SilentInstalledAppsEnabled /d 0 /t REG_DWORD /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v PreInstalledAppsEnabled /d 0 /t REG_DWORD /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v OemPreInstalledAppsEnabled /d 0 /t REG_DWORD /f

REM Desativa widgets de notícias e interesses
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Dsh" /v AllowNewsAndInterests /d 0 /t REG_DWORD /f

echo Propagandas e conteudo sugerido removidos.
pause
