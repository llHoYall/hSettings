#!/bin/bash

mkdir -p ~/.vim/colors
cp *.vim ~/.vim/colors
vim +PluginInstall +qall
