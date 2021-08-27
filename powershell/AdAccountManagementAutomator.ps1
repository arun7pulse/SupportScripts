NOT COMPLETE Yet\
function New-EmployeeOnboardUser {
    <#
    .SYNOPSIS 
        This function will create a new employee user and assign them to the specified role.
    .Example
        PS> New-EmployeeOnboardUser -FirstName "Arun" -LastName "Annamalai" -MiddleInitial SK -Title "Mr.Handsome"

        This will create a new employee onboard user with the following details:
        FirstName: Arun
        LastName: Annamalai
        MiddleInitial: SK
        Title: Mr.Handsome
    
        .DESCRIPTION 

    .Parameter FirstName
        Required?                    true   
    .parameter LastName
        Required?                    true
    .parameter MiddleInitial
        Required?                    false
    .parameter Title
        Required?                    false

    #>
    [cmdletbinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [String] $FirstName,
        [Parameter(Mandatory = $true, Position = 1)]
        [ValidateNotNullOrEmpty()]
        [String] $LastName,
        [Parameter(Mandatory = $false, Position = 2)]
        [ValidateNotNullOrEmpty()]
        [String] $MiddleInitial,
        [Parameter(Mandatory = $false, Position = 3)]
        [ValidateNotNullOrEmpty()]
        [String] $Title
    )
    begin {
        $DefaultPassword  = "Password123";
        $DomainDn = "CN=Users,DC=contoso,DC=com";
        $DefaultGroup = "SumTotal";


        $UserName = "$(FirstName.SubString(0,1))$LastName"

    )

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