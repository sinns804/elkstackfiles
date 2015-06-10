
######
#My Profile, sets the location to C and edits the window a little. Functions below are neat. 
######

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
