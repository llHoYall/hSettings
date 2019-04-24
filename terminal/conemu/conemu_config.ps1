<###############################################################################
 #	@file			terminal/conemu_config.ps1
 #	@brief		This file configures ConEmu program.
 #	@author		llHoYall <hoya128@gmail.com>
 #	@version	v1.0
 #	@note
 #		- 2018.03.26	Created.
 ##############################################################################>

<# Configure ConEmu ----------------------------------------------------------#>
Write-Host -NoNewline " => Config "
Write-Host -ForegroundColor YELLOW "ConEmu"
If (Test-Path -Path "C:\Program Files\ConEmu") {
	# If (Test-Path "C:\Users\$($env:UserName)\AppData\Roaming\conemu_sexy.xml") {
	# 	Remove-Item "C:\Users\$($env:UserName)\AppData\Roaming\conemu_sexy.xml"
	# }
	# cmd /c mklink /H "C:\Users\$($env:UserName)\AppData\Roaming\conemu_sexy.xml" "$($PSScriptRoot)\conemu_sexy.xml"
	If (Test-Path "C:\Program Files\ConEmu\conemu_sexy.xml") {
		Remove-Item "C:\Program Files\ConEmu\conemu_sexy.xml"
	}
	cmd /c mklink /H "C:\Program Files\ConEmu\conemu_sexy.xml" "$($PSScriptRoot)\conemu_sexy.xml"
}
Else {
	Write-Host "    Not installed."
}
