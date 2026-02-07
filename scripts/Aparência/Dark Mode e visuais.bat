REM Força uso da cor de destaque na barra de título
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v ColorPrevalence /t REG_DWORD /d 1 /f

REM Define cor de destaque escura
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v AccentColor /t REG_DWORD /d 171717 /f

REM Cor da janela inativa
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v AccentColorInactive /t REG_DWORD /d 444444 /f

REM Desativa transparência do sistema
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 1 /f

REM Remove stickers do desktop
reg delete "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Stickers" /V EnableStickers /F