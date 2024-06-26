#/bin/sh

run() {
    if ! pgrep -f "$1"; then
        "$@" &
    fi
}

# compositor
picom -CGb

# trackpoint settings
xinput --set-prop 'TPPS/2 IBM TrackPoint' 'libinput Accel Speed' -0.5

# trackball sensitivity
xinput --set-prop 'Logitech Wireless Mouse PID:4096' 'Coordinate Transformation Matrix' 0.8 0 0 0 0.8 0 0 0 1

# ibus input manager
ibus-daemon -drxR

# screenshot client
flameshot

# file syncing
run "dropbox"

# emacs daemon
( exec "$HOME/.local/share/scripts/macdr" )

# maps caps to ctrl
setxkbmap -option 'ctrl:nocaps'

# volume icon
run "volumeicon"

# audio fuckery to get it working consistently
pactl set-sink-volume @DEFAULT_SINK@ 30%
systemctl --user restart pipewire.service
