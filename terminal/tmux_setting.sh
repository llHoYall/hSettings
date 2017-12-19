#!/bin/bash

get_uptime() {
	echo $(uptime | awk -F'( |,|:)+' '{print $6"d",$8"h",$9"m"}')
}

tmux set -g status-left-length 30
# Sexy Color Palette
tmux set -g status-left "#[fg=#b5bd68] [#S]#[fg=#de935f] $(get_uptime) "
