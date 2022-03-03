#!/usr/bin/bash

export EDITOR='lvim'
export VAR="$HOME/.local/var"

# Source all active configs
for file in $HOME/.bashrc.d/*.bash
do
    source $file
done

