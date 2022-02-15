#!/usr/bin/env bash
xargs -d '\n' -- sudo apt install -y < ./packages/apt_pkgs.txt
