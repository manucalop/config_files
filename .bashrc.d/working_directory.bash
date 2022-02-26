#!/usr/bin/bash
alias wd='wd_go'
alias swd='wd_set'

function wd_init(){
    # Create file if it doesn't exist
    [ -e "$VAR/current_working_directory" ] || touch "$VAR/current_working_directory"
}

function wd_set(){
    setup_working_directory
    pwd > "$VAR/current_working_directory"
}

function wd_go(){
    setup_working_directory
    cd "$(cat $VAR/current_working_directory)"  || exit
}
