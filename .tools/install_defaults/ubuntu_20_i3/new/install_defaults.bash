#! /bin/bash
./install_defaults_apt.bash
./install_defaults_pip.bash
./install_defaults_npm.bash

# Set up some configs
gsettings set org.gnome.gnome-flashback desktop false
gsettings set org.gnome.gnome-flashback root-background true
gsettings set org.gnome.settings-daemon.plugins.keyboard active false

# Terminal
gsettings set org.gnome.Terminal.Legacy.Settings headerbar false

./one-dark.sh
