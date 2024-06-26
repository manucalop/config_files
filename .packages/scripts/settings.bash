#!/usr/bin/env bash

# Destktop config
gsettings set org.gnome.gnome-flashback desktop false
gsettings set org.gnome.gnome-flashback root-background true
#gsettings set org.gnome.settings-daemon.plugins.keyboard active false

# Theme config
gsettings set org.gnome.desktop.interface cursor-theme 'Breeze_Snow'
gsettings set org.gnome.desktop.interface icon-theme 'breeze'
gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Darker'

# Terminal config
gsettings set org.gnome.Terminal.Legacy.Settings headerbar false

# Touchpad disabled on external mouse
gsettings set org.gnome.desktop.peripherals.touchpad send-events disabled-on-external-mouse

# Font scaling 1.5
# gsettings set org.gnome.desktop.interface text-scaling-factor 1.5
