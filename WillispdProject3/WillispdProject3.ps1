<#
Patrick Willison
Project 3
Due: 4/28/2020
Willispd@mail.uc.edu 
Project 3 builds on project 1 and 2. The goal of this script is to take hardware information and potentially upload it to a secure server/website or even another computer.

As a side note if you place any of the files outside of my virtual machine you will most likely have to change the directory to run it. The lines to change this are located at 28,41 and line 6 in the api.js file
###########Requirements#############

Nodejs must be installed. This is done via the gui installer from https://nodejs.org/en/download/
SysInfo v1.2.0 is shown on powershellgallery.com and the code to install it is "install-module -name sysinfo". Make sure you hit yes on both questions in order to install correctly.
Notes: The data listed is unrounded so that you have a more accurate representation of how much space you have used, and stored.
#>
#Properties
$ComputerName=$env:COMPUTERNAME #ComputerName will find the name of the computer via env:variable
$ComputerBios=get-bios #ComputerBios gets and prints the bios of the VM
$ComputerProcessor=get-Processor #ComputerProcessor gets and prints the processor of the current computer.
$DiskStats = Get-WmiObject Win32_Logicaldisk -Filter "deviceid='C:'" -ComputerName $ComputerName #Disk stats retrieves stats for all the disks, filters them by divice id and the computer name variable. in this case we filtered for the C drive
$DiskMaxSize = $DiskStats.Size/1gb #DiskMaxSize only gets the total size of the C drive in Mb's and calculates the total size in Gb
$DiskOpenSpace = $DiskStats.FreeSpace/1gb #DiskOpenSpace gets the remainder of free space in the C drive and calculates the total number of Gb left
$DiskUsedSpace= ($DiskMaxSize - $DiskOpenSpace) #DiskUsedSpace calculates how much has been used by subtracting the max size by the amount of data free
$JSONConvert = ConvertTo-Json -InputObject $ComputerProcessor #Converts device info to json code

####################Section where code is executed######################
$DiskStats #DiskStats Prints various info about the drive to confirm that it can find the drive
$WidgetsOverride = Set-Content -Path C:\Users\Administrator\Desktop\WillispdProject3\widgets.json -Value $JSONConvert #Override the widgets.json so that the current Hardware Information can be displayed through an API



############################Out-Put#####################################
Write-Host("The current max size of your drive is  $DiskMaxSize Gb, you have $DiskOpenSpace Gb free")
Write-Host("You have used $DiskUsedSpace Gb of space")
Write-Host("BIOS:", $ComputerBios)
Write-Host("Processor Info:", $ComputerProcessor)
Write-Host($JSONConvert)
Write-Host("Starting up node, listening on port 3000")

###########################Node startup#################################
$RunNode = node C:\Users\Administrator\Desktop\WillispdProject3\api.js #runs node and the api
Write-Host($RunNode)
