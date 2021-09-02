$Header = @"
<style>
TABLE {border-width: 1px; border-style: solid; border-color: black; border-collapse: collapse;}
TH {border-width: 1px; padding: 3px; border-style: solid; border-color: black; background-color: #6495ED;}
TD {border-width: 1px; padding: 3px; border-style: solid; border-color: black;}
</style>
"@
Get-PSDrive | ConvertTo-Html -Property Name,Used,Provider,Root,CurrentLocation -Head $Header | Out-File -FilePath PSDrives.html
Get-Process | ConvertTo-Html -Head $Header -Property Name,Id, Path,Company, Cpu, Processname, Description | Out-File -FilePath PSProcess.html
Get-Service | ConvertTo-Html -Head $Header  | Out-File -FilePath PSService.html