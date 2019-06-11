<#
 -----------------------------------------------------------------------------
 Creator: Ayush Lal
 This is a Powershell Console Menu that can fetch all of your scripts.
 -----------------------------------------------------------------------------
 #>
 
Function Show-Menu {

Param(
[Parameter(Position=0,Mandatory=$True,HelpMessage="Enter your menu text")]
[ValidateNotNullOrEmpty()]
[string]$Menu,
[Parameter(Position=1)]
[ValidateNotNullOrEmpty()]
[string]$Title="Menu",
[switch]$ClearScreen
)

if ($ClearScreen) {Clear-Host}

#build the menu prompt
$menuPrompt=$title
#add a return
$menuprompt+="`n"
#add an underline
$menuprompt+="-"*$title.Length
$menuprompt+="`n"
#add the menu
$menuPrompt+=$menu

Read-Host -Prompt $menuprompt

} #end function

#Define the "Console Menu" here:
$menu=@"
1 Name of Script
2 Name of Script
3 Name of Script
4 Name of Script
5 Name of Script
Q Quit

Select a task by number or Q to quit
"@

#Keep looping and running the menu until the user selects Q (or q).
Do {
#use a Switch construct to take action depending on what menu choice is selected.
    Switch (Show-Menu $menu "SysAdmin Console" -clear) {
"1" {Write-Host "Running Script..." -ForegroundColor Yellow -BackgroundColor DarkBlue
         \\LOCATION OF POWERSHELL SCRIPT\
         } 
"2" {Write-Host "Running Script..." -ForegroundColor Yellow -BackgroundColor DarkBlue
         \\LOCATION OF POWERSHELL SCRIPT\
         } 
"3" {Write-Host "Running Script..." -ForegroundColor Yellow -BackgroundColor DarkBlue
         \\LOCATION OF POWERSHELL SCRIPT\
         } 
"4" {Write-Host "Running Script..." -ForegroundColor Yellow -BackgroundColor DarkBlue
         \\LOCATION OF POWERSHELL SCRIPT\
         } 
"5" {Write-Host "Running Script..." -ForegroundColor Yellow -BackgroundColor DarkBlue
         \\LOCATION OF POWERSHELL SCRIPT\
         } 
"Q" {Write-Host "Goodbye." -ForegroundColor Yellow -BackgroundColor DarkBlue
         Return
         }
     Default {Write-Warning "Invalid Choice. Try again."
              sleep -milliseconds 750}
    } #switch
} While ($True)
