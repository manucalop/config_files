#! /bin/bash
./install_defaults_apt.bash
./install_defaults_pip.bash
./install_defaults_npm.bash

# Destktop config
gsettings set org.gnome.gnome-flashback desktop false
gsettings set org.gnome.gnome-flashback root-background true
gsettings set org.gnome.settings-daemon.plugins.keyboard active false

# Theme config
gsettings set org.gnome.desktop.interface cursor-theme 'Breeze_Snow'
gsettings set org.gnome.desktop.interface icon-theme 'breeze'
gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Darker'

# Terminal config
gsettings set org.gnome.Terminal.Legacy.Settings headerbar false
./one-dark.sh
