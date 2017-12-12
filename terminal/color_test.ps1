$color = [Enum]::GetValues([ConsoleColor])

Write-Host "`t`tBlack   D.Blue  D.Green D.Cyan  D.Red   D.Mgt   D.Yel   Gray    D.Gray  Blue    Green   Cyan    Red     Magenta Yellow  White"
foreach ($fgcolor in $color) {
	Write-Host -NoNewline "$fgcolor"
	if (([string]$fgcolor).Length -lt 8) {
		Write-Host -NoNewline "`t`t"
	}
	else {
		Write-Host -NoNewline "`t"
	}
	foreach ($bgcolor in $color) {
		Write-Host -ForegroundColor $fgcolor -BackgroundColor $bgcolor -NoNewline " Test "
		Write-Host -NoNewline "  "
	}
	Write-Host
}
