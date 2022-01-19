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

# Debian packages{{{
print('\n')
print(color.BOLD + "Installing deb packages \n-----------------------" + color.END)
apt_pkgs = [  
                "git",
                "tmux",
                "neovim",
                "python3-pip",
                "ranger",
                "curl",
                "xcape",
                "rename",
                "fonts-font-awesome",
                "fonts-materialdesignicons-webfont",
                "breeze-icon-theme",
                "arc-theme",
                "i3",
                "rofi",
                "feh",
                "compton",
                "conky-all",
                "gnome-flashback",
                # "volumeicon-alsa",
#                "okular",
#                "texlive-full",
#                "inkscape",
            ]
# }}}

# Snap packages {{{
snap_pkgs = [ "spotify" ]
# }}}

# Additional ppas {{{
apt_repos = [ 
        # "neovim-ppa/stable" 
        ] 
# }}}

# TODO Vimplug, py3status (pip3), icons-in-terminal, 

# Check if the user is root{{{
if os.geteuid() != 0:
    exit( color.BOLD + color.RED +"You need to have root privileges" +color.END )
# }}}

# Add ppa repositories{{{
print(color.YELLOW +'Adding ppa repositories... ' + color.END )
for repo in apt_repos:
    if os.system('grep -q "^deb .*{}" /etc/apt/sources.list /etc/apt/sources.list.d/*'.format(repo)):
    	os.system('sudo apt-add-repository ppa:{}'.format(repo))
    else:
        print('{:<40}'.format(repo) + color.CYAN +'Already added' + color.END )

os.system('sudo apt -q=2 update')
print('\n')
# }}}

# Install deb packages{{{

print(color.YELLOW +'Installing apt packages... ' + color.END )
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
# }}}

# Install snap packages TODO{{{
# for pkg_name in snap_pkgs:
#     pkg = cache[pkg_name]
#     if pkg.is_installed:
#         print('{:<40}'.format(pkg_name) + color.CYAN +'Already installed' + color.END )
#     else:
#         print(color.GREEN +'Installing {}... '.format(pkg_name) + color.END )
#         os.system('snap install {}'.format(pkg_name))
#         print('{:<40}'.format(pkg_name) + color.GREEN +'Installed Successfully' + color.END )

print('\n')
# }}}

# Manually: {{{
# icons-in-terminal
# git clone https://github.com/sebastiencs/icons-in-terminal.git
# cd icons-in-terminal
# ./install.sh

#}}}
