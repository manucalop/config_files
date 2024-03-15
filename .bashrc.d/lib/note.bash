#!/bin/bash

alias note=open_notes

function open_notes() {
    cd ~/.notes
    lvim home.md
    cd -
}
