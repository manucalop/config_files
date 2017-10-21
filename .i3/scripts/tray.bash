#!/bin/bash
killall -9 --wait dropbox volumeicon blueman-applet nm-applet ibus-daemon conky compton dunst conky 
dropbox start
sleep 1
volumeicon &
sleep 1
ibus-daemon &
sleep 1
blueman-applet &
sleep 1
nm-applet &
# Compton for compositing and transparency
compton &
# Dunst for notification messages
dunst &
sleep 1
# Conky
conky -c ~/.config/conky/monitor.conf &
