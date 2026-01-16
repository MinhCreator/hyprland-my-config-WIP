#!/bin/bash

#hide cursor
tput civis

#clear sreen
clear

# get terminal size
rows=$(tput lines)
cols=$(tput cols)

#diplay the message
msg="WELCOME BACK, MY MASTER!"

#calculate center position

msg_len=${#msg}
row_pos=$((rows / 2))
col_pos=$(((cols - msg_len) / 2))

# Move cursor and display message
tput cup $row_pos $col_pos
tput bold
echo -e "\e[1;97m$msg\e[0m"
tput sgr0

# wait then restore cursor before exit
sleep 3
tput cnorm
