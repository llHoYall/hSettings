#!/bin/bash
################################################################################
#	@brief		Configure vim program.
#	@author		llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@history
#		2018.10.04	Created.
################################################################################

# Configure Neovim ------------------------------------------------------------#
echo -e " => Config ${YELLOW}neovim${END}"
if [ ! -z "$(command -v nvim)" ]; then
	rm -rf ~/.config/nvim/pack/bundle/start/fzf
	git clone https://github.com/junegunn/fzf ~/.config/nvim/pack/bundle/start/fzf
else
	echo "    Not installed."
fi

# # Vim Configuration -----------------------------------------------------------#
# cp .vimrc ~/

# # Color Configuration ---------------------------------------------------------#
# if ! test -d ~/.vim/colors; then
# 	mkdir -p ~/.vim/colors
# fi
# cp colors/*.vim ~/.vim/colors

# # Plugin Configuration --------------------------------------------------------#
# if ! test -d ~/.vim/plugin; then
# 	mkdir -p ~/.vim/plugin
# fi
# cp plugin/*.vim ~/.vim/plugin

# if [ -z "$(command -v git)" ]; then
# 	sudo apt-get install git -y
# fi
# if ! test -d ~/.vim/bundle/Vundle.vim; then
# 	git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
# else
# 	cd ~/.vim/bundle/Vundle.vim
# 	git pull
# 	cd -
# fi
# vim +PluginInstall +qall
