# alias va='source .venv/bin/activate'
# alias vd='deactivate'
# alias vm='python -m venv .venv'

alias vs='venv_set'
alias va='venv_activate'
alias vd='deactivate'

touch "$VAR/current_venv"

venv_set() {
    echo "$(pwd)/.venv/bin/activate" >$VAR/current_venv
}

venv_activate() {
    source "$(cat $VAR/current_venv)"
}
