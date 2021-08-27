param(
    $FirstName,
    $LastName,
    $MiddleInitial,
    $Location = 'OU=Corporata Users',
    $Title
)

$DefaultPassword = 'Password1';
$DomainDn = (get-AdDomain).DistinguishName;
$DefaultGroup = 'Domain Users';

### Start of the program 
Write-Host "Creating user $FirstName $LastName"

### Figure out the username should be
$Username = $($FirstName.SubString(0,1) + $LastName);
$EaPreBefore =  $ErrorActionPreference
$ErrorActionPreference = 'SilentlyContibue';

if (get-AdUser $Username){
    $Username = $($FirstName.SubString(0,1) + $MiddleInitial +$LastName);
    if (get-AdUser $Username){
        Write-Warning "No Acceptable username schema could be created"
    }

}
### Create the User account 
$ErrorActionPreference = $EaPreBefore
$NewUserParams  = @{
    'UserPrincipalName' = $Username
    'Name' = $Username
    'GivenName' = $FirstName
    'Surname' = $LastName
    'DisplayName' = $FirstName + ' ' + $LastName
    'SamAccountName' = $Username
    'Enabled' = $true
    'AccountPassword' = (ConvertTo-SecureString $DefaultPassword -AsPlainText -Force)
    'Description' = "Created by $Script:Name"
    'Path' = "$Location,$DomainDn"
    'Title' = $Title
    'ChangePasswordAtLogon' = $true
}

New-AdUser @NewUserParams
### Add the user account to the company standard group 

New-AdGroupMember -Identity $Username -GroupName $DefaultGroup