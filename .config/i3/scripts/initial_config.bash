#! /bin/bash
# Configuration
# Prevent nautilus from showing the desktop
    gsettings set org.gnome.desktop.background show-desktop-icons false
# Authentication agent
    /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
# For the settings
    export XDG_CURRENT_DESKTOP=GNOME
    gnome-settings-daemon &
# Keyboard Default language, pro mode
    setxkbmap -layout us; mode "default"
    setxkbmap -option && setxkbmap -option ctrl:nocaps && xcape -e 'Control_L=Escape'; mode "default"
# Set local time as system time
#    timedatectl set-local-rtc 1
