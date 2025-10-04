#!/bin/bash

echo "monitors.sh started at $(date)" >> /home/uionutleonas/.config/hypr/monitors.log

if [ "$(upower -d | grep "lid-is-closed" | awk '{print $2}')" = "yes" ]; then
	echo "Lid is closed, disabling monitor..."
	sed -i '/monitor = eDP-1,/c\monitor = eDP-1, disabled' ~/.config/hypr/hyprland.conf
else
	echo "Lid is open, setting up lid monitor..."
	sed -i '/monitor = eDP-1,/c\monitor = eDP-1, 1920x1080@60, 0x0, 1' ~/.config/hypr/hyprland.conf
fi

hyprctl reload
