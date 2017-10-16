# HoYa's zsh theme

if [ $UID -eq 0 ]; then
	NAME_COLOR="red";		# root
else
	NAME_COLOR="green";
fi

PROMPT='
%{$fg[$NAME_COLOR]%}%n%{$reset_color%} %{$FG[033]%}${PWD/#$HOME/~}%{$reset_color%}
%{$FG[226]%}$(git_prompt_info)%{$reset_color%}%(!.#.$) '
RPROMPT='%{$FG[239]%}[%*]%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[226]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}v"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"
