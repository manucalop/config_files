eval "$(/opt/homebrew/bin/brew shellenv)"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.bashrc.d/bin" ] ; then
    PATH="$HOME/.bashrc.d/bin:$PATH"
fi

if [ -d "$HOME/.poetry/bin" ] ; then
    PATH="$HOME/.poetry/bin:$PATH"
fi
if [ -d "$HOME/.cargo" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
    . "$HOME/.cargo/env"
fi

# if [ -d "$(brew --prefix coreutils)/libexec/gnubin" ] ; then
#     # alias sed="gsed"
#     # alias find="gfind"
#     PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
# fi
