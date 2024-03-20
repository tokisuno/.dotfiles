#!/bin/bash

xrandr --output DVI-D-0 --mode 1920x1200 --primary &&
xrandr --output HDMI-0 --mode 1920x1080 --left-of DVI-D-0 &&
nitrogen --restore &&
conky_start.sh
