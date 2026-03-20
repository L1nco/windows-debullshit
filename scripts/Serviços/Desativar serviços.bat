@echo off
REM ============================================================
REM  Para serviços desnecessários — compatível com Windows 11
REM ============================================================

REM Telemetria principal do Windows
sc stop DiagTrack

REM Coleta de diagnósticos avançados
sc stop diagnosticshub.standardcollector.service

REM Envio de dados push para a Microsoft
sc stop dmwappushservice

REM Acesso remoto ao registro do Windows
sc stop RemoteRegistry

REM Rastreamento de links distribuídos
sc stop TrkWks

REM Serviço de indexação e busca do Windows
sc stop WSearch

REM Delivery Optimization (update P2P)
sc stop DoSvc

REM Serviço Click-to-Run do Microsoft Office (se instalado)
sc stop ClickToRunSvc

REM Gerenciamento de estado do sistema
sc stop SEMgrSvc

REM Telemetria da NVIDIA (se instalada)
sc stop NvTelemetryContainer

REM Serviço de sensores de localização
sc stop lfsvc

REM Mapas offline
sc stop MapsBroker

REM Windows Insider Service
sc stop wisvc

REM Telefonia (TAPI)
sc stop TapiSrv

REM Smart Card
sc stop SCardSvr

REM Modo demonstração de varejo
sc stop RetailDemo

REM Telefonia móvel
sc stop PhoneSvc

REM Connected Devices Platform
sc stop CDPSvc

REM Diagnostic Policy Service
sc stop DPS

REM Serviço de relatórios de erros
sc stop WerSvc

echo Servicos parados com sucesso.
pause
