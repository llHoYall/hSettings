#!/bin/bash
################################################################################
#	@brief		Configure tmux's status bar.
#						Get uptime of server and show it to status bar.
#	@author		llHoYall <hoya128@gmail.com>
#	@version	v1.0
#	@history
#		2018.03.23	Created.
################################################################################

uptime=$(uptime | tr -d "[:space:]")
if [[ ${uptime} =~ "day" ]]; then
	day=${uptime#*up}
	day=${day%day*}
	if [[ ${uptime} =~ "min" ]]; then
		hour="0"
		min=${uptime#*days,}
		min=${min%min*}
	else
		hour=$(echo ${uptime} | cut -d "," -f 2 | cut -d ":" -f 1)
		min=$(echo ${uptime} | cut -d "," -f 2 | cut -d ":" -f 2)
	fi
elif [[ ${uptime} =~ "min" ]]; then
	day="0"
	hour="0"
	min=${uptime#*up}
	min=${min%min*}
else
	day="0"
	hour=${uptime#*up}
	hour=$(echo ${hour} | cut -d "," -f 1 | cut -d ":" -f 1)
	min=${uptime#*up}
	min=$(echo ${min} | cut -d "," -f 1 | cut -d ":" -f 2)
fi
echo ${day}"d "${hour}"h "${min}"m"
