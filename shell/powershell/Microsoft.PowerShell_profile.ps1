<# Default Starting Location -------------------------------------------------#>
# Set-Location $HOME

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
# Set-Alias vim 'C:\Program Files (x86)\vim\vim80\vim.exe'
Set-Alias vim 'C:\tools\neovim\Neovim\bin\nvim.exe'
Set-Alias meld 'C:\Program Files (x86)\Meld\Meld.exe'
Set-Alias python2 'C:\Python27\python.exe'
Set-Alias python3 'C:\Python37\python.exe'
Set-Alias python python3

function Git-Add { git add $args }
Set-Alias -Name gad -Value Git-Add

function Git-Branch { git branch $args }
Set-Alias -Name gbr -Value Git-Branch

function Git-Checkout { git checkout $args }
Set-Alias -Name gco -Value Git-Checkout

function Git-Commit { git commit $args }
Set-Alias -Name gcmm -Value Git-Commit

function Git-Config { git config $args }
Set-Alias -Name gcf -Value Git-Config

function Git-Log { git log --oneline --graph -50 $args }
Set-Alias -Name gl -Value Git-Log

function Git-Show { git show $args }
Set-Alias -Name gsh -Value Git-Show

function Git-Stash { git stash $args }
Set-Alias -Name gsts -Value Git-Stash

function Git-Status { git status $args }
Set-Alias -Name gst -Value Git-Status
