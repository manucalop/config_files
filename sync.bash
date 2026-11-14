#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function install_homebrew {
    if command -v brew &>/dev/null; then
        return
    fi
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

function install_stow {
    if command -v stow &>/dev/null; then
        return
    fi
    echo "Installing stow..."
    brew install stow
}

function link_dotfiles {
    echo "Linking dotfiles..."
    cd "$DOTFILES_DIR"
    stow --restow -t "$HOME" home
}

function install_packages {
    echo "Installing packages..."
    brew bundle --file="$DOTFILES_DIR/Brewfile"
}

install_homebrew
install_stow
link_dotfiles
install_packages
