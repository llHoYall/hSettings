#!/bin/bash
################################################################################
#	@file			terminal/tmux_config.sh
#	@brief		This file configures tmux program.
#	@author		llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@note
#		-	2018.03.23	Created.
################################################################################

# Include Scripts -------------------------------------------------------------#
cd $(dirname $0)
. ../../misc/color.sh

# Configure Tmux --------------------------------------------------------------#
echo -e " => Config ${YELLOW}tmux${END}"
if [ ! -z "$(command -v tmux)" ]; then
	rm -rf ~/.tmux ~/.tmux.conf
	mkdir -p ~/.tmux
	ln tmux_config_statusbar.sh ~/.tmux
	ln .tmux.conf ~
else
	echo "    Not installed."
fi

echo -e "    ${GREEN}<CTRL-b> + r${END}"
