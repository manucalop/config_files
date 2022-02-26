#!/usr/bin/env bash
xargs -d '\n' -- pip install -y < ./packages/pip_pkgs.txt
