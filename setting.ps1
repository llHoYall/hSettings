<# Usage Function ------------------------------------------------------------#>
function usage {
	Write-Host
	Write-Host "[Usage]"
	Write-Host "for Windows"
	Write-Host "  usage: .\setting.ps1 [list of tools]"
	Write-Host "    list of supported tools"
	Write-Host "    - all"
	Write-Host "    - git" 
	Write-Host "  ex: .\setting.ps1 all"
	Write-Host "  ex: .\setting.ps1 git"
	Write-Host
}

<# Check PowerShell Version --------------------------------------------------#>
if ($PSVersionTable.PSVersion -ge "5.0") {
	Write-Host "Setting tools for Windows"
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
Write-Host

<# Install Tools -------------------------------------------------------------#>
$path=$Pwd.path
cd $PSScriptRoot

$tools = @($Args)
If (($Args.Count -eq 1) -And ($Args -eq "all")) {
	$tools = @("git")
}

For ($i = 0; $i -lt $tools.Length; $i++) {`
	Write-Host -NoNewline "==> Setting "
	Write-Host -ForegroundColor YELLOW $tools[$i]
	switch ($tools[$i]) {
		"git" {
			git/git_setting.ps1 $path
		 }
		default {
			Write-Host -ForegroundColor RED "Error: Not supported tool"
			Write-Host
			Exit(3)
		}
	}
}
