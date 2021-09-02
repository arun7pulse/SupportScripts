function Get-AskChildItem {
    <#
    .SYNOPSIS 
    
    .Example
        PS> Get-AskChildItem -Extention "*.ps1" -Path "F:\"
    .Parameter Param1
        .DESCRIPTION This isthe parameter1
    .AUTHOR 
        .NAME ArunSanthoshKumar Annamalai (@arun7pulse)
    #>
    [cmdletbinding()]
    Param (
    [string]$Path = "$pwd",
    [string]$Extention = "*"
    )

    begin {
        Write-Debug -Message "Started"
    }

    process {
        try {   
            Get-ChildItem -Path $Path -Recurse | Select-Object Length, Directory, Name, LastAccessTime, LastWriteTime, Extension | 
            Where-Object {$_.Extension -like "$Extention" } | 
            Sort-Object Length -Desc | 
            Format-Table -AutoSize
        }
        catch {
            Write-Error "$($_.Exception.Message) - Line number: $($_.InvocationInfo.ScriptLineNumber)"
        }
    }
    end {
        Write-Debug -Message "Started"
    }  
}

Get-AskChildItem -Extention "*.ps1" -Path "F:\"


