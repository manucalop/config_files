#!/usr/bin/bash

export EDITOR='lvim'
export MAIN_WS="${HOME}/main_ws"

for file in $HOME/.bashrc.d/*.bash
do
    source $file
done

source $HOME/.bashrc.d/configs/debian.bash
