function Get-AskService {
    <#
    .SYNOPSIS
    Get-AskService [<ServiceName>] 
    .EXAMPLE
        PS> Get-AskService -Name "DoSvc"
    .Parameter Param1
        .DESCRIPTION This is the name of the service to be displayed
    .AUTHOR 
        .NAME ArunSanthoshKumar Annamalai (@arun7pulse)
    #>
    [cmdletbinding()]
    Param (
    [string]$Name = "*"
    )

    begin {
        Write-Debug -Message "Started"
    }

    process {
        try {   
            Get-Service -Name $Name | 
            Select-Object Name, Status, DisplayName | 
            Sort-Object Status | 
            Format-Table -AutoSize
        }
        catch {
            Write-Error "$($_.Exception.Message) - Line number: $($_.InvocationInfo.ScriptLineNumber)"
        }
    }
    end {
        Write-Debug -Message "Ended"
    }  
}

Get-AskService -Name "DoSvc"
