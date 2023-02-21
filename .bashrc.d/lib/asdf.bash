#!/bin/bash
if [ -d "$HOME/.asdf/asdf.sh" ]; then
  . $HOME/.asdf/asdf.sh
fi
if [ -d "$HOME/.asdf/completions/asdf.bash" ]; then
  . $HOME/.asdf/completions/asdf.bash
fi
