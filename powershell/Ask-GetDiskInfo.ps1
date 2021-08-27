
function Get-DiskDetails {
        <#
        .SYNOPSIS 
                Get disk space details
        .PARAMETER computername 
                Specifies ta single computer name or Ip Address 
        .EXAMPLE 
                Get-DiskDetails -ComputernName localhost
        .AUTHOR
                ArunSanthoshKumar Annamalai (@arun7pulse)
        #>
        [CmdletBinding()]
        param (
                [string[]]$ComputerName='localhost'
        )
        
        begin {
                Write-Debug -Message "Retrieving disk info for $ComputerName"
        }
        
        process {
                foreach($Computer in $computerName){
                        Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" -Computername $Computer |
                        Sort-Object -Property DeviceID |
                        Format-Table -AutoSize -Property @{n='ComputerName';e={$Computer}},
                                                        DeviceID,
                                                        @{n='Size(GB)';e={$_.Size / 1GB};formatstring='N2'},
                                                        @{n='FreeSpace(GB)';e={$_.FreeSpace / 1GB};formatstring='N2'},
                                                        @{n='UsedSpace(GB)';e={($_.Size - $_.FreeSpace) / 1GB};formatstring='N2'},
                                                        @{n='PercentUsed';e={(($_.Size - $_.FreeSpace)/$_.Size)*100};formatstring='N2'},
                                                        @{n='Threshhold(30%)';e={if(($_.Size * 0.70) -gt $_.FreeSpace){'Breached'} };formatstring='N2'}
                }
                
        }
        
        end {
                Write-Debug -Message "Disk info retrieved for $ComputerName"
        }
}


Get-DiskDetails -ComputerName localhost 