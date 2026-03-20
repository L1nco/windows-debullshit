@echo off
REM ============================================================
REM  Desativa serviços na inicialização — compatível Windows 11
REM ============================================================

REM Telemetria permanente
sc config DiagTrack start= disabled
sc config diagnosticshub.standardcollector.service start= disabled
sc config dmwappushservice start= disabled

REM Rastreamento de arquivos
sc config TrkWks start= disabled

REM Serviço legado de mídia (Windows Media Player Network)
sc config WMPNetworkSvc start= disabled

REM Resolução NetBIOS
sc config lmhosts start= disabled

REM Busca do Windows
sc config WSearch start= disabled

REM Office Click-to-Run sob demanda (não desativa, só coloca manual)
sc config ClickToRunSvc start= demand

REM Telemetria NVIDIA (se instalada)
sc config NvTelemetryContainer start= disabled

REM Sensores de localização
sc config lfsvc start= disabled

REM Mapas offline
sc config MapsBroker start= disabled

REM Insider Service
sc config wisvc start= disabled

REM Telefonia
sc config TapiSrv start= disabled

REM Smart Card
sc config SCardSvr start= disabled

REM Retail Demo
sc config RetailDemo start= disabled

REM Telefonia móvel
sc config PhoneSvc start= disabled

REM Dispositivos conectados
sc config CDPSvc start= disabled

REM Diagnóstico
sc config DPS start= disabled

REM Relatórios de erro
sc config WerSvc start= disabled

echo Configuracao de inicializacao de servicos concluida.
pause
