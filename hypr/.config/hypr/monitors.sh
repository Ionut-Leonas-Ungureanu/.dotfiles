#!/bin/bash

dbus-monitor --system \
  "type='signal',sender='org.freedesktop.login1'" |
while read -r line; do
    if [[ "$line" =~ boolean\ (true|false) ]]; then
        state="${BASH_REMATCH[1]}"
        # echo "LidClosed = $state"
		if [[ $state == "true" ]]; then
			echo "lid closed"
			hyprctl keyword monitor "eDP-1, disable"
		else
			echo "lid opened"
			hyprctl keyword monitor "eDP-1, 1920x1080@60, 0x0, 1"
		fi
    fi
done
