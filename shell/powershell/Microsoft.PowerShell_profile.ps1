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
Set-Alias python3 'C:\Python36\python.exe'
Set-Alias python python3

function Git-Add { git add $args }
Set-Alias -Name ga -Value Git-Add

function Git-Add-All { git add --all $args }
Set-Alias -Name gaa -Value Git-Add-All

function Git-Branch { git branch $args }
Set-Alias -Name gb -Value Git-Branch

function Git-Branch-Remotes { git branch -r$args }
Set-Alias -Name gbr -Value Git-Branch-Remotes

function Git-Checkout { git checkout $args }
Set-Alias -Name gco -Value Git-Checkout

function Git-Commit { git commit $args }
Set-Alias -Name gcmm -Value Git-Commit

function Git-Commit-Amend { git commit --amend $args }
Set-Alias -Name gcmm! -Value Git-Commit-Amend

function Git-Config { git config $args }
Set-Alias -Name gcf -Value Git-Config

function Git-Diff { git diff $args }
Set-Alias -Name gd -Value Git-Diff

function Git-Fetch { git fetch $args }
Set-Alias -Name gf -Value Git-Fetch

function Git-Help { git help $args }
Set-Alias -Name gh -Value Git-Help

function Git-Log { git log --oneline --graph -50 $args }
Set-Alias -Name glg -Value Git-Log

function Git-Merge { git merge $args }
Set-Alias -Name gmg -Value Git-Merge

function Git-Pull { git pull $args }
Set-Alias -Name gpl -Value Git-Pull

function Git-Push { git push $args }
Set-Alias -Name gpu -Value Git-Push

function Git-Remote { git remote $args }
Set-Alias -Name grm -Value Git-Remote

function Git-Rebase { git rebase $args }
Set-Alias -Name grb -Value Git-Rebase

function Git-Reset { git reset $args }
Set-Alias -Name grst -Value Git-Reset

function Git-Show { git show $args }
Set-Alias -Name gsh -Value Git-Show

function Git-Stash { git stash $args }
Set-Alias -Name gsts -Value Git-Stash

function Git-Status { git status $args }
Set-Alias -Name gst -Value Git-Status

function Git-Tag { git tag $args }
Set-Alias -Name gt -Value Git-Tag
