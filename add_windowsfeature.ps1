$tcservers = Get-ADComputer -Filter 'Name -like "Teamcity-cz-*"' | Where-Object {$_.name -like "teamcity-cz-?"} | 
            Select-Object -ExpandProperty name
$tcservers | ForEach-Object {Invoke-Command -ComputerName $_ -ScriptBlock {Get-WindowsFeature RSAT-AD-Powershell,RSAT-DNS-Server | 
            Where-Object {$_.InstallState -eq 'Available'} | Select-Object -ExpandProperty name | Add-WindowsFeature}}