if [ -n "$BASH_VERSION" ]; then
    # Set up fzf key bindings and fuzzy completion
    eval "$(fzf --bash)"
fi

# If shell is zsh, then source fzf.zsh
if [ -n "$ZSH_VERSION" ]; then
    eval "$(fzf --zsh)"
fi

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --strip-cwd-prefix --exclude .git"

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}



_fzf_compgen_path() {
    fd --hidden --follow --exclude .git . "$1"
}

_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude .git . "$1"
}

function ff() {
    local file
    file=$(fzf --height 40% --reverse --preview 'bat -n --color=always --line-range :500 {}')
    cd "$(dirname "$file")" || return
    # vim "$file" || return
}
function fdir() {
    local dir
    dir=$(fd --type d | fzf --height 40% --reverse)
    cd "$dir" || return
}
