#/bin/sh

run() {
    if ! pgrep -f "$1"; then
        "$@" &
    fi
}

run "nitrogen" --restore

# compositor
run "picom" -b

# These break startup for some reason so comment out one or the other when you need it

# # trackpoint settings
# xinput --set-prop 'TPPS/2 IBM TrackPoint' 'libinput Accel Speed' -0.5 &

# trackball sensitivity
run "xinput" --set-prop 'Logitech ERGO M575' 'Coordinate Transformation Matrix' 0.8 0 0 0 0.8 0 0 0 1

# ibus input manager
run "ibus-daemon" -drxR

# screenshot client
run "flameshot"

# file syncing
run "dropbox"

# emacs daemon
# gets annoying to run every time
# ( exec "$HOME/.local/share/scripts/macdr" )

# maps caps to ctrl
run "setxkbmap" -option 'ctrl:nocaps'

run "pactl" set-default-sink alsa_output.usb-GeneralPlus_USB_Audio_Device-00.analog-stereo

# audio fuckery to get it working consistently
run "pactl" set-sink-volume @DEFAULT_SINK@ 25%

# autolocking with xautolock & i3lock-color (aur)
( exec "$HOME/.local/share/scripts/autolock" )
