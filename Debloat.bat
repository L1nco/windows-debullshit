@rem *** Desabilitar alguns serviços ***

sc stop DiagTrack
sc stop diagnosticshub.standardcollector.service
sc stop dmwappushservice
sc stop RemoteRegistry
sc stop TrkWks
sc stop RemoteAccess
sc stop WSearch
sc stop DoSvc
sc stop ClickToRunSvc
sc stop SEMgrSvc
sc stop NvTelemetryContainer
sc stop HomeGroupListener
sc stop HomeGroupProvider
sc stop lfsvc
sc stop MapsBroke
sc stop wisvc
sc stop TapiSrv
sc stop SmsRouter
sc stop SCardSvr
sc stop RetailDemo
sc stop PhoneSvc
sc stop CDPSvc
sc stop RstMwService
sc stop DPS

sc config DiagTrack start= disabled
sc config diagnosticshub.standardcollector.service start= disabled
sc config dmwappushservice start= disabled
sc config TrkWks start= disabled
sc config WMPNetworkSvc start= disabled
sc config lmhosts start= disabled
sc config VSS start= disabled
sc config WSearch start= disabled
sc config ClickToRunSvc start= demand
sc config NvTelemetryContainer start= disabled
sc config HomeGroupListener start= disabled
sc config HomeGroupProvider start= disabled
sc config lfsvc start= disabled
sc config MapsBroke start= disabled
sc config wisvc start= disabled
sc config TapiSrv start= disabled
sc config SmsRouter start= disabled
sc config SCardSvr start= disabled
sc config RetailDemo start= disabled
sc config PhoneSvc start= disabled
sc config CDPSvc start= disabled
sc config RstMwService start= disabled
sc config DPS start= disabled

REM *** Tweaks de tarefas agendadas ***

schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable
schtasks /Change /TN "Microsoft\Office\Office Automatic Updates 2.0" /Disable
schtasks /Change /TN "Microsoft\Office\Office ClickToRun Service Monitor" /Disable
schtasks /Change /TN "Microsoft\Office\Office Feature Updates" /Disable
schtasks /Change /TN "Microsoft\Office\Office Feature Updates Logon" /Disable
schtasks /Change /TN "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Disable
schtasks /Change /TN "MicrosoftEdgeUpdateTaskMachineCore" /Disable
schtasks /Change /TN "MicrosoftEdgeUpdateTaskMachineUA" /Disable
schtasks /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /Disable *** Not sure if should be disabled, maybe related to S.M.A.R.T.
schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable
schtasks /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /Disable

REM *** Dark Mode Janelas Win32 ***
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v ColorPrevalence /t REG_DWORD /d 1 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v AccentColor /t REG_DWORD /d 171717 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v AccentColorInactive /t REG_DWORD /d 444444 /f

REM ***Desabilitar transparencia***

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 1 /f

REM *** Desabilitar Localização ***

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d Deny /f

REM *** Desabilitar conteúdos sugeridos nas configurações ***

REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /d 0 /t REG_DWORD /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /d 0 /t REG_DWORD /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /d 0 /t REG_DWORD /f

REM *** Desabilitar propagandas no Explorador de Arquivos ***

REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /d 0 /t REG_DWORD /f

REM *** Desabilitar Dicas e Sugestões ***

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableSoftLanding" /d 1 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f

REM *** Desabilitar busca do bing na pesquisa ***

REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /V BingSearchEnabled /T REG_DWORD /D 0 /F

REM *** Desabilitar busca web na barra de pesquisa ***
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /V BingSearchEnabled /T REG_DWORD /D 0 /F
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V DisableSearchBoxSuggestions /T REG_DWORD /D 1 /F

REM *** Desabilitar dicionário pessoal ***
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\InkingAndTypingPersonalization" /v Value /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Personalization\Settings" /v AcceptedPrivacyPolicy /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\InputPersonalization" /v RestrictImplicitInkCollection /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\InputPersonalization" /v RestrictImplicitTextCollection /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\InputPersonalization\TrainedDataStore" /v HarvestContacts /t REG_DWORD /d 0 /f

REM *** Desabilitar frequencia de comentários ***
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v DoNotShowFeedbackNotifications /t REG_DWORD /d 1 /f

REM *** Desabilitar historico de atividades ***
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableActivityFeed /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v PublishUserActivities /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v UploadUserActivities /t REG_DWORD /d 0 /f

REM *** Desabilitar historico de pesquisa ***
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v IsDeviceSearchHistoryEnabled /t REG_DWORD /d 0 /f

REM *** Desabilitar destaque de pesquisa ***
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v EnableDynamicContentInWSB /t REG_DWORD /d 0 /f

REM ***Desabilitar ID de Anuncio***
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v DisabledByGroupPolicy /t REG_DWORD /d 1 /f

REM ***Desabilitar Ações Sugeridas***
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\SmartActionPlatform\SmartClipboard" /v Disabled /t REG_DWORD /d 1 /f

REM ***Desabilitar Stickers no Desktop***
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\current\device\Stickers" /V "EnableStickers" /F

REM ***Desabilitar propagandas na tela de bloqueio**
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V "RotatingLockScreenOverlayEnabled" /T REG_DWORD /D 0 /F
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V "SubscribedContent-338387Enabled" /T REG_DWORD /D 0 /F

REM ***Desabilitar saiba mais sobre papel de parede do Spotlight**
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /V "{2cc5ca98-6485-489a-920e-b3e88a6ccce3}" /T REG_DWORD /D 1 /F

REM ***Desabilitar envio de escrita a Microsoft*
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\TextInput" /V "AllowLinguisticDataCollection" /T REG_DWORD /D 0 /F

REM *** Habilitar Finalizar tarefa na barra de tarefas ***
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\DeveloperSettings" /v TaskbarEndTask /t REG_DWORD /d 1 /f

REM *** Desabilitar Propagandas Variadas ***
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v ScoobeSystemSettingEnabled /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-310093Enabled /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_IrisRecommendations /t REG_DWORD /d 0 /f

REM *** Remover Telemetria e Coleta de Dados ***
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v DontOfferThroughWUAU /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
REG ADD HKLM\Software\Microsoft\SQMClient\Windows /v CEIPEnable /d 0 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /t REG_SZ /d Off /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "SmartScreenEnabled" /t "REG_SZ" /d "Off" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v fAllowFullControl /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\CloudContent" /v DisableConsumerAccountStateContent /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Speech" /v AllowSpeechModelUpdate /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v ConnectedSearchPrivacy /t REG_DWORD /d 3 /f

REM ***Instalar Clientes de Jogos ***
REM winget install EpicGames.EpicGamesLauncher -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install GOG.Galaxy -h -s winget --accept-source-agreements --accept-package-agreements
REM winget install ElectronicArts.EADesktop -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Valve.Steam -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Ubisoft.Connect -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Amazon.Games -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Playnite.Playnite -s winget -h --accept-source-agreements --accept-package-agreements

REM ***Instalar Frameworks ***

REM winget install Microsoft.DotNet.DesktopRuntime.3_1 -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Microsoft.DotNet.DesktopRuntime.5 -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Microsoft.DotNet.DesktopRuntime.6 -s winget -h --accept-source-agreements --accept-package-agreements

REM ***Instalar Emuladores***
REM cinst cemu -y
REM winget install DolphinEmu.DolphinEmu -s winget -h --accept-source-agreements --accept-package-agreements
REM cinst fs-uae -y
REM cinst mame -y
REM cinst nestopia -y
REM winget install PPSSPPTeam.PPSSPP -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Libretro.RetroArch -s winget -h --accept-source-agreements --accept-package-agreements
REM cinst snes9x -y
REM cinst visualboyadvance -y
REM cinst winvice -y

REM ***Instalar Drivers***
REM cinst intel-chipset-device-software -y
REM cinst intel-graphics-driver -y
REM cinst intel-rst-driver -y
REM cinst nvidia-display-driver -y
REM cinst realtek-s winget -h --accept-source-agreements --accept-package-agreementsd-audio-driver -y
REM winget install AMD.RyzenMaster -s winget -h --accept-source-agreements --accept-package-agreements

REM ***Instalar Navegadores e Programas para Internet***
REM winget install eloston.ungoogled-chromium -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Dropbox.Dropbox -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install KDE.Falkon -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Mozilla.Firefox -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Opera.Opera -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install PicoTorrent.PicoTorrent -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install VivaldiTechnologies.Vivaldi -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Microsoft.OneDrive -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install TIDALMusicAS.TIDAL -s winget -h --accept-source-agreements --accept-package-agreements

REM ***Instalar Aplicativos***
rem winget install Files-Community.Files -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install calibre.calibre -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install PeterPawlowski.foobar2000 -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install IrfanSkiljan.IrfanView -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install XBMCFoundation.Kodi -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install CodeJelly.Launchy -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install LibreOffice.LibreOffice -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install MacType.MacType -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Henry++.MemReduct -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install MKVToolNix.MKVToolNix -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install clsid2.mpc -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install 9PD88QB3BGKN -s msstore -h --accept-source-agreements --accept-package-agreements & rem mpc-be
REM cinst msiafterburner -y
REM winget install Notepad++.Notepad++ -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Microsoft.Office -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install 9WZDNCRFHVN5 -s msstore -h --accept-source-agreements --accept-package-agreements & rem Calculadora
REM cinst oldcalc -y
REM cinst openal -y
REM winget install 9NBHCS1LX4R0 -s msstore -h --accept-source-agreements --accept-package-agreements & rem paint.net
REM winget install QL-Win.QuickLook -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install QuiteRSS.QuiteRSS -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install PunkLabs.RocketDock -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Piriform.Speccy -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install SumatraPDF.SumatraPDF -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install RandomEngy.VidCoder -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install VideoLAN.VLC -s winget -h --accept-source-agreements --accept-package-agreements
REM cinst windowblinds -y
REM winget install Microsoft.winfile -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install 9NBLGGH404XM -s msstore -h --accept-source-agreements --accept-package-agreements & rem xplorer² lite
REM winget install ModernFlyouts.ModernFlyouts -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Files-Community.Files -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Open-Shell.Open-Shell-Menu -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install t1m0thyj.WinDynamicDesktop -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install File-New-Project.EarTrumpet -s winget -h --accept-source-agreements --accept-package-agreements

REM ***Instalar Utilitários***
REM winget install 7zip.7zip -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install 7zip.7zipAlpha -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install BleachBit.BleachBit -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Piriform.CCleaner -s winget -h --accept-source-agreements --accept-package-agreements
REM cinst compactgui -y
REM winget install CPUID.CPU-Z -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Piriform.Defraggler -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Microsoft.DirectX -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install ESET.Nod32 -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install ESET.Security -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install flux.flux -s winget -h --accept-source-agreements --accept-package-agreements
REM cinst kis -y
REM winget install TechPowerUp.GPU-Z -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install REALiX.HWiNFO -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Microsoft.PowerToys -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Rainmeter.Rainmeter -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Piriform.Recuva -s winget -h --accept-source-agreements --accept-package-agreements
REM cinst regscanner -y
REM winget install den4b.ReNamer -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install AntibodySoftware.WizTree -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Microsoft.WindowsTerminal -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Lexikos.AutoHotkey -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install CodeSector.TeraCopy -s winget -h --accept-source-agreements --accept-package-agreements


