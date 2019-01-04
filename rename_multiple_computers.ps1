# This command renames multiple computers in the domain. It uses a CSV file to specify the values for the current and new names of each computer.
# The CSV file contains a series of name pairs in "OldName, NewName" format with one name pair on each line of the file.

# The first command uses the Import-Csv cmdlet to import the ServerNames.csv file into the $a variable.
# It uses the Header parameter to specify the column header names of each of the two columns. 
# This creates a collection of custom objects in $a, each of which has an OldName and NewName property.

# The second command runs the Rename-Computer cmdlet on each object in the $a variable.
# It specifies the old name, which is the value of the OldName property, for the value of the ComputerName parameter.
# It specifiesthe new name, the value of the NewName property, for the value of the NewName parameter.
# The command specifies domain credentials and uses Force and Restart to suppress all user prompts and restart each computer after it is renamed.

$list = Import-Csv C:\Scripts\PowerShell\List_to_rename.csv -Header Oldname,Newname
ForEach ($server in $list) {Rename-Computer -ComputerName $server.Oldname -NewName $server.Newname -DomainCredential cz\a.pbundil -Force -Restart}