<# Chocolatey Profile --------------------------------------------------------#>
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
	Import-Module "$ChocolateyProfile"
}

<# PSColor -------------------------------------------------------------------#>
Import-Module -Name PSColor

<# Posh Git ------------------------------------------------------------------#>
function prompt {
	$origLastExitCode = $LASTEXITCODE

	$curPath = $ExecutionContext.SessionState.Path.CurrentLocation.Path
	if ($curPath.ToLower().StartsWith($Home.ToLower())) {
		$curPath = "~" + $curPath.SubString($Home.Length)
	}

	Write-Host -NoNewline -ForegroundColor Green "$env:username "
	Write-Host -ForegroundColor Blue $curPath
	Write-VcsStatus
	$LASTEXITCODE = $origLastExitCode
	"$('>' * ($nestedPromptLevel + 1)) "
}

Import-Module -Name posh-git
$global:GitPromptSettings.BeforeText = '['
$global:GitPromptSettings.AfterText  = '] '

<# PSReadLink ----------------------------------------------------------------#>
Import-Module -Name PSReadLine

<# Aliasing ------------------------------------------------------------------#>
Set-Alias meld 'C:\Program Files (x86)\Meld\Meld.exe'
Set-Alias python2 'C:\Python27\python.exe'
Set-Alias python3 'C:\Python37\python.exe'
Set-Alias python python3

function Git-Status { git status $args }
Set-Alias -Name gst -Value Git-Status