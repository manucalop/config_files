#!/usr/bin/bash
alias va='venv_activate'
alias vd='venv_deactivate'

function venv_init(){
    # Create file if it doesn't exist
    [ -e "$VAR/current_venv" ] || touch "$VAR/current_venv"
}

function venv_set(){
    echo "$(pwd)/venv/bin/activate" > $VAR/current_venv
}

function venv_activate(){
    source "$(cat $VAR/current_venv)"
}

function venv_deactivate(){
    deactivate
}

function venv_make(){
    python3 -m venv ./venv
}
