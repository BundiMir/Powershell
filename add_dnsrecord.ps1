$DNSname = Read-Host -Prompt 'DNSName'
$Zone = Read-Host -Prompt 'Zone'
$IP = Read-Host -Prompt 'IP'

If ($Zone -eq 'moravia.com')
{Add-DnsServerResourceRecordA -ComputerName dcit-cz-1 -Name $DNSname -ZoneName $Zone -AllowUpdateAny -IPv4Address $IP -CreatePtr -TimeToLive 01:00:00}
else 
{Add-DnsServerResourceRecordA -ComputerName dcit-cz-1 -Name "$DNSname.cz" -ZoneName $Zone -AllowUpdateAny -IPv4Address $IP -CreatePtr -TimeToLive 01:00:00}

Write-Host "Creating DNS record $DNSname for IP $IP in zone $Zone"