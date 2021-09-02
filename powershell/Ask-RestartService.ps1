# Author - ArunSK.

Param ( 
    [Parameter(Mandatory=$true)] 
    [String]$ServiceName = 'tomcat9' 
    ) 
[System.Collections.ArrayList]$ServicesToRestart = @() 

Function Get-AskDependentServices ($ServiceInput) 
{ 
    #Write-Host "Name of `$ServiceInput: $($ServiceInput.Name)" 
    #Write-Host "Number of dependents: $($ServiceInput.DependentServices.Count)" 
    If ($ServiceInput.DependentServices.Count -gt 0) 
    { 
        ForEach ($DepService in $ServiceInput.DependentServices) 
        { 
            Write-Host "Dependent of $($ServiceInput.Name): $($Service.DependentServices.Name)" 
            If ($DepService.Status -eq "Running") 
            { 
                #Write-Host "$($DepService.Name) is running." 
                $CurrentService = Get-Service -Name $DepService.Name 
                 
                # get dependancies of running service 
                Get-AskDependentServices $CurrentService                 
            } 
            Else 
            { 
                Write-Host "$($DepService.Name) is stopped. No Need to stop or start or check dependancies." 
            } 
             
        } 
    } 
    Write-Host "Service to restart $($ServiceInput.Name)" 
    if ($ServicesToRestart.Contains($ServiceInput.Name) -eq $false) 
    { 
        #Write-Host "Adding service to restart $($ServiceInput.Name)" 
        $ServicesToRestart.Add($ServiceInput.Name) 
    } 
} 
 

# Get the main service 
$Service = Get-Service -Name $ServiceName 
write-host "Service Name: $($Service)"
# Get dependancies and stop order 
Get-AskDependentServices -ServiceInput $Service 

Write-Host "*** Stopping Services ***" 
foreach($ServiceToStop in $ServicesToRestart) 
{ 
    Write-Host "Stop Service $ServiceToStop" 
    Stop-Service $ServiceToStop -Verbose -Force 
} 

Write-Host "*** Restart Services ***" 

# Reverse stop order to get start order 
$ServicesToRestart.Reverse() 
 
foreach($ServiceToStart in $ServicesToRestart) 
{ 
    Write-Host "Start Service $ServiceToStart" 
    Start-Service $ServiceToStart -Verbose 
} 
Write-Host "*** Service Restart Completed. ***" 

$Service = Get-Service -Name $ServiceName 
write-host "Service Name: $($Service)"