#!/bin/bash

# Installation ----------------------------------------------------------------#
if [[ "$(uname)" == "Darwin" ]]
then
	brew install vim
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]
then
	apt-get install vim
fi
cp vim/.vimrc ~/

# Color Scheme ----------------------------------------------------------------#
if ! test -d ~/.vim/colors
then
	mkdir -p ~/.vim/colors
fi
cp vim/colors/*.vim ~/.vim/colors

# Vundle Package Manager ------------------------------------------------------#
if ! test -d ~/.vim/bundle/Vundle.vim
then
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
	cd ~/.vim/bundle/Vundle.vim
	git pull
	cd -
fi
vim +PluginInstall +qall

# Install ctags ---------------------------------------------------------------#
if [[ "$(uname)" == "Darwin" ]]
then
	brew install ctags
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]
then
	sudo apt install exuberant-ctags
fi

