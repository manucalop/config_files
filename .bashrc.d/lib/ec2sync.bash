#!/bin/bash

function ec2sync() {
    target=$1
    foldername=$(basename "$PWD")
    echo "Syncing $foldername to EC2";
    cd ..;
    # Exclude $foldername/env folder recursively
    rsync -azP --exclude .venv/ $foldername/ $target:~/$foldername;
    cd $foldername;
}

function ec2syncloop() {
    target=$1
    while true; do
        ec2sync $target
        sleep 5
    done
}
