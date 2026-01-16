#!/bin/bash

#    __            __   _         ___             
#   / /_____ __ __/ /  (_)__  ___/ (_)__  ___ ____
#  /  '_/ -_) // / _ \/ / _ \/ _  / / _ \/ _ `(_-<
# /_/\_\\__/\_, /_.__/_/_//_/\_,_/_/_//_/\_, /___/
#          /___/                        /___/     
# 


HYPR_CONF="$HOME/.config/hypr/configs/keybinds.conf"
ROFI_CONF="$HOME/.config/rofi/themes/key-hint/keybinding.rasi"
# extract the keybinding from hyprland.conf
mapfile -t BINDINGS < <(grep '^bind=' "$HYPR_CONF" | \
    sed -e 's/  */ /g' -e 's/bind=//g' -e 's/, /,/g' -e 's/ # /,/' -e 's/exec//g' | \
    sed -e 's/$mainMod/ win/'| \
    awk -F, -v q="'" '{cmd=""; for(i=3;i<NF;i++) cmd=cmd $(i) " ";print "<b>"$1 " + " $2 "</b>  <i>" $NF ",</i><span color=" q "gray" q ">" cmd "</span>"}')

CHOICE=$(printf '%s\n' "${BINDINGS[@]}" | rofi -dmenu -config $ROFI_CONF -i -markup-rows -p "Keybinding:")

# extract cmd from span <span color='gray'>cmd</span>
CMD=$(echo "$CHOICE" | sed -n 's/.*<span color='\''gray'\''>\(.*\)<\/span>.*/\1/p')

# execute it if first word is exec else use hyprctl dispatch
if [[ $CMD == exec* ]]; then
    eval "$CMD"
else
    hyprctl dispatch "$CMD"
fi
