#!/usr/bin/bash
# export EDITOR='lvim'
# export VISUAL="$EDITOR"

# alias ed="$EDITOR"
# alias vimcd='cd ~/.config/lvim'
# alias vimconf='${EDITOR} ~/.config/lvim/lua/manucalop/'

vi_mode() {
	TEST=$(bind -v | awk '/keymap/ {print $NF}')
	if [ "$TEST" = 'vi-insert' ]; then
		echo -ne "\033]12;Green\007"
	else
		echo -ne "\033]12;Red\007"
	fi
}

set_editor() {
	# if [ -x "$(command -v lvim)" ]; then
	# 	export EDITOR='lvim'
	# 	export VISUAL="$EDITOR"
	# 	alias vimcd='cd ~/.config/lvim'
	# 	alias vimconf='${EDITOR} ~/.config/lvim/lua/manucalop/'
	if [ -x "$(command -v nvim)" ]; then
		# if [ -x "$(command -v nvim)" ]; then
		export EDITOR='nvim'
		export VISUAL="$EDITOR"
		alias vimcd='cd ~/.config/nvim'
		alias vimconf='${EDITOR} ~/.config/nvim/init.lua'
	elif [ -x "$(command -v vim)" ]; then
		export EDITOR='vim'
		export VISUAL="$EDITOR"
		alias vimcd='cd ~/.vim'
	elif [ -x "$(command -v vi)" ]; then
		export EDITOR='vi'
		export VISUAL="$EDITOR"
		alias vimcd='cd ~/.vim'
	fi

	alias vim="$EDITOR"
}

set_editor
