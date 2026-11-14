file="$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

if [ -f $file ]; then
    source $file
fi
