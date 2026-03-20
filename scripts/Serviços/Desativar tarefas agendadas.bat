@echo off
REM ============================================================
REM  Desativa tarefas agendadas — compatível com Windows 11
REM ============================================================

REM Avaliação de compatibilidade do Windows
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable 2>nul

REM Atualização de dados de programas
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable 2>nul

REM Telemetria de inicialização
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable 2>nul

REM Verificação automática de disco
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable 2>nul

REM Telemetria CEIP
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable 2>nul
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable 2>nul

REM Diagnóstico de disco
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable 2>nul

REM Benchmark automático
schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable 2>nul

REM Diagnóstico energético
schtasks /Change /TN "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Disable 2>nul

REM Experiência de primeira execução / OOBE
schtasks /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /Disable 2>nul

REM Diagnóstico de espaço em disco
schtasks /Change /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /Disable 2>nul

REM Coleta de informações de rede
schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable 2>nul

REM Telemetria SQM
schtasks /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /Disable 2>nul

REM Relatórios de erro
schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /Disable 2>nul

REM Feedback do Windows
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /Disable 2>nul
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /Disable 2>nul

REM Atualizações automáticas do Office (se instalado)
schtasks /Change /TN "Microsoft\Office\Office Automatic Updates 2.0" /Disable 2>nul
schtasks /Change /TN "Microsoft\Office\Office ClickToRun Service Monitor" /Disable 2>nul
schtasks /Change /TN "Microsoft\Office\Office Feature Updates" /Disable 2>nul
schtasks /Change /TN "Microsoft\Office\Office Feature Updates Logon" /Disable 2>nul

REM Atualizações do Edge (se instalado)
schtasks /Change /TN "MicrosoftEdgeUpdateTaskMachineCore" /Disable 2>nul
schtasks /Change /TN "MicrosoftEdgeUpdateTaskMachineUA" /Disable 2>nul

echo Tarefas agendadas desativadas.
pause
