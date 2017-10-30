#Requires -RunAsAdministrator

<# Usage Function ------------------------------------------------------------#>
Function usage {
	Write-Host "[Usage]"
	Write-Host "for Windows"
	Write-Host "  usage: .\install.ps1 [list of tools]"
	Write-Host "    list of supported tools"
	Write-Host "    - all"
	Write-Host "    - wsl"
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
	If (!(Test-Path $Profile)) {
		New-Item -Path $Profile -ItemType File -Force -Value "Set-Alias vim 'C:\Program Files (x86)\vim\vim80\vim.exe'`r`n`r`nSet-Location $HOME"
	}
	Write-Host
}
Else {
	Write-Host -ForegroundColor RED "Error: Not supported PowerShell version"
	Write-Host
	Exit(1)
}

<# Check Argument ------------------------------------------------------------#>
If (($Args.Count -lt 1) -Or ($Args.Count -gt 3)) {
	Write-Host -NoNewline -ForegroundColor RED "Error: Invalid arguments"
	usage
	Exit(2)
}

<# Install Tools -------------------------------------------------------------#>
$path=$Pwd.path
cd $PSScriptRoot

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

$tools = @($Args)
If (($Args.Count -eq 1) -And ($Args -eq "all")) {
	$tools = @("wsl", "git", "vim")
}

For ($i = 0; $i -lt $tools.Length; $i++) {`
	Write-Host -NoNewline "==> Install "
	Write-Host -ForegroundColor YELLOW $tools[$i]
	Switch ($tools[$i]) {
		"wsl" {
			wsl/wsl_install.ps1
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
			Exit(3)
		}
	}
}

refreshenv
Write-Host
