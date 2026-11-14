#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Linking dotfiles..."
cd "$DOTFILES_DIR"
stow --restow -t "$HOME" home
