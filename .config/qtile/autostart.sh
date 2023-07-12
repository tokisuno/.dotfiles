#!/bin/bash

nitrogen --restore 
setxkbmap -option 'ctrl:nocaps' 
picom -c -C -b 
xinput --set-prop 'TPPS/2 IBM TrackPoint' 'libinput Accel Speed' -0.5 
ibus-daemon -drxR
syncthing &
# flameshot &
# dockd --daemon
# xrandr --output eDP1 --below DP-2-2 xrandr --output DP2-2 --mode 1920x1200 --primary 

# just incase
# tlp sercharge 40 90 BAT0 &

