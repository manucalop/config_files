#!/bin/bash
# Setup config files

git clone git@github.com:manucalop/config_files.git

# Coping all files to home directory
cp -r config_files/. ~/

rm -rf config_files
