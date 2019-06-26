$registry_path_1 = "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps"
$registry_name_1 = "DumpFolder"
$registry_value_1 = "E:\CrashDumps"
$registry_type_1 = "STRING"

$registry_path_2 = "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps"
$registry_name_2 = "DumpCount"
$registry_value_2 = "10"
$registry_type_2 = "DWORD"

$registry_path_3 = "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps"
$registry_name_3 = "DumpType"
$registry_value_3 = "2"
$registry_type_3 = "DWORD"

function Set-RegistryKeys {
    param ($registry_path,$registry_name,$registry_value,$registry_type
    )

    if ((Get-ItemProperty -Path $registry_path | Select-Object -ExpandProperty $registry_name) -eq $registry_value)
    {
     Write-Host "Registry $registry_name with value $registry_value already exists"
    }

    elseif (!(Test-Path $registry_path))
    {
     New-Item -Path $registry_path -Force | Out-Null
     New-ItemProperty -Path $registry_path -Name $registry_name -Value $registry_value -PropertyType $registry_type -Force
     Write-Host "New registry key created:
     Path: $registry_path
     Name: $registry_name
     Value:$registry_value
     Type: $registry_type" 
    }
    
    else
    {
     New-ItemProperty -Path $registry_path -Name $registry_name -Value $registry_value -PropertyType $registry_type -Force
     Write-Host "New registry key created:
     Path: $registry_path
     Name: $registry_name
     Value:$registry_value
     Type: $registry_type" 
    }
}

New-Item -Path e:\ -Name CrashDumps -Type Directory

Set-RegistryKeys $registry_path_1 $registry_name_1 $registry_value_1 $registry_type_1

Set-RegistryKeys $registry_path_2 $registry_name_2 $registry_value_2 $registry_type_2

Set-RegistryKeys $registry_path_3 $registry_name_3 $registry_value_3 $registry_type_3




