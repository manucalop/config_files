#!/usr/bin/bash
GITHUB_USER="manucalop"
GITHUB_ORG="altostratus-solutions"


function ghub() {
    function list-repos() {
        if [[ -n "$GITHUB_ORG" ]]; then
          gh api orgs/"$GITHUB_ORG"/repos --jq '.[].ssh_url' --paginate
          return
        fi
        gh api user/repos --jq '.[].ssh_url' --paginate
    }

    if [[ $1 == "reset" ]]; then
      export GITHUB_USER="manucalop"
      unset GITHUB_ORG

    elif [[ $1 == "clone" ]]; then
      local repo
      repo=$(list-repos | fzf --height 40% --reverse --border --ansi)
      if [[ -n "$repo" ]]; then
        echo "$repo" | xargs -I{} git clone {}
      fi
    fi
}
