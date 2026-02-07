REM Avaliação de compatibilidade do Windows
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable

REM Atualização de dados de programas
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable

REM Telemetria de inicialização
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable

REM Verificação automática de disco
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable

REM Telemetria CEIP
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable

REM Diagnóstico de disco
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable

REM Benchmark automático
schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable

REM Atualizações automáticas do Office
schtasks /Change /TN "Microsoft\Office\Office Automatic Updates 2.0" /Disable
schtasks /Change /TN "Microsoft\Office\Office ClickToRun Service Monitor" /Disable
schtasks /Change /TN "Microsoft\Office\Office Feature Updates" /Disable
schtasks /Change /TN "Microsoft\Office\Office Feature Updates Logon" /Disable

REM Diagnóstico energético
schtasks /Change /TN "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Disable

REM Atualizações do Edge
schtasks /Change /TN "MicrosoftEdgeUpdateTaskMachineCore" /Disable
schtasks /Change /TN "MicrosoftEdgeUpdateTaskMachineUA" /Disable

REM Experiência de primeira execução
schtasks /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /Disable

REM Diagnóstico de espaço em disco
schtasks /Change /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /Disable

REM Coleta de informações de rede
schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable

REM Telemetria SQM
schtasks /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /Disable

REM Relatórios de erro
schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /Disable
