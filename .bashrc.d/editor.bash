#!/usr/bin/bash
export EDITOR='lvim'

alias vim='lvim'
alias vimcd='cd ~/.config/lvim'
alias vimconf='vim ~/.config/lvim/config.lua'
# alias vimconf='vim ~/.config/nvim/init.vim'

vi_mode(){
  TEST=`bind -v | awk '/keymap/ {print $NF}'`
  if [ "$TEST" = 'vi-insert' ]; then
     echo -ne "\033]12;Green\007"
  else
     echo -ne "\033]12;Red\007"
  fi
}
