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

function install_omz {
    if [[ -d "$HOME/.oh-my-zsh" ]]; then
        return
    fi
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
}

function link_dotfiles {
    echo "Linking dotfiles..."
    cd "$DOTFILES_DIR"
    stow --restow -t "$HOME" home
}

function trust_taps {
    echo "Trusting third-party taps..."
    brew trust oven-sh/bun 2>/dev/null || true
    brew trust tursodatabase/tap 2>/dev/null || true
    brew trust nikitabobko/tap 2>/dev/null || true
}

function install_packages {
    echo "Installing packages..."
    brew bundle --file="$DOTFILES_DIR/Brewfile"
}

install_homebrew
install_stow
install_omz
link_dotfiles
trust_taps
install_packages
