#!/bin/bash

# Install RVM (Ruby Version Manager)
curl -sSL https://get.rvm.io | sudo bash -s stable

# Install zsh
sudo apt-get install zsh
chsh -s `which zsh`

# Install oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# Setting file
cp zsh/hoya.zsh-theme ~/.oh-my-zsh/themes/
cp zsh/.zshrc ~/

