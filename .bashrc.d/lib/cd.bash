alias cd="z"

if [ -n "$BASH_VERSION" ]; then
    eval "$(zoxide init bash)"
fi

if [ -n "$ZSH_VERSION" ]; then
    eval "$(zoxide init zsh)"
fi
