#!/bin/bash
################################################################################
#	@brief		Install web program.
#	@author		llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@history
#		2018.09.21	Created.
################################################################################

# Include Scripts -------------------------------------------------------------#
cd $(dirname $0)
. ../../misc/color.sh

# Install NVM -----------------------------------------------------------------#
echo -e " => Install ${YELLOW}nvm${END}"
if [ -z "$(command -v nvm)" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		brew install nvm
	elif [ "$(uname -s)" == "Linux" ]; then
		curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
		export NVM_DIR="$HOME/.nvm"
		[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
		[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
	fi
else
	echo "    Already installed"
fi
