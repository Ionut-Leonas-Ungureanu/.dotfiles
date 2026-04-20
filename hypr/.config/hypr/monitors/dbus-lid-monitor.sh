#!/bin/bash

dbus-monitor --system \
  "type='signal',sender='org.freedesktop.login1'" |
while read -r line; do
    if [[ "$line" =~ boolean\ (true|false) ]]; then
        state="${BASH_REMATCH[1]}"
        # echo "LidClosed = $state"
		if [[ $state == "true" ]]; then
			echo "lid closed"
			# create a headless monitor
			hyprctl output create headless HEADLESS-1
			sleep 0.2
			hyprctl keyword monitor "HEADLESS-1, 2560x1440@60,auto,1"
			hyprctl dispatch moveworkspacetomonitor 0 HEADLESS-1

			hyprctl keyword monitor "eDP-1, disable"
		else
			echo "lid opened"
			hyprctl keyword monitor "eDP-1, 1920x1080@60, 0x0, 1"
			sleep 0.2
			# hyprctl output remove HEADLESS-1
		fi
    fi
done
