# If shell is bash, then source fzf.bash
if [ -n "$BASH_VERSION" ]; then
  source ~/.fzf.bash
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
