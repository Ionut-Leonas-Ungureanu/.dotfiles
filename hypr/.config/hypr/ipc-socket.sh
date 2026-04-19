#!/bin/sh

#mkdir logs

handle() {
  case $1 in
    monitor*)
		echo "handle() $1"
		$HOME/.config/hypr/monitors/monitors.sh "$1"
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
