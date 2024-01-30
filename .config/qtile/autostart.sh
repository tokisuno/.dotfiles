#!/bin/bash

nitrogen --restore 
# setxkbmap -option 'ctrl:nocaps'
picom -cGB
xinput --set-prop 'TPPS/2 IBM TrackPoint' 'libinput Accel Speed' -0.5
xinput --set-prop 'Logitech Wireless Mouse PID:4096' 'Coordinate Transformation Matrix' 0.8 0 0 0 0.8 0 0 0 1
ibus-daemon -drxR
setxkbmap -option 'ctrl:nocaps'
~/.local/share/scripts/start-tmux
syncthing &
flameshot &

