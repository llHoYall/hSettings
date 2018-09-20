#!/bin/bash
################################################################################
#	@brief		Install tmux program.
#	@author		llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@history
#		2018.03.22	Created.
################################################################################

# Include Scripts -------------------------------------------------------------#
cd $(dirname $0)
. ../../misc/color.sh

# Install Tmux ----------------------------------------------------------------#
echo -e " => Install ${YELLOW}tmux${END}"
if [ -z "$(command -v tmux)" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		brew install tmux
	elif [ "$(uname -s)" == "Linux" ]; then
		sudo apt install -y tmux
	fi
else
	echo "    Already installed"
fi

# Install Tmuxinator ----------------------------------------------------------#
echo -e " => Install ${YELLOW}tmuxinator${END}"
if [ -z "$(command -v tmuxinator)" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		brew install ruby
		gem install tmuxinator
	elif [ "$(uname -s)" == "Linux" ]; then
		sudo apt install -y tmuxinator
	fi
else
	echo "    Already installed"
fi
