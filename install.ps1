#Requires -RunAsAdministrator

<# Usage Function ------------------------------------------------------------#>
Function usage {
	Write-Host "[Usage]"
	Write-Host "for Windows"
	Write-Host "  usage: .\install.ps1 [list of tools]"
	Write-Host "    list of supported tools"
	Write-Host "    - all"
	Write-Host "    - wsl"
	Write-Host "    - shell"
	Write-Host "    - git"
	Write-Host "    - vim"
	Write-Host "  ex: .\install.ps1 all"
	Write-Host "  ex: .\install.ps1 wsl git"
	Write-Host
}

<# Check PowerShell Version --------------------------------------------------#>
If ($PSVersionTable.PSVersion -ge "5.0") {
	Write-Host
	Write-Host "Install tools for Windows"
	Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
	Write-Host
}
Else {
	Write-Host -ForegroundColor RED "Error: Not supported PowerShell version"
	Write-Host
	Exit 1
}

<# Check Argument ------------------------------------------------------------#>
If (($Args.Count -lt 1) -Or ($Args.Count -gt 4)) {
	Write-Host -NoNewline -ForegroundColor RED "Error: Invalid arguments"
	Write-Host
	usage
	Exit 2
}

<# Install Tools -------------------------------------------------------------#>
$path=$Pwd.path
cd $PSScriptRoot

<# choco #>
Write-Host -NoNewline "==> Install "
Write-Host -ForegroundColor YELLOW choco
If (Get-Command choco -errorAction SilentlyContinue) {
	Write-Host -NoNewline -ForegroundColor Yellow "choco"
	Write-Host " has been installed"
	Write-Host
}
Else {
	Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
	Write-Host
}

<# fzf #>
Write-Host -NoNewline "==> Install "
Write-Host -ForegroundColor YELLOW fzf
If (Get-Command fzf -errorAction SilentlyContinue) {
	Write-Host -NoNewline -ForegroundColor YELLOW "fzf"
	Write-Host " has been installed"
	Write-Host
	choco upgrade fzf
}
Else {
	choco install fzf
}

$tools = @($Args)
If (($Args.Count -eq 1) -And ($Args -eq "all")) {
	$tools = @("wsl", "shell", "git", "vim")
}

For ($i = 0; $i -lt $tools.Length; $i++) {`
	Write-Host -NoNewline "==> Install "
	Write-Host -ForegroundColor YELLOW $tools[$i]
	Switch ($tools[$i]) {
		"wsl" {
			wsl/wsl_install.ps1
		}
		"shell" {
			shell/shell_install.ps1
		}
		"git" {
			git/git_install.ps1
		}
		"vim" {
			vim/vim_install.ps1
		}
		default {
			Write-Host -ForegroundColor RED "Error: Not supported tool"
			Write-Host
		}
	}
}

refreshenv
Write-Host
