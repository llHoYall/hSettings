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

hGet_Username() {
	local color_name
	if [ $UID -eq 0 ]; then
		color_name="red"			# root
	else
		color_name="green"		# user
	fi
	echo "%{$fg_bold[$color_name]%}%n%{$reset_color%}"
}

hGet_Path() {
	echo "%{$fg_bold[blue]%~%{$reset_color%}"
}

hGet_GitStatus() {
	local ref
	if [[ "$(command git config --get oh-my-zsh.hide-status 2> /dev/null)" != "1" ]]; then
		ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
		ref=$(command git rev-parse --short HEAD 2 > /dev/null) ||
		return 0
		echo "[$fg_bold[yellow]${ref#refs/heads/}%{$reset_color%}]"
	fi
}

PROMPT='
$(hGet_Username) $(hGet_Path)
$(hGet_GitStatus) %(!.#.$) '
RPROMPT='$fg[gray][%*]%{$reset_color%}'
