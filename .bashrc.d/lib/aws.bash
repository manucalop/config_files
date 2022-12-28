#!/bin/bash

export AWS_PROFILE=staging

function ec2sync() {
    target=$1
    foldername=$(basename "$PWD")
    root_folder=$(whoami)
    echo "Syncing $foldername to EC2";
    cd ..;
    # Create folder whoami folder on EC2
    ssh $target 'mkdir -p ~/manucalop';
    rsync -azP --exclude .venv/ $foldername/ $target:~/$root_folder/$foldername;
    cd $foldername;
}

function ec2syncloop() {
    target=$1
    while true; do
        ec2sync $target
        sleep 5
    done
}
