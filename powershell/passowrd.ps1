<#
.SYNOPSIS
Make a VHD File bootable
.DESCRIPTION
Converts a raw *.vhd file to a bootable *.vhd file
.PARAMETER Path
File path to a VHD File to be made active
.EXAMPLE
.\Make-VHDBootable.ps1 -verbose -path C:\15\install.vhdx
.NOTES
Copyright Microsoft Corp, All Rights reserved.
#>

function Save-Password {
    param(
        [Parameter(Mandatory)]
        [string]$Label
    )
 
    Write-Host 'Input password:'
    $securePassword = Read-host -AsSecureString | ConvertFrom-SecureString
 
    $securePassword | Out-File -FilePath "$Label.txt"
}
 
function Get-Password {
    param(
        [Parameter(Mandatory)]
        [string]$Label
    )
 
    $filePath = "$Label.txt"
    if (-not (Test-Path -Path $filePath)) {
        throw "The password with label [$($Label)] was not found!"
    }
 
    $password = Get-Content -Path $filePath | ConvertTo-SecureString
    $decPassword = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))
    echo $decPassword
    #[pscustomobject]@{
       # Label = $Label
       # Password = $decPassword
   # }
}
function Get-Version {
    $PSVersionTable.PSVersion
}

function Get-SMSService{
    Get-Service | Where-Object {$_.status -eq "Running" -or $_.Name -match "^W*"} | Sort-Object Status
}
