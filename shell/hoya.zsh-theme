# HoYa's zsh theme

# Prompt Setting --------------------------------------------------------------#
#
# %n	: $USERNAME
# %~	: $PWD ($HOME is '~')
# %(x.true-text.false-text)	: If x is true then true-text, else false text
#		!	: True if the shell is running with privileges.
#				%(!.#.$)
#				-> If root, prompt is #.
#				-> If user, prompt is $.
# %*	: current time of day in 24-hour format, with seconds.
# %B	: start boldface mode.

hGetUsername() {
	local color_name
	if [ $UID -eq 0 ]; then
		color_name="red"			# root
	else
		color_name="green"		# user
	fi
	echo "%{$fg[$color_name]%}%n%{$reset_color%}"
}

hGetPath() {
	echo "%{$fg_bold[blue]%}%~%{$reset_color%}"
}

hGit_GetBranchName() {
	echo -n $(command git rev-parse --abbrev-ref HEAD 2> /dev/null)
}

hGit_GetRemote() {
	local ahead=$(git rev-list --left-right --count master...origin | cut -d '	' -f1)
	local behind=$(git rev-list --left-right --count master...origin | cut -d '	' -f2)
	if [ $ahead -gt 0 ]; then
		echo " ↑$ahead"
	fi
	if [ $behind -gt 0 ]; then
		echo " ↓$behind"
	fi
}

hGit_GetStaged() {
	local modified=$(git status -s | egrep -c '^M.')
	if [ $modified -gt 0 ]; then
		echo -n " ~$modified"
	fi
	local added=$(git status -s | egrep -c '^A.')
	if [ $added -gt 0 ]; then
		echo -n " +$added"
	fi
	local removed=$(git status -s | egrep -c '^D.')
	if [ $removed -gt 0 ]; then
		echo -n " -$removed"
	fi
}

hGit_GetWorkDir() {
	local modified=$(git status -s | egrep -c '^.M')
	if [ $modified -gt 0 ]; then
		echo -n " ~$modified"
	fi
	local untracked=$(git ls-files -o --exclude-standard | wc -l | tr -d ' ')
	if [ $untracked -gt 0 ]; then
		echo -n " +$untracked"
	fi
	local removed=$(git status -s | egrep -c '^.D')
	if [ $removed -gt 0 ]; then
		echo -n " -$removed"
	fi
}

hGit_GetClean() {
	if [[ -z $(hGit_GetRemote) && -z $(hGit_GetStaged) && -z $(hGit_GetWorkDir) ]]; then
		echo "*"
	fi
}

hGit_GetStatus() {
	if git rev-parse --git-dir > /dev/null 2>&1; then
		echo -n "["
		echo -n "%{$fg_bold[yellow]%}$(hGit_GetBranchName)%{$reset_color%}"
		echo -n "%{$fg[magenta]%}$(hGit_GetRemote)%{$reset_color%}"
		echo -n "%{$fg[cyan]%}$(hGit_GetStaged)%{$reset_color%}"
		echo -n "%{$fg[red]%}$(hGit_GetWorkDir)%{$reset_color%}"
		echo -n "%{$fg_bold[green]%}$(hGit_GetClean)%{$reset_color%}"
		echo "]"
	fi
}

PROMPT='
$(hGetUsername) $(hGetPath)
$(hGit_GetStatus) %(!.#.$) '
RPROMPT='%{$fg[white]%}[%*]%{$reset_color%}'
