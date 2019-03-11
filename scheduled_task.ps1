#Get basic info about scheduled task
Invoke-Command -ComputerName test-acman-cz1, test-acman-cz2 -ScriptBlock {Get-ScheduledTask -TaskName SyncVendors}

#Get runtime info about scheduled task.
#Note: Whole scheduler path have to be provided, otherwise task have to be in root. 
Invoke-Command -ComputerName test-acman-cz1, test-acman-cz2 -ScriptBlock {Get-ScheduledTaskInfo -TaskName "\Acman Console\SyncVendors"}

Invoke-Command -ComputerName test-acman-cz1, test-acman-cz2 -ScriptBlock {Start-ScheduledTask -TaskName "\Acman Console\SyncVendors"}