
######
#My Profile, sets the location to C and edits the window a little. Functions below are neat. 
######

function toolbox ($default, $paul, $basic) {

do {

[int]$toolmenu = 0

while ( $toolmenu -lt 1 -or $toolmenu -gt 10 ){

clear
Write-Host "Welcome to the toolbox, if you have never used this please select #1 to install the toolbox.
1.Install toolbox  |   2.Install Pauls Full PS Profile
3.Update Windows   |   4.
5.                 |   6.
7.                 |   8.
9.Run as admin     |   10.Exit

Created by: Paul Braunschweig
"
[Int]$toolmenu = read-host "Please enter an option 1 through 7 and press enter..." }

switch ($toolmenu){
1 {clear ; get-toolbox}
2 {clear ; & $PSScriptRoot\scripts\installprofile.ps1}
3 {clear ; & $PSScriptRoot\scripts\start_updates.ps1}
4 {clear ; & $PSScriptRoot\scripts\}
5 {clear ; & $PSScriptRoot\scripts\}
6 {clear ; & $PSScriptRoot\scripts\}
7 {clear ; & $PSScriptRoot\scripts\}
8 {clear ; & $PSScriptRoot\scripts\}
9 {clear ; & $PSScriptRoot\scripts\}
10 {Break}
} 

} while ( $toolmenu -ne 10)

}

Function get-toolbox {

#little bit of setup
$test = (Test-Path $profile)

$user = Read-Host "Please enter your username"

if ($test -eq $false) {

$content = (Invoke-WebRequest -Uri https://raw.githubusercontent.com/sinns804/elkstackfiles/master/Microsoft.PowerShell_profile.ps1 -UseBasicParsing).content

New-Item "C:\Users\pbraunsc\Documents\WindowsPowerShell" -ItemType directory

$content | Out-File "C:\Users\$user\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"

Write-Host "Completed: If you experinced any errors the a profile might already exist, delete it and try again."

    }
}

Function Get-Wallpapers {

(irm http://www.reddit.com/r/wallpapers/.json).data.children.data|% {iwr $_.url -outfile ("c:\backgrounds\" + $_.url.split('/')[-1])} 

(irm http://www.reddit.com/r/wallpaper/.json).data.children.data|% {iwr $_.url -outfile ("c:\backgrounds\" + $_.url.split('/')[-1])} 

(irm http://www.reddit.com/r/topwalls/.json).data.children.data|% {iwr $_.url -outfile ("c:\backgrounds\" + $_.url.split('/')[-1])} 

clear

}

Function Get-Remote {

$name = Read-Host 'Whats location would you like to RDP to?'

mstsc /v:$name

}

Function Get-Session {

$PSname = Read-Host 'Whats location would you like to open a session with?'

$username = Read-Host 'With what user?'

Enter-PSSession -ComputerName $PSname -Credential "WISLEG\$username"

}


###
#End of the functions. 
###
Import-Module ActiveDirectory

set-location c:\

$Shell = $Host.UI.RawUI
$size = $Shell.WindowSize
$size.width=100
$size.height=25
$Shell.WindowSize = $size
$size = $Shell.BufferSize
$size.width=100
$size.height=5000
$Shell.BufferSize = $size
$shell.BackgroundColor = “Gray”
$shell.ForegroundColor = “Black”


new-item alias:rdp -value Get-Remote

new-item alias:pss -value Get-Session

new-item alias:walls -value Get-Wallpapers

$Shell.WindowTitle=”PAULS POWERSHELL PROFILE”

Clear-Host


Write-Host "Welcome Paul! What are we doing today?

▄██████████████▄▐█▄▄▄▄█▌
██████▌▄▌▄▐▐▌███▌▀▀██▀▀
████▄█▌▄▌▄▐▐▌▀███▄▄█▌
▄▄▄▄▄██████████████

The whale failed for your sins. 

===================================================

You are currently in the root of C on $env:computername.
Type 'Menu' in order to a see a list of custome function features of this profile. 
"
