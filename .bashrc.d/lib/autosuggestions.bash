file="$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

if [ -f $file ]; then
    source $file
fi
