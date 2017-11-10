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
	echo "%{$fg_bold[$color_name]%}%n%{$reset_color%}"
}

hGetPath() {
	echo "%{$fg_bold[blue]%}%~%{$reset_color%}"
}

hGit_GetBranchName() {
	local bname
	if [ -d .git ]; then
		bname=$(command git symbolic-ref HEAD 2> /dev/null) || return 0
		echo "${bname#refs/heads/}"
	fi
}

hGit_GetStatus() {
	if [ -d .git ]; then
		echo "[%{$fg_bold[yellow]%}$(hGit_GetBranchName)%{$reset_color%}]"
	fi
}

PROMPT='
$(hGetUsername) $(hGetPath)
$(hGit_GetStatus) %(!.#.$) '
RPROMPT='%{$fg_bold[black]%}[%*]%{$reset_color%}'
