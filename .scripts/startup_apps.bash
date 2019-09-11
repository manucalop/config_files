#!/bin/bash

# Prevent showing the desktop
gsettings set org.gnome.desktop.background show-desktop-icons false
export XDG_CURRENT_DESKTOP=XFCE
# D-Bus launcher
killall -9 --wait at-spi-bus-launcher
/usr/lib/at-spi2-core/at-spi-bus-launcher --launch-immediately &
# Authentication agent
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
# Compton for compositing and transparency
killall -9 --wait compton
compton --config ~/.config/compton/my_compton.conf &
# Conky
killall -9 --wait conky
conky -c ~/.config/conky/monitor.conf &
#Dropbox
killall -9 --wait dropbox
dropbox start
# Rest of apps
declare -a apps=(
                 "volumeicon"
                 "xfsettingsd"
                 "blueman-applet"
                 "nm-applet"
                 "ibus-daemon"
                 "xcape"
                 "xfce4-power-manager"
                 "system-config-printer-applet"
                 "start-pulseaudio-x11"
                 "light-locker"
                 "xfce4-volumed"
                )
for i in "${apps[@]}"
do
   killall -9 --wait $i
   $i &
   # BACK_PID=$!
   # wait $BACK_PID
done

# Keyboard Default language, pro mode
setxkbmap -layout us; mode "default"
setxkbmap -option && setxkbmap -option ctrl:nocaps && xcape -e 'Control_L=Escape'; mode "default"

# Wallpaper
feh --bg-fill ~/.config/i3/wallpaper_family.jpg
