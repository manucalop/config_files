#!/bin/bash
if [ -z "$TYPEWRITTEN_PATH_SOURCED" ]; then
  fpath=($fpath "$HOME/.zfunctions")
  export TYPEWRITTEN_PATH_SOURCED=1
fi

export TYPEWRITTEN_LEFT_PROMPT_PREFIX_FUNCTION=(date +%H:%M:%S)
# export TYPEWRITTEN_PROMPT_LAYOUT="half_pure"
TYPEWRITTEN_CURSOR="beam"

