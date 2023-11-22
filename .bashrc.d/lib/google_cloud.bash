#!/usr/bin/bash
current_gcloud_config=$(cat "$HOME/.config/gcloud/active_config")
export GOOGLE_APPLICATION_CREDENTIALS="${HOME}/.config/gcloud/${current_gcloud_config}_credentials.json"
export CLOUDSDK_PYTHON="/usr/bin/python3"

path_file="$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
completion_file="$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

if [ -f "$path_file" ]; then
  source "$path_file"
fi
if [ -f "$completion_file" ]; then
  source "$completion_file"
fi

function gcloud_config_set() {
  if [ -z "$1" ]; then
    echo "No config name provided"
    echo "Usage: gcloud_config_set <config_name>"
    return 1
  fi
  gcloud config configurations activate $1
  export GOOGLE_APPLICATION_CREDENTIALS="${HOME}/.config/gcloud/${1}_credentials.json"
}

function gcloud_config_select() {
  local config=$(gcloud config configurations list --format="value(name)" | fzf --reverse)
  gcloud_config_set $config
}
