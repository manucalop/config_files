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

#######################
# Deprecated
#######################

# function venv_load(){
# env="$1"
# if [ -z "$1" ]
# then
#     echo "No environment selected these are available:"
#     ls ~/.venvs/
# else
#     source ~/.venvs/$env/bin/activate
# fi
# }

# function venv_create(){
# env="$1"
# if [ -z "$1" ]
# then
#     echo "No environment name provided"
# else
#     python3 -m venv ~/.venvs/$env
#     source ~/.venvs/$env/bin/activate
# fi
# }

# function venv_destroy(){
# env="$1"
# if [ -z "$1" ]
# then
#     echo "No environment name provided"
# else
#     rm -rf ~/.venvs/$env
# fi
# }
