#! /bin/bash

# Install apt packages
xargs -d '\n' -- sudo apt install -y < ./packages/apt_pkgs.txt
# Install pip packages
xargs -d '\n' -- pip install -y < ./packages/pip_pkgs.txt
# Install npm packages
xargs -d '\n' -- sudo npm install -g < ./packages/npm_pkgs.txt

./install_i3-gnome.bash

./settings.bash

./one-dark-gnome-terminal.sh
