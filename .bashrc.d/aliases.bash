#!/usr/bin/bash
alias ls='ls -1q --classify --group-directories-first --color=auto'
alias la='ls -A'
alias ld='ls -d */'
alias lda='ls -d */ .*/'
alias lf='find . -maxdepth 1 -type f'
alias da='deactivate'
alias vim='lvim'
alias vimcd='cd ~/.config/lvim'
alias vimconf='vim ~/.config/lvim/config.lua'
# alias vimconf='vim ~/.config/nvim/init.vim'
alias bashconf="vim ~/.bash_aliases"
alias bashcd="cd ${HOME}/.bashrc.d"
alias bashsource='source ~/.bashrc'
alias matlab='matlab & $() && sleep 10 && exit'
alias i3conf='vim ~/.config/i3/config'
alias i3cd='cd ~/.config/i3'
bind '"\C-o":"ranger-cd\C-m"'
bind '"\C-g":"git status .\C-m"'
