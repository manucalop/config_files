#!/bin/bash
killall -9 --wait dropbox volumeicon blueman-applet nm-applet ibus-daemon conky compton dunst conky xfce4-power-manager
# Apps
# Compton for compositing and transparency
compton --config ~/.config/compton/my_compton.conf &
# Dunst for notification messages
dunst &
# Conky
conky -c ~/.config/conky/monitor.conf &

# System tray
dropbox start
sleep 1
ibus-daemon &
sleep 1
blueman-applet &
sleep 1
volumeicon &
sleep 1
nm-applet &
sleep 1
xfce4-power-manager

