#! /bin/bash
# Configuration
# Prevent nautilus from showing the desktop
    gsettings set org.gnome.desktop.background show-desktop-icons false
# Authentication agent
    /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
# For the settings
    export XDG_CURRENT_DESKTOP=GNOME
    gnome-settings-daemon &
# Keyboard
    setxkbmap -layout us -option ctrl:nocaps
