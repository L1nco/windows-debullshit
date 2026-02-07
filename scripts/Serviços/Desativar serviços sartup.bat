REM Desativa telemetria permanente
sc config DiagTrack start= disabled
sc config diagnosticshub.standardcollector.service start= disabled
sc config dmwappushservice start= disabled

REM Desativa rastreamento de arquivos
sc config TrkWks start= disabled

REM Serviço legado de mídia
sc config WMPNetworkSvc start= disabled

REM Resolução NetBIOS
sc config lmhosts start= disabled

REM Volume Shadow Copy
sc config VSS start= disabled

REM Busca do Windows
sc config WSearch start= disabled

REM Office Click-to-Run sob demanda
sc config ClickToRunSvc start= demand

REM Telemetria NVIDIA
sc config NvTelemetryContainer start= disabled

REM HomeGroup (obsoleto)
sc config HomeGroupListener start= disabled
sc config HomeGroupProvider start= disabled

REM Sensores de localização
sc config lfsvc start= disabled

REM Mapas offline
sc config MapsBroke start= disabled

REM Insider Service
sc config wisvc start= disabled

REM Telefonia
sc config TapiSrv start= disabled

REM SMS
sc config SmsRouter start= disabled

REM Smart Card
sc config SCardSvr start= disabled

REM Retail Demo
sc config RetailDemo start= disabled

REM Telefonia móvel
sc config PhoneSvc start= disabled

REM Dispositivos conectados
sc config CDPSvc start= disabled

REM Reset/recuperação
sc config RstMwService start= disabled

REM Diagnóstico
sc config DPS start= disabled
