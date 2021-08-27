<#
.SYNOPSIS 
    This is update the 
.EXAMPLE
.PARAMETER UserName
#>
param(
    [string] $UserName,
    [hashtable]$Attributes
)

try{
    $UserAccount = get-AdUser -Identity $UserName
    if ( $UserAccount) {
        Write-Error " The user Name $UserName does not exist"
        return
    }

} catch{
    Write-Host "Error Occured"
}

if ($Attributes.ContainsKey("password")) {
    $UserAccount | Set-ADAccountPassword -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $Attributes["password"] -Force)
    $Attributes.Remove("password")
}

$UserAccount | SetAdUser @Attributes
