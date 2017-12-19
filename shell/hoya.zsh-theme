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
	echo "%{$fg[blue]%}%~%{$reset_color%}"
}

hGit_GetBranchName() {
	echo $(command git rev-parse --abbrev-ref HEAD 2> /dev/null)
}

hGit_GetModified() {
	echo $(git status | grep 'modified' | wc -l)
}

hGit_GetStatus() {
	if git rev-parse --git-dir > /dev/null 2>&1; then
		echo -n "["
		echo -n "%{$fg[yellow]%}$(hGit_GetBranchName)%{$reset_color%}"
		echo -n " %{$fg[red]%}+$(hGit_GetModified)%{$reset_color%}"
		echo "]"
	fi
}

PROMPT='
$(hGetUsername) $(hGetPath)
$(hGit_GetStatus) %(!.#.$) '
RPROMPT='%{$fg[white]%}[%*]%{$reset_color%}'
