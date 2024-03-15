#!/usr/bin/bash
path_file="$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
completion_file="$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

if [ -f "$path_file" ]; then
    source "$path_file"
fi
if [ -f "$completion_file" ]; then
    source "$completion_file"
fi
