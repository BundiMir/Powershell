#IIS STOP
#Invoke-Command -ComputerName sym-cz-1,sym-cz-2,sym-cz-3,sym-cz-4,symfire-cz-1,symfire-cz-2 -ScriptBlock {iisreset /stop}

#IIS START
#Invoke-Command -ComputerName sym-cz-1,sym-cz-2,sym-cz-3,sym-cz-4,symfire-cz-1,symfire-cz-2 -ScriptBlock {iisreset /start}