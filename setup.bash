#!/bin/bash
# Setup config files
#
function setup_config_files {
    echo "Setting up config files..."
    git clone https://github.com/manucalop/config_files.git
    cp -r config_files/. ~/
    rm -rf config_files
    rm -rf packages
    rm README.md
    rm setup.bash
}

function install_packages {
    echo "Installing packages..."
    xargs -d '\n' -- sudo apt install -y < .packages/apt_pkgs.txt
    for file in .packages/scripts/*.bash; do
        ./$file
    done
}

function install_core_packages {
    local core_path="./.packages/core"
    echo "Installing apt packages..."
    xargs -d '\n' -- sudo apt install -y < $core_path/apt_pkgs.txt
    echo "Installing pip packages..."
    xargs -d '\n' -- pip install < $core_path/pip_pkgs.txt
    echo "Installing npm packages..."
    xargs -d '\n' -- sudo npm install -g < $core_path/npm_pkgs.txt
    echo "Installing snap packages..."
    xargs -d '\n' -- sudo snap install < $core_path/snap_pkgs.txt
    echo "Installing scripts..."
    for file in $core_path/scripts/*.bash; do
        ./$file
    done
}

function setup_all {
    sudo apt update
    setup_config_files
    install_packages
}
setup_all
