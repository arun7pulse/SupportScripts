Write-Host "Begin a lengthy process..."
$i=0
While ($i -le 100)
{
   Start-Sleep 1
   Write-Host "."
   $i += 10
}
Write-Host "Lengthy process is complete."