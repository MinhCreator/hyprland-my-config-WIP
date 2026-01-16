#!/bin/bash

kitty --override font_size=35 --title=greeting $HOME/.config/hypr/scripts/startup-greeting.sh &
# Simple script to delay startup app
sleep 10s 
# activate authentication
systemctl --user start hyprpolkitagent & 
sleep 10s 
# network manager
nm-applet &
sleep 1 
# bluetooth
blueman-applet & 

sleep 10s 
wl-paste --type text --watch cliphist store & # Stores only text data
wl-paste --type image --watch cliphist store # Stores only image data
