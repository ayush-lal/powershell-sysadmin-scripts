<#
SHUTDOWN COMPUTER LAB

** You will need to download 'PsShutdown.exe' from Microsoft Sysinternals (https://docs.microsoft.com/en-us/sysinternals/downloads/psshutdown). PsShutdown is a lot more powerful then using shutdown -i from CMD/powershell. It also has some handy built in features. 

You will need to create a .txt file somewhere on your local machine with the machine names that you want to shutdown at a given time. There is a problem with executing this script using the network UNC path which is why we want the it to execute locally. 

You can uncomment this section if want to store your "PC_masterlist.txt" on the network. The benefit of storing the txt file on the network is that it will copy the .txt file to your local machine which means that you can execute this script from any machine!
copy-item -path \\SOMEWHERE\PC_masterlist.txt -destination D:\
########################################################################>

#The PsShutdown.exe can be stored locally or on the network. 
Write-host Enter Password for $env:username -ForegroundColor Yellow -BackgroundColor DarkGreen
\\eqsoc1745010\sw\OrangeBar2018\powershell\scripts\shutdownlab\psshutdown.exe @D:\PC_masterlist.txt -s -t 0 -n 1 -f -accepteula -u $env:username 

