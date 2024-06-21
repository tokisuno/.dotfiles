#!/usr/bin/sh

nitrogen --restore
picom -CGb
xinput --set-prop 'TPPS/2 IBM TrackPoint' 'libinput Accel Speed' -0.5
xinput --set-prop 'Logitech Wireless Mouse PID:4096' 'Coordinate Transformation Matrix' 0.8 0 0 0 0.8 0 0 0 1
ibus-daemon -drxR
flameshot
dropbox
~/.local/share/scripts/start-conky
setxkbmap -option 'ctrl:nocaps'
