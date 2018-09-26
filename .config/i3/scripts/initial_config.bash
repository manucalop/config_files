#! /bin/bash
# Configuration
# Session and Startup (XFCE settings)
  # Prevent showing the desktop
    gsettings set org.gnome.desktop.background show-desktop-icons false
  # D-Bus
    /usr/lib/at-spi2-core/at-spi-bus-launcher --launch-immediately
    # Authentication agent
    /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
# For the settings
    export XDG_CURRENT_DESKTOP=XFCE
    xfsettingsd &
# Keyboard Default language, pro mode
    setxkbmap -layout us
    setxkbmap -option && setxkbmap -option ctrl:nocaps && xcape -e 'Control_L=Escape'
# Set local time as system time
#    timedatectl set-local-rtc 1

# For the settings
    export XDG_CURRENT_DESKTOP=XFCE
