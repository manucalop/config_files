# If file exist source it
if [ -n "$BASH_VERSION" ]; then
  key_bindings_file="/usr/share/doc/fzf/examples/key-bindings.bash"
  if [ -f "$key_bindings_file" ]; then
      source "$key_bindings_file"
  fi
fi

# If shell is zsh, then source fzf.zsh
if [ -n "$ZSH_VERSION" ]; then
  source ~/.fzf.zsh
fi

export FZF_TMUX=1

function ff() {
  local file
  file=$(fzf --height 40% --reverse --preview 'bat --color=always {}')
  cd "$(dirname "$file")" || return
  # vim "$file" || return
}
function fdir() {
  local dir
  dir=$(fd --type d | fzf --height 40% --reverse)
  cd "$dir" || return
}
