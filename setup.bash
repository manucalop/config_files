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

install_stow
link_dotfiles
