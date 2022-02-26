#!/usr/bin/bash

# Navigating to configs
alias bashconf="vim ~/.bash_aliases"
alias bashcd="cd ${HOME}/.bashrc.d"
alias bashsource='source ~/.bashrc'

# Command modifications
alias ls='ls -1q --classify --group-directories-first --color=auto'
alias la='ls -A'
alias ld='ls -d */'
alias lda='ls -d */ .*/'
alias lf='find . -maxdepth 1 -type f'

#Custom terminal prompt
PS1=$(custom_terminal_prompt)
