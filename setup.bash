#!/bin/bash
# Setup config files
#
function setup_config_files {
    echo "Setting up config files..."
    git clone git@github.com:manucalop/config_files.git
    cp -r config_files/. ~/
    rm -rf config_files
    cp -r config/* ~/.config/
}

function install_packages {
    echo "Installing packages..."
    xargs -d '\n' -- sudo apt install -y < ./.packages/apt_pkgs.txt
    for file in ./packages/scripts/*.bash; do
        ./$file
    done
    # xargs -d '\n' -- pip install < ./packages/pip_pkgs.txt
    # xargs -d '\n' -- sudo npm install -g < ./packages/npm_pkgs.txt
}
