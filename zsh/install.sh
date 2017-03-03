#!/bin/bash

# Install zsh
sudo apt-get install zsh
chsh -s `which zsh`

# Install oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

