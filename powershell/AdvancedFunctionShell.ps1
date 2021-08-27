function New-AdvancedFunction {
    <#
    .SYNOPSIS 
    
    .Example
        PS> New-AdvancedFunction -Param1 "Hello" -Param2 "World"
    .Parameter Param1
        .DESCRIPTION This isthe parameter1
    #>
    [cmdletbinding()]
    param (
        [string]$Param1
        
    )
    begin {
        Write-Output "Hello World"
    }

    process {
        try {   
            if($true) {
                throw "An Error Occured"
            }
        }
        catch {
            Write-Error "$($_.Exception.Message) - Line number: $($_.InvocationInfo.ScriptLineNumber)"
        }
    }
    end {
        Write-Output "End"
    }  
}