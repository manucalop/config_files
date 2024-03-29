#!/bin/bash

function lfs_mkdir(){
  main_path="$HOME/main_ws"
  target_path="$(pwd)"
  main2target_path="$(realpath --relative-to=$main_path $target_path)"
  echo "$main_path"
  echo "$target_path"
  echo "$main2target_path"
  cd "$main_path"
  ./setup_large_files.bash "$main2target_path"
  cd "$target_path"
}
