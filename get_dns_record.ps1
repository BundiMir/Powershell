# $ZoneName = "moravia-it.com"
$Record = "*tms*"
#Get-DnsServerResourceRecord -ComputerName dcit-cz-1 -ZoneName "moravia-it.com" | Where-Object -FilterScript {$_.Hostname -like $Record} | fl -Property Hostname
Get-DnsServerResourceRecord -ComputerName dcit-cz-1 -ZoneName "moravia.com" | Where-Object -FilterScript {$_.Hostname -like $Record} | fl -Property Hostname