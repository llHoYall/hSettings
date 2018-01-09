#!/bin/bash

if [[ $(uptime) =~ "days" ]]; then
	uptime | awk -F '( |,|:)+' '{print $6"d",$8"h",$9"m"}'
else
	test=${test}
fi
