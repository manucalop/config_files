[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_TMUX=1

function ff() {
  local file
  file=$(fzf --height 40% --reverse --preview 'bat --color=always {}')
  vim "$file" || return
}
function fdir() {
  local dir
  dir=$(fd --type d | fzf --height 40% --reverse)
  cd "$dir" || return
}
