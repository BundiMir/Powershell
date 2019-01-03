$registry_path_1 = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management"
$registry_name_1 = "FeatureSettingsOverride"
$registry_value_1 = "8"
$registry_type_1 = "DWORD"

$registry_path_2 = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management"
$registry_name_2 = "FeatureSettingsOverrideMask"
$registry_value_2 = "3"
$registry_type_2 = "DWORD"

$registry_path_3 = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization"
$registry_name_3 = "MinVmVersionForCpuBasedMitigations"
$registry_value_3 = "1.0"
$registry_type_3 = "STRING"

$registry_path_4 = "HKLM:\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_ENABLE_PRINT_INFO_DISCLOSURE_FIX"
$registry_name_4 = "iexplore.exe"
$registry_value_4 = "1"
$registry_type_4 = "DWORD"

$registry_path_5 = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_ENABLE_PRINT_INFO_DISCLOSURE_FIX"
$registry_name_5 = "iexplore.exe"
$registry_value_5 = "1"
$registry_type_5 = "DWORD"

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


Set-RegistryKeys $registry_path_1 $registry_name_1 $registry_value_1 $registry_type_1

Set-RegistryKeys $registry_path_2 $registry_name_2 $registry_value_2 $registry_type_2

Set-RegistryKeys $registry_path_3 $registry_name_3 $registry_value_3 $registry_type_3

Set-RegistryKeys $registry_path_4 $registry_name_4 $registry_value_4 $registry_type_4

Set-RegistryKeys $registry_path_5 $registry_name_5 $registry_value_5 $registry_type_5


