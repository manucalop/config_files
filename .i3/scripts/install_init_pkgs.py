#!/usr/bin/env python3
# aptinstall.py

import apt
import sys
import pip
import subprocess
import sh
import os
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
                "curl"
            ]

pip3_pkgs = [   "py3status"
            ]
# Vimplug, py3status (pip3), icons-in-terminal, polybar, atom
# Check if the user is root
if os.geteuid() != 0:
    exit("You need to have root privileges")

print("Installing deb packages")
cache = apt.cache.Cache()
cache.update()
for pkg_name in apt_pkgs:
    pkg = cache[pkg_name]
    if pkg.is_installed:
        print('{} already installed'.format(pkg_name))
    else:
        pkg.mark_install()
        try:
            cache.commit()
        except Exception:
            print('Installation of {} failed '.format(pkg_name))

print("Installing python packages")
#os.setuid(1)
for pkg_name in pip3_pkgs:
    pip.main(['install', pkg_name])

