#!/bin/bash

function gitclean() {
    git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
    git remote prune origin
    git gc
}
