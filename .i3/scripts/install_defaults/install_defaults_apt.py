#!/usr/bin/env python3

import apt
import os

class color:
   PURPLE = '\033[95m'
   CYAN = '\033[96m'
   DARKCYAN = '\033[36m'
   BLUE = '\033[94m'
   GREEN = '\033[92m'
   YELLOW = '\033[93m'
   RED = '\033[91m'
   BOLD = '\033[1m'
   UNDERLINE = '\033[4m'
   END = '\033[0m'

print(color.BOLD + "Installing deb packages \n-----------------------" + color.END)
apt_pkgs = [    "i3", 
                "xdotool", 
                "zenity",
                "feh",
                "network-manager",
                "volumeicon-alsa",
                "compton",
                "dunst",
                "x11-xserver-utils",
                "python-pip",
                "python3-pip",
                "blueman",
                "git",
                "ranger",
                "ruby",
                "tmux",
                "tmuxinator",
                "neovim",
                "curl",
                "conky-all",
                "fonts-font-awesome",
                "fonts-materialdesignicons-webfont"
            ]
# Vimplug, py3status (pip3), icons-in-terminal, polybar, atom
# Check if the user is root
if os.geteuid() != 0:
    exit( color.BOLD + color.RED +"You need to have root privileges" +color.END )

cache = apt.cache.Cache()
cache.update()
for pkg_name in apt_pkgs:
    pkg = cache[pkg_name]
    if pkg.is_installed:
        print('{:<40}'.format(pkg_name) + color.CYAN +'Already installed' + color.END )
    else:
        pkg.mark_install()
        print('{:<40}'.format(pkg_name) + color.GREEN +'Installed Successfully' + color.END )
        try:
            cache.commit()
        except Exception:
            print('Installation of {} failed '.format(pkg_name))
print('\n')