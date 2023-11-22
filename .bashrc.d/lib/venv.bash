#!/usr/bin/bash
alias vs='venv_set'
alias va='venv_activate'
alias vd='venv_deactivate'

venv_folder_name=".venv"

# Create file if it doesn't exist
touch "$VAR/current_venv"

function venv_set(){
    echo "$(pwd)/$venv_folder_name/bin/activate" > $VAR/current_venv
}

function venv_activate(){
    source "$(cat $VAR/current_venv)"
}

function venv_deactivate(){
    deactivate
}

function venv_make(){
    python -m venv $venv_folder_name
    venv_set
    venv_activate
    pip install --upgrade pip wheel
}

function venv_freeze(){
    pip freeze | grep -v "pkg_resources" > requirements.txt
}
