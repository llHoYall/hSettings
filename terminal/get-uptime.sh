#!/bin/bash

uptime=$(uptime | tr -d "[:space:]")
if [[ ${uptime} =~ "day" ]]; then
	day=${uptime#*up}
	day=${day%day*}
	hour=$(echo ${uptime} | cut -d "," -f 2 | cut -d ":" -f 1)
	min=$(echo ${uptime} | cut -d "," -f 2 | cut -d ":" -f 2)
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
