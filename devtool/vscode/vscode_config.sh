#!/bin/bash
################################################################################
#	@brief		Configure vscode program.
#	@author		llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@history
#		2018.09.20	Created.
################################################################################

# Include Scripts -------------------------------------------------------------#
cd $(dirname $0)
. ../../misc/color.sh

# Configure VSCode ------------------------------------------------------------#
echo -e " => Config ${YELLOW}vscode${END}"
if [ ! -z "$(command -v code)" ]; then
	# Shell
	code --install-extension ms-vscode.powershell
	# Web
	code --install-extension xabikos.reactsnippets
	code --install-extension dbaeumer.vscode-eslint
	code --install-extension msjsdiag.debugger-for-chrome
	code --install-extension esbenp.prettier-vscode
	code --install-extension formulahendry.auto-rename-tag
	code --install-extension formulahendry.auto-close-tag
	# Python
	code --install-extension ms-python.python
	# C/C++
	code --install-extension ms-vscode.cpptools
	code --install-extension twxs.cmake
	code --install-extension webfreak.debug

	rm -rf ~/Library/Application\ Support/Code/User/locale.json
	ln locale.json ~/Library/Application\ Support/Code/User/

	rm -rf ~/Library/Application\ Support/Code/User/settings.json
	ln settings.json ~/Library/Application\ Support/Code/User/

	rm -rf ~/Library/Application\ Support/Code/User/snippets
	mkdir -p ~/Library/Application\ Support/Code/User/snippets
	ln snippets/c.json ~/Library/Application\ Support/Code/User/snippets
else
	echo "    Not installed."
fi
