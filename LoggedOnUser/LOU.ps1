<#
FIND USER LOGGED ONTO A PARTICULAR MACHINE 
#>

# This will prompt you to type in a Target Machine to find out whose logged onto it.
$compname = Read-Host -Prompt 'What is the Target Machine?'
$test = (Get-WmiObject �ComputerName $compname �Class Win32_ComputerSystem).UserName
Write-Host $test
pause

#command below without a variable
#Get-WmiObject �ComputerName $compname �Class Win32_ComputerSystem | Select-Object UserName