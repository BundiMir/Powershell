# get multiple ad computes which can be assigned to variable 
Get-ADComputer -Filter 'Name -like "Teamcity-cz-*"' | Where-Object {$_.name -like "teamcity-cz-?"} | Select-Object -ExpandProperty name