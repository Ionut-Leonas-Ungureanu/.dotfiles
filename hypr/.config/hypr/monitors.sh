#!/bin/bash

# echo "monitors.sh started at $(date)" >> /home/uionutleonas/.config/hypr/monitors.log

# if [ "$(upower -d | grep "lid-is-closed" | awk '{print $2}')" = "yes" ]; then
# 	echo "Lid is closed, disabling monitor..."
# 	sed -i '/monitor = eDP-1,/c\monitor = eDP-1, disabled' ~/.config/hypr/hyprland.conf
# else
# 	echo "Lid is open, setting up lid monitor..."
# 	sed -i '/monitor = eDP-1,/c\monitor = eDP-1, 1920x1080@60, 0x0, 1' ~/.config/hypr/hyprland.conf
# fi

echo "Configuring the monitors..."
if [[ "$#" -eq 0 ]]; then
	cp monitors-default.conf monitors.conf
else
	while [[ "$#" -gt 0 ]]; do
		case $1 in
			2|docked)
				cp monitors-docked.conf monitors.conf
				;;
			*)
				cp monitors-default.conf monitors.conf
				;;
		esac
		shift
	done
fi

echo "Reloading hyprland..."
hyprctl reload
