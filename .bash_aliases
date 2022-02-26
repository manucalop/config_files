#!/usr/bin/bash
export EDITOR='lvim'

# Set up var folder
export VAR="$HOME/.local/var"
[ -d $VAR ] || mkdir -p $VAR

# Source all active configs
for file in $HOME/.bashrc.d/*.bash
do
    source $file
done

