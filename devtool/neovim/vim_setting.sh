#!/bin/bash

# Vim Configuration -----------------------------------------------------------#
cp .vimrc ~/

# Color Configuration ---------------------------------------------------------#
if ! test -d ~/.vim/colors; then
	mkdir -p ~/.vim/colors
fi
cp colors/*.vim ~/.vim/colors

# Plugin Configuration --------------------------------------------------------#
if ! test -d ~/.vim/plugin; then
	mkdir -p ~/.vim/plugin
fi
cp plugin/*.vim ~/.vim/plugin

if [ -z "$(command -v git)" ]; then
	sudo apt-get install git -y
fi
if ! test -d ~/.vim/bundle/Vundle.vim; then
	git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
else
	cd ~/.vim/bundle/Vundle.vim
	git pull
	cd -
fi
vim +PluginInstall +qall

# Install ctags ---------------------------------------------------------------#
#if [[ "$(uname)" == "Darwin" ]]
#then
	#brew install ctags
#elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]
#then
	#sudo apt install exuberant-ctags
#fi
