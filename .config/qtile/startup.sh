#!/usr/bin/zsh

nitrogen --restore &
setxkbmap -option 'ctrl:nocaps' &
picom -CGb &
xinput --set-prop 'TPPS/2 IBM TrackPoint' 'libinput Accel Speed' -0.5 &
xinput --set-prop 'Logitech Wireless Mouse PID:4096' 'Coordinate Transformation Matrix' 0.8 0 0 0 0.8 0 0 0 1 &
ibus-daemon -drxR &
setxkbmap -option 'ctrl:nocaps' &
flameshot &
dropbox &
tmux source-file ~/.config/tmux/tmux.conf &
~/.local/share/scripts/start-conky &
