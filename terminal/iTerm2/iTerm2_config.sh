#!/bin/bash
################################################################################
#	@brief		Install iTerm2 program.
#	@author		llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@history
#		2018.09.29	Created.
################################################################################

# Include Scripts -------------------------------------------------------------#
cd $(dirname $0)
. ../../misc/color.sh

# Configure iTerm2 ------------------------------------------------------------#
echo -e " => Config ${YELLOW}iTerm2${END}"
if [ -d "/Applications/iTerm.app" ]; then
	if [ "$(uname -s)" == "Darwin" ]; then
		defaults delete com.googlecode.iterm2
		rm ~/Library/Preferences/com.googlecode.iterm2*
		open iTerm2_sexy.itermcolors
		# open iTerm2_Jellybean.itermcolors
		ln com.googlecode.iterm2.plist ~/Library/Preferences
	fi
else
	echo "    Not installed"
fi
