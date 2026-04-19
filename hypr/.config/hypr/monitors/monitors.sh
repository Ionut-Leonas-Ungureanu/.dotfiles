#!/bin/sh

case $1 in
	monitoradded*)
		echo "works" >> "$HOME/.config/hypr/logs/monitors.log"
		echo "$1" >> "$HOME/.config/hypr/logs/monitors.log"
		;;
	monitoraddedv2*)
		case $1 in
			*eDP-1*)
				# hyprctl keyword monitor "eDP-1, 1920x1080@60, 0x0, 1"
				;;
		esac
		;;
	monitorremovedv2*)
		case $1 in
			*eDP-1*)
				# hyprctl keyword monitor "eDP-1, disable"
				;;
		esac
		;;
esac
