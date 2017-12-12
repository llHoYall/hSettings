#!/bin/bash

# tmux Configuration ----------------------------------------------------------#
if [ -z "$(command -v git)" ]; then
	sudo apt-get install git -y
fi
if ! test -d ~/.tmux; then
	cd ~
	git clone https://github.com/gpakosz/.tmux
else
	cd ~/.tmux
	git pull
	cd -
fi
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local`
