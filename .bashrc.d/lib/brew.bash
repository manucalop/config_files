# Bash completions
export BREW_HOME=$(brew --prefix)

for file in $BREW_HOME/etc/bash_completion.d/*
do
    source $file
done
