<# Usage Function ------------------------------------------------------------#>
function usage {
	Write-Host
	Write-Host "[Usage]"
	Write-Host "for Windows"
	Write-Host "  usage: .\setting.ps1 [list of tools]"
	Write-Host "    list of supported tools"
	Write-Host "    - all"
	Write-Host "		- shell"
	Write-Host "    - git"
	Write-Host "		- vim"
	Write-Host "  ex: .\setting.ps1 all"
	Write-Host "  ex: .\setting.ps1 git vim"
	Write-Host
}

<# Check PowerShell Version --------------------------------------------------#>
if ($PSVersionTable.PSVersion -ge "5.0") {
	Write-Host
	Write-Host "Setting tools for Windows"
	Write-Host
}
else {
	Write-Host -ForegroundColor RED "Error: Not supported PowerShell version"
	Write-Host
	Exit(1)
}

<# Check Argument ------------------------------------------------------------#>
if (($Args.Count -lt 1) -Or ($Args.Count -gt 2)) {
	Write-Host
	Write-Host -NoNewline -ForegroundColor RED "Error: Invalid arguments"
	usage
	Exit(2)
}

<# Install Tools -------------------------------------------------------------#>
$path=$Pwd.path
Set-Location $PSScriptRoot

$tools = @($Args)
If (($Args.Count -eq 1) -And ($Args -eq "all")) {
	$tools = @("shell", "git", "vim")
}

For ($i = 0; $i -lt $tools.Length; $i++) {`
	Write-Host -NoNewline "==> Setting "
	Write-Host -ForegroundColor YELLOW $tools[$i]
	switch ($tools[$i]) {
		"shell" {
			Set-Location shell
			.\powershell_setting.ps1
			Set-Location $PSScriptRoot
		}
		"git" {
			Set-Location git
			.\git_setting.ps1 $path
			Set-Location $PSScriptRoot
		}
		"vim" {
			Set-Location vim
			.\vim_setting.ps1
			Set-Location $PSScriptRoot
		}
		default {
			Write-Host -ForegroundColor RED "Error: Not supported tool"
			Write-Host
			Exit(3)
		}
	}
}

<# Change Directory ----------------------------------------------------------#>
cd $path
Write-Host
