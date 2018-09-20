#!/bin/bash
################################################################################
#	@brief		Configure zsh program.
#	@author		llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@history
#		2018.04.04	Created.
################################################################################

# Include Scripts -------------------------------------------------------------#
cd $(dirname $0)
. ../../misc/color.sh

# Configure Zsh ---------------------------------------------------------------#
echo -e " => Config ${YELLOW}zsh${END}"
if [ ! -z "$(command -v zsh)" ]; then
	rm -rf ~/.zshrc
	ln .zshrc ~
else
	echo "    Not installed."
fi

# Configure oh-my-zsh ---------------------------------------------------------#
echo -e " => Config ${YELLOW}oh-my-zsh${END}"
if [ -d ~/.oh-my-zsh ]; then
	rm -rf ~/.oh-my-zsh/themes/hoya.zsh-theme
	sudo ln hoya.zsh-theme ~/.oh-my-zsh/themes/
else
	echo "    Not installed."
fi

echo -e "    ${RED}source ~/.zshrc${END}"
