#!/usr/bin/bash
alias wd='wd_select_go'
alias wa='wd_add'
alias wr='wd_remove'
# alias swd='wd_set'

function wd_init(){
    # Create file if it doesn't exist
    [ -e "$VAR/current_working_directory" ] || touch "$VAR/current_working_directory"
}

function wd_set(){
    wd_init
    pwd > "$VAR/current_working_directory"
}

function wd_add(){
    wd_init
    # If current directory is HOME, don't add it
    if [ "$PWD" = "$HOME" ]; then
        echo "Can't add HOME directory"
        return 1
    fi
    # If current directory is already in the list, don't add it
    if cat "$VAR/current_working_directory" | grep -q "$PWD"; then
        echo "Directory already in list"
        return 1
    fi

    pwd >> "$VAR/current_working_directory"
    wd_set_first "$PWD"
}

function wd_select(){
    wd_init
    local dir=$(cat "$VAR/current_working_directory" | awk -F/ '{print $NF}' | fzf --reverse)
    if [ -z "$dir" ]; then
        return 1
    fi
    local dir_path=$(cat "$VAR/current_working_directory" | grep "$dir")
    echo "$dir_path"
}

function wd_remove(){
    wd_init
    local dir
    dir=$(wd_select)
    if [ -z "$dir" ]; then
        echo "Directory not found"
        return 1
    fi
    grep -v "$dir" "$VAR/current_working_directory" > "$VAR/current_working_directory.tmp"
    mv "$VAR/current_working_directory.tmp" "$VAR/current_working_directory"
} 

function wd_set_first(){
    local full_path=$1
    # Pipe all but first to temp file
    cat "$VAR/current_working_directory" | grep -v "$full_path" > "$VAR/current_working_directory.tmp"
    # Replace original with selected directory
    echo "$full_path" > "$VAR/current_working_directory"
    # Append the rest of the file
    cat "$VAR/current_working_directory.tmp" >> "$VAR/current_working_directory"
    # Delete temp file
    rm "$VAR/current_working_directory.tmp"
}

function wd_select_go(){
    local full_path
    full_path=$(wd_select)
    # If none is selected, return
    [ -z "$full_path" ] && return
    # Go to the directory
    wd_set_first "$full_path"
    cd "$full_path" || return
}

function wd_go(){
    wd_init
    cd "$(cat $VAR/current_working_directory)"  || exit
}
