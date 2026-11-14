#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function install_stow {
    if command -v stow &>/dev/null; then
        return
    fi
    echo "Installing stow..."
    if [[ "$OSTYPE" == darwin* ]]; then
        brew install stow
    else
        sudo apt install -y stow
    fi
}

function link_dotfiles {
    echo "Linking dotfiles..."
    cd "$DOTFILES_DIR"
    stow -t "$HOME" home
}

function install_packages {
    if [[ "$OSTYPE" == darwin* ]]; then
        echo "Installing brew packages..."
        brew bundle --file="$DOTFILES_DIR/Brewfile"
    else
        echo "Installing apt packages..."
        xargs -d '\n' -- sudo apt install -y < "$DOTFILES_DIR/.packages/apt_pkgs.txt"
        for file in "$DOTFILES_DIR/.packages/scripts/"*.bash; do
            [[ -e "$file" ]] && bash "$file"
        done
    fi
}

function setup {
    install_stow
    link_dotfiles
    install_packages
}

setup
