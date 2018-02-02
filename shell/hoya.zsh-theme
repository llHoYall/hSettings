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

hGit_GetStatus() {
	if git rev-parse --is-inside-work-tree &> /dev/null; then
		local isClean=y

		# Get Branch Name
		local name=$(command git rev-parse --abbrev-ref HEAD 2> /dev/null)

		# Get Remote Status
		local ahead=0
		local behind=0
		if [ ! -z $(git remote) ]; then
			ahead=$(git rev-list --left-right --count master...origin/master | cut -d '	' -f1)
			behind=$(git rev-list --left-right --count master...origin/master | cut -d '	' -f2)
		fi

		# Get Staging Area Status
		local sa_modified=$(git status -s | egrep -c '^M.')
		local sa_added=$(git status -s | egrep -c '^A.')
		local sa_removed=$(git status -s | egrep -c '^D.')

		# Get Working Directory Status
		local wd_modified=$(git status -s | egrep -c '^.M')
		local wd_untracked=$(git status -s -u | egrep -c '^\?\?')
		local wd_removed=$(git status -s | egrep -c '^.D')

		# Display Information
		echo -n "["
		echo -n "%{$fg_bold[yellow]%}$name%{$reset_color%}"
		if [ $ahead -gt 0 ]; then
			isClean=n
			echo -n "%{$fg[magenta]%} ↑$ahead%{$reset_color%}"
		fi
		if [ $behind -gt 0 ]; then
			isClean=n
			echo -n "%{$fg[magenta]%} ↓$behind%{$reset_color%}"
		fi
		if [ $sa_modified -gt 0 ]; then
			isClean=n
			echo -n "%{$fg[cyan]%} ~$sa_modified%{$reset_color%}"
		fi
		if [ $sa_added -gt 0 ]; then
			isClean=n
			echo -n "%{$fg[cyan]%} +$sa_added%{$reset_color%}"
		fi
		if [ $sa_removed -gt 0 ]; then
			isClean=n
			echo -n "%{$fg[cyan]%} -$sa_removed%{$reset_color%}"
		fi
		if [ $wd_modified -gt 0 ]; then
			isClean=n
			echo -n "%{$fg[red]%} ~$wd_modified%{$reset_color%}"
		fi
		if [ $wd_untracked -gt 0 ]; then
			isClean=n
			echo -n "%{$fg[red]%} +$wd_untracked%{$reset_color%}"
		fi
		if [ $wd_removed -gt 0 ]; then
			isClean=n
			echo -n "%{$fg[red]%} -$wd_removed%{$reset_color%}"
		fi
		if [ $isClean = y ]; then
			echo -n "%{$fg_bold[green]%} *%{$reset_color%}"
		fi
		echo "]"
	fi
}

PROMPT='
$(hGetUsername) $(hGetPath)
$(hGit_GetStatus) %(!.#.$) '
RPROMPT='%{$fg[white]%}[%*]%{$reset_color%}'
