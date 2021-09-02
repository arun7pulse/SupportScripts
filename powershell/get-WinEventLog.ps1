param (
    [string]$Computername = 'localhost',
    [datetime]$StartTimestamp,
    [datetime]$EndTimestamp = Get-Date
)

$Logs = (Get-WinEvent -ListLog * -ComputerName $Computername | Where-Object {$_.RecordCount}).LogName
$FilterTable = @{
    LogName = $Logs
    StartTime = $StartTimestamp
    EndTime = $EndTimestamp
}


Get-WinEvent -ComputerName $Computername -FilterTable $FilterTable -ErrorAction 'SilentlyContinue' | Format-Table -AutoSize