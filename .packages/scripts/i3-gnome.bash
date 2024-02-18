#!/usr/bin/env bash
git clone git@github.com:manucalop/i3-gnome.git
cd i3-gnome
sudo make install
cd ..
rm -rf i3-gnome
