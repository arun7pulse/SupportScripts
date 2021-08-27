param(
    [string[]]$ComputerName="localhost",
    [string]$Criteria,
    [hashtable]$Attributes
)

foreach ($Computer in $ComputerName) {
    #Enumarate all the default admin shares
    $CimInstanceParam = @{'ClassName' = 'win32_Share'}
    if ($Computer -ne 'localhost'){
        CimInstanceParam.ComputerName = $Computer
    }
    $DriveShares = (get-CimInstance @CimInstanceParam | Where-Object {$_.Name -match '^[A-Z]\$$'}).Name
    Write-Host  $ComputerName ": " $DriveShares 

    foreach ($Drive in $DriveShares) {
        switch ($Criteria) {
            'Name'{ 
                $Name = $Attributes.name
                Get-ChildItem -path "\\$Computer\$Drive" -Filter "Name -like '*$Name*'" | %{$_.Name}
                }
            'Extention' {
                $Extention = $Attributes.extention
                Get-ChildItem -path "\\$Computer\$Drive" -Filter "Name -like '*$Extention*'"  -Recurse | %{$_.Name} 
            }
            'default' {
                Write-Error "UNrecognized criteria $Critieria"
                }
            }
        }
    }