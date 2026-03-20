@echo off
REM ============================================================
REM  Dark Mode e ajustes visuais — compatível com Windows 11
REM ============================================================

REM Força uso da cor de destaque na barra de título e taskbar
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v ColorPrevalence /t REG_DWORD /d 1 /f

REM Define cor de destaque escura (hex ABGR: 171717 = quase preto)
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v AccentColor /t REG_DWORD /d 171717 /f

REM Cor da janela inativa
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v AccentColorInactive /t REG_DWORD /d 444444 /f

REM Desativa transparência do sistema (0 = desativado)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f

REM Ativa tema escuro para apps
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f

REM Ativa tema escuro para o sistema (taskbar, menu iniciar)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f

REM Remove stickers do desktop (Windows 11 22H2+)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StickersEnabled" /v StickersEnabled /t REG_DWORD /d 0 /f

REM Desativa animações desnecessárias
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f

REM Desativa efeito de sombra nos ícones da área de trabalho
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewShadow /t REG_DWORD /d 0 /f

echo Configuracoes visuais aplicadas. Reinicie o Explorer para ver as mudancas.
pause
