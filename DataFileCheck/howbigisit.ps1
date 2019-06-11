<#
DATA FILE CHECK - "HOW BIG IS IT"
#############################################>

Add-Type -AssemblyName System.Windows.Forms
# Select folder/file that will be checked. In the case below, there is an $environment variable that will gather the current logged on user's profile folder located in D drive.
$StartFolder = "D:\$env:USername"
Write-Host "Scanning..."
[System.Windows.Forms.MessageBox]::Show($(Get-ChildItem $StartFolder -Recurse -File | Measure-Object Length -Sum | `
Select @{Name="Size";Expression={"{0:N2} GB" -f ($_.Sum / 1gb)}}).Size,$StartFolder,'Ok','Info')