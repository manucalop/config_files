#!/usr/bin/bash
alias wd='wd_go'
alias swd='wd_set'

function wd_init(){
    # Create file if it doesn't exist
    [ -e "$VAR/current_working_directory" ] || touch "$VAR/current_working_directory"
}

function wd_set(){
    wd_init
    pwd > "$VAR/current_working_directory"
}

function wd_go(){
    wd_init
    cd "$(cat $VAR/current_working_directory)"  || exit
}
