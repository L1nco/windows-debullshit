REM Desativa telemetria principal do Windows
sc stop DiagTrack

REM Coleta de diagnósticos avançados
sc stop diagnosticshub.standardcollector.service

REM Envio de dados push para a Microsoft
sc stop dmwappushservice

REM Acesso remoto ao registro do Windows
sc stop RemoteRegistry

REM Rastreamento de links distribuídos (legado)
sc stop TrkWks

REM Serviços de acesso remoto (VPN/Discagem)
sc stop RemoteAccess

REM Serviço de indexação e busca do Windows
sc stop WSearch

REM Delivery Optimization (update P2P)
sc stop DoSvc

REM Serviço Click-to-Run do Microsoft Office
sc stop ClickToRunSvc

REM Gerenciamento de estado do sistema
sc stop SEMgrSvc

REM Telemetria da NVIDIA
sc stop NvTelemetryContainer

REM Serviços antigos de HomeGroup
sc stop HomeGroupListener
sc stop HomeGroupProvider

REM Serviço de sensores de localização
sc stop lfsvc

REM Serviço de mapas offline
sc stop MapsBroke

REM Windows Insider Service
sc stop wisvc

REM Telefonia (TAPI)
sc stop TapiSrv

REM Serviço de SMS (dispositivos móveis)
sc stop SmsRouter

REM Smart Card
sc stop SCardSvr

REM Modo demonstração de varejo
sc stop RetailDemo

REM Telefonia móvel
sc stop PhoneSvc

REM Connected Devices Platform
sc stop CDPSvc

REM Serviço de recuperação/reset
sc stop RstMwService

REM Diagnostic Policy Service
sc stop DPS
