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

if [ $UID -eq 0 ]; then
	NAME_COLOR="red";			# root
else
	NAME_COLOR="green";		# user
fi

PROMPT='
$fg[$NAME_COLOR]%n%{$reset_color%} $FG[033]%~%{$reset_color%}
$FG[226]$(git_prompt_info)%{$reset_color%}%(!.#.$) '
RPROMPT='$FG[239][%*]%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="($FG[226]%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%B%{$reset_color%}) "
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]v"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]*"
