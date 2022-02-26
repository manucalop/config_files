#!/usr/bin/bash

function venvset(){
    echo "$(pwd)/venv/bin/activate" > ${TOOLS}/tmp/current_venv.txt
}

function venva(){
    source "$(cat ${TOOLS}/tmp/current_venv.txt)"
}

function venvd(){
    deactivate
}

function venvmake(){
    python3 -m venv ./venv
}

#######################
# Deprecated
#######################

function venv_load(){
env="$1"
if [ -z "$1" ]
then
    echo "No environment selected these are available:"
    ls ~/.venvs/
else
    source ~/.venvs/$env/bin/activate
fi
}

function venv_create(){
env="$1"
if [ -z "$1" ]
then
    echo "No environment name provided"
else
    python3 -m venv ~/.venvs/$env
    source ~/.venvs/$env/bin/activate
fi
}

function venv_destroy(){
env="$1"
if [ -z "$1" ]
then
    echo "No environment name provided"
else
    rm -rf ~/.venvs/$env
fi
}
