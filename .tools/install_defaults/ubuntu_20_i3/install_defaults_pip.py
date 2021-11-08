#!/usr/bin/env python3
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

print(color.BOLD + "Installing pip packages \n-----------------------" + color.END)
os.system('pip3 install --upgrade pip')
os.system('pip3 install --upgrade pip')
pip3_pkgs = [   "py3status",
            ]
for pkg_name in pip3_pkgs:
    os.system('sudo -H pip3 install {}'.format(pkg_name))

print('\n')
