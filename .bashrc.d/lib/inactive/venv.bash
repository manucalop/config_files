#!/usr/bin/bash
alias va='source .venv/bin/activate'
alias vd='deactivate'
alias vm='python -m venv .venv'

## DEPRECATED ##

alias vs='venv_set'

venv_folder_name=".venv"

# Create file if it doesn't exist
touch "$VAR/current_venv"

venv_set() {
    echo "$(pwd)/$venv_folder_name/bin/activate" >$VAR/current_venv
}

venv_activate() {
    source "$(cat $VAR/current_venv)"
}

venv_deactivate() {
    deactivate
}

venv_make() {
    python -m venv $venv_folder_name
    venv_set
    venv_activate
    pip install --upgrade pip wheel
}

venv_freeze() {
    pip freeze | grep -v "pkg_resources" >requirements.txt
}

## DEPRECATED ##
