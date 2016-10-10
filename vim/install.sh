#!/bin/bash

if [[ "$(uname)" == "Darwin" || "$(expr substr $(uname -s) 1 5)" == "Linux" ]]
then
	cp .vimrc ~/
else
	cp _vimrc ~/
fi
if ! test -d ~/.vim/colors
then
	mkdir -p ~/.vim/colors
fi
cp *.vim ~/.vim/colors
if ! test -d ~/.vim/bundle/Vundle.vim
then
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
	cd ~/.vim/bundle/Vundle.vim
	git pull
	cd -
fi
vim +PluginInstall +qall
sudo apt install exuberant-ctags
