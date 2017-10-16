<# Usage Function ------------------------------------------------------------#>
function usage {
	Write-Host ""
	Write-Host "[Usage]"
	Write-Host "for Windows"
	Write-Host "  usage: .\install.ps1 [list of tools]"
	Write-Host "  list of supported tools"
	Write-Host "    - all"
	Write-Host "    - wsl" 
	Write-Host "    - git" 
	Write-Host "    - wsl" 
	Write-Host "    - vscode" 
	Write-Host "  ex) $ .\install.ps1 all"
	Write-Host "  ex) $ .\install.ps1 wsl git"
	Write-Host ""
}

<# Check PowerShell Version --------------------------------------------------#>
if ($PSVersionTable.PSVersion -ge "5.0") {
	Write-Host "Install tools for Windows"
}
else {
	Write-Host -ForegroundColor "red" "Error: Not supported PowerShell version"
	Write-Host
	Exit(2)
}

<# Check Argument ------------------------------------------------------------#>
if (($Args.Count -ne 1) `
	-Or (($Args -ne "all") -And ($Args -ne "wsl") -And ($Args -ne "git") -And ($Args -ne "vim"))) {
	Write-Host -NoNewline -ForegroundColor "red" "Error: Not supported tool"
	usage
	Exit(1)
}
Write-Host

<# Install Tools -------------------------------------------------------------#>
$path=$Pwd.path
cd $PSScriptRoot

# wsl
if (($Args[0] -eq "all") -or ($Args[0] -eq "wsl")) {
	Write-Host -NoNewline "==> Install "
	Write-Host -ForegroundColor "Yellow" "wsl"
	wsl/wsl_install.ps1
}

switch ($Args[0]) {
	"git" {
		git/git_setting.ps1 $path
	}
	"vim" {
		vim/vim_install.ps1
	}
	default {
		Write-Host -ForegroundColor "red" "Error: Not supported tool"
		Write-Host
		Exit(2)
	}
}
