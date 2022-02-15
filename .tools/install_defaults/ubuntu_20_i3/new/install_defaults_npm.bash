#!/usr/bin/env bash
xargs -d '\n' -- sudo npm install -g < ./packages/npm_pkgs.txt
