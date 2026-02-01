#!/bin/bash

sudo ufw allow 5900/tcp
sudo ufw reload
hyprctl output create headless VNC-1
sleep 0.2
hyprctl keyword monitor "VNC-1, 2560x1440@60,auto,1"
# wayvnc -o VNC-1 0.0.0.0 5900
wayvnc -o VNC-1 --config="$HOME/.config/wayvnc/config"
hyprctl output remove VNC-1
sudo ufw delete allow 5900/tcp
sudo ufw reload
