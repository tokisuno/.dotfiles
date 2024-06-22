#/bin/sh

run() {
    if ! pgrep -f "$1"; then
        "$@" &
    fi
}

# compositor
run "picom -CGb"

# trackpoint settings
run "xinput --set-prop 'TPPS/2 IBM TrackPoint' 'libinput Accel Speed' -0.5"

# trackball sensitivity
run "xinput --set-prop 'Logitech Wireless Mouse PID:4096' 'Coordinate Transformation Matrix' 0.8 0 0 0 0.8 0 0 0 1"

# ibus input manager
run "ibus-daemon -drxR"

# screenshot client
run "flameshot"

# file syncing
run "dropbox"

# conky for lists and schedule
run "~/.local/share/scripts/start-conky"

# maps caps to ctrl
run "setxkbmap -option 'ctrl:nocaps'"

# volume icon
run "volumeicon"
