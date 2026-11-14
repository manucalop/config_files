#!/bin/bash

function gitclean() {
    # Remove local branches that have been merged or deleted on remote
    git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
    git remote prune origin
    git gc
}
