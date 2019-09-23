$servers = "test-sym-cz-1","test-sym-cz-2","test-sym-cz-3","test-sym-cz-4","t-symfire-cz-1","t-symfire-cz-2"
$source = "\\install\home\DevOps\Tools\DebugDiagx64.msi"
$destination = "E$\"

foreach ($server in $servers) {if ((Test-Path -Path \\$server\$destination)) {
    Copy-Item $source -Destination \\$server\$destination -Recurse
}
else {"\\$server\$destination is not reachable"
}
}

