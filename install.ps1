<# Usage Function ------------------------------------------------------------#>
function usage {
	Write-Host ""
	Write-Host "[Usage]"
	Write-Host "for Windows"
	Write-Host "  usage: .\install.ps1 [all | git | vim | vscode]"
}

<# Check PowerShell Version --------------------------------------------------#>
if ($PSVersionTable.PSVersion -ge "3.0") {
	Write-Host "Install OS dependency tools for Windows"
	# git
}
else {
	Write-Host "Not supported PowerShell version"
}

<# Check Argument ------------------------------------------------------------#>
if ($Args.count -ne 1) {
	usage
	Exit(1)
}

# Install Tools ################################################################
Write-Host "Install tools for Windows"
$path=$Pwd.path
cd $PSScriptRoot
Write-Host -NoNewline "==> Install "
Write-Host -ForegroundColor "Yellow" $Args[0]
switch ($Args[0]) {
	"git" {
		git/git_setting.sh $path
	}
	default {
		Write-Host "Not supported tool"
	}
}
