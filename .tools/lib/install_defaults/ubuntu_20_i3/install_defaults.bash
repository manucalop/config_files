#! /bin/bash
sudo python3 install_defaults_apt.py 
# python3 install_defaults_pip.py

# Set up some configs
gsettings set org.gnome.gnome-flashback desktop false
gsettings set org.gnome.gnome-flashback root-background true
gsettings set org.gnome.settings-daemon.plugins.keyboard active false

# Terminal
gsettings set org.gnome.Terminal.Legacy.Settings headerbar false

./one-dark.sh
