<# Usage Function ------------------------------------------------------------#>
function usage {
	Write-Host
	Write-Host "[Usage]"
	Write-Host "for Windows"
	Write-Host "  usage: .\install.ps1 [list of tools]"
	Write-Host "    list of supported tools"
	Write-Host "    - all"
	Write-Host "    - wsl"
	Write-Host "  ex: .\install.ps1 all"
	Write-Host "  ex: .\install.ps1 wsl"
	Write-Host
}

<# Check PowerShell Version --------------------------------------------------#>
if ($PSVersionTable.PSVersion -ge "5.0") {
	Write-Host "Install tools for Windows"
	Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
	New-Item -Path $profile -ItemType File -Force -Value "Set-Alias vim 'C:\Program Files (x86)\vim\vim80\vim.exe'`r`nSet-Alias git 'C:\Program Files\Git\bin\git.exe'"
}
else {
	Write-Host -ForegroundColor RED "Error: Not supported PowerShell version"
	Write-Host
	Exit(1)
}

<# Check Argument ------------------------------------------------------------#>
if (($Args.Count -lt 1) -Or ($Args.Count -gt 1)) {
	Write-Host
	Write-Host -NoNewline -ForegroundColor RED "Error: Invalid arguments"
	usage
	Exit(2)
}
Write-Host

<# Install Tools -------------------------------------------------------------#>
$path=$Pwd.path
cd $PSScriptRoot

$tools = @($Args)
If (($Args.Count -eq 1) -And ($Args -eq "all")) {
	$tools = @("wsl")
}

For ($i = 0; $i -lt $tools.Length; $i++) {`
	Write-Host -NoNewline "==> Install "
	Write-Host -ForegroundColor YELLOW $tools[$i]
	switch ($tools[$i]) {
		"wsl" {
			wsl/wsl_install.ps1
		 }
		default {
			Write-Host -ForegroundColor RED "Error: Not supported tool"
			Write-Host
			Exit(3)
		}
	}
}
