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

print('\n')
print(color.BOLD + "Installing deb packages \n-----------------------" + color.END)
apt_pkgs = [    "sudo",
		"xorg",
                "git",
                "neovim",
                "rxvt-unicode-256color",
                "i3", 
                "xdotool", 
                "zenity",
                "feh",
                "network-manager",
                "volumeicon-alsa",
                "compton",
                "x11-xserver-utils",
                "python-pip",
                "python3-pip",
                "blueman",
                "ranger",
                "ruby",
                "tmux",
                "tmuxinator",
                "neovim",
                "curl",
                "xfce4-power-manager",
                "conky-all",
                "rofi",
                "xcape",
                "dconf-cli",
                "exuberant-ctags",
                "pulseaudio-module-bluetooth",
		"gnome-terminal",
                "fonts-font-awesome",
                "okular",
                "fonts-materialdesignicons-webfont",
                "breeze-icon-theme",
                "arc-theme",
                "texlive-full",
                "npm",
                "i3blocks",
            ]
snap_pkgs = [ "spotify" ]
apt_repos = [ "neovim-ppa/stable" ] 
# Vimplug, py3status (pip3), icons-in-terminal, polybar, atom

# Check if the user is root
if os.geteuid() != 0:
    exit( color.BOLD + color.RED +"You need to have root privileges" +color.END )

# Add ppa repositories
print(color.YELLOW +'Adding ppa repositories... ' + color.END )
for repo in apt_repos:
    if os.system('grep -q "^deb .*{}" /etc/apt/sources.list /etc/apt/sources.list.d/*'.format(repo)):
    	os.system('sudo apt-add-repository ppa:{}'.format(repo))
    else:
        print('{:<40}'.format(repo) + color.CYAN +'Already added' + color.END )

os.system('sudo apt -q=2 update')
print('\n')
print(color.YELLOW +'Installing apt packages... ' + color.END )
# Install packages
cache = apt.cache.Cache()
cache.update()
for pkg_name in apt_pkgs:
    pkg = cache[pkg_name]
    if pkg.is_installed:
        print('{:<40}'.format(pkg_name) + color.CYAN +'Already installed' + color.END )
    else:
        print(color.GREEN +'Installing {}... '.format(pkg_name) + color.END )
        os.system('apt-get --fix-missing --fix-broken -q=2 --assume-yes install {}'.format(pkg_name))
        print('{:<40}'.format(pkg_name) + color.GREEN +'Installed Successfully' + color.END )

# for pkg_name in snap_pkgs:
#     pkg = cache[pkg_name]
#     if pkg.is_installed:
#         print('{:<40}'.format(pkg_name) + color.CYAN +'Already installed' + color.END )
#     else:
#         print(color.GREEN +'Installing {}... '.format(pkg_name) + color.END )
#         os.system('snap install {}'.format(pkg_name))
#         print('{:<40}'.format(pkg_name) + color.GREEN +'Installed Successfully' + color.END )
print('\n')
