function Get-AskVolume() {
    <#
    .SYNOPSIS 
            Get-AskVolume 
    .PARAMETER computername 
            The computername of the remote computer.
    .EXAMPLE 
            Get-AskDiskDetails -ComputerName localhost 
    .AUTHOR
            .NAME ArunSanthoshKumar Annamalai (@arun7pulse)
    #>
    [CmdletBinding()]
    param (
            [string[]]$ComputerName='localhost'
    )
    
    begin {
            Write-Debug -Message "Started"
    }
    
    process {
        Get-Volume | 
        Select-Object DriveLetter, Size, SizeRemaining, DriveType, HealthStatus | 
        Where-Object DriveType -eq "fixed" | 
        Format-Table -AutoSize            
    }
    
    end {
            Write-Debug -Message "Ended"
    }
}

Get-AskVolume -ComputerName localhost