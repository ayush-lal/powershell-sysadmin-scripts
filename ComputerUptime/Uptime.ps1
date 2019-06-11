<#
GET COMPUTER UPTIME 
** Please follow instructions below. 
#################################################################>

# A simple Write-Host as this script may take some time to generate the report.
Write-Host -NoNewline "Please be paitent, this script may take some time." -ForegroundColor "Yellow" #-BackgroundColor "Green"

# Add a -SearchBase for computers or Name -like if computers have similar naming conventions In the example below the WS* will search through ALL computers in AD with the prefix WS.
Get-ADComputer -Filter "Name -like 'WS*'" | ForEach {

    $computerName = $_.Name
    If (Test-Connection -ComputerName $computerName -Count 1 -Quiet) {
        $uptime = Get-WmiObject Win32_OperatingSystem -ComputerName $computerName
        $bootTime = $uptime.ConvertToDateTime($uptime.LastBootUpTime)
        $elapsedTime = (Get-Date) - $bootTime
        $description = Get-ADComputer $computerName -Properties Description | Select-Object Description

        $props = @{
            ComputerName = $computerName
            BootTime = $bootTime
            ElapsedTime = '{0:00} Days, {1:00} Hours, {2:00} Minutes, {3:00} Seconds' -f $elapsedTime.Days, $elapsedTime.Hours, $elapsedTime.Minutes, $elapsedTime.Seconds
            Description = $description
        }

        New-Object PsObject -Property $props

    } Else {
        $props = @{
            ComputerName = $computerName
            BootTime = 'ERROR - Did not reply to ping'
            ElapsedTime = 'N/A'
            Description = 'N/A'
        }

        New-Object PsObject -Property $props
    }

# You will need to specify a location for the Export-Csv.
} | Sort ComputerName | Select ComputerName,BootTime,ElapsedTime,Description | Export-Csv \\ENTER YOUR LOCATION HERE.csv -NoTypeInformation

#This will invoke/auto-launch the csv file after it is finished generating.
Invoke-Item "\\ENTER SAME LOCATION AS ABOVE.csv"

pause