#!/usr/bin/bash

# Source all active configs
for file in $HOME/.bashrc.d/*.bash
do
    source $file
done

# Navigating to configs
alias bashconf="${EDITOR} ~/.bash_aliases"
alias bashcd="cd ~/.bashrc.d"
alias bashsource='source ~/.bashrc'

# Command modifications
alias ls='ls -1q --classify --group-directories-first --color=auto'
alias la='ls -A'
alias ld='ls -d */'
alias lda='ls -d */ .*/'
alias lf='find . -maxdepth 1 -type f'

# Key bindings
bind '"\C-g":"git status .\C-m"'
bind '"\C-o":"ranger_cd\C-m"'
bind '"\C-u":"poetry shell\C-m"'

keypro us

#Custom terminal prompt
PS1=$(custom_terminal_prompt)


