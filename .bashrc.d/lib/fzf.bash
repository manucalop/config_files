if [ -n "$BASH_VERSION" ]; then
    # Set up fzf key bindings and fuzzy completion
    eval "$(fzf --bash)"
fi

# If shell is zsh, then source fzf.zsh
if [ -n "$ZSH_VERSION" ]; then
    eval "$(fzf --zsh)"
fi

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
