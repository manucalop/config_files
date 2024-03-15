#!/bin/bash

function rr_text(){
  path="$1"
  find_string="$2"
  replace_string="$3"
  if [ -z "$3" ]
  then
    echo "Need three arguments: use find_replace path find_string replace_string"
  else
    export LC_CTYPE=C 
    export LANG=C
    cd $path
    find . -type f -name "*.*" -exec sed -i -e "s/$find_string/$replace_string/g" '{}' \;
    wait
    cd - > /dev/null
  fi
}

function rr_files(){
  path="$1"
  find_string="$2"
  replace_string="$3"
  if [ -z "$3" ]
  then
    echo "Need three arguments: use rr_files path find_string replace_string"
  else
    cd $path
    # Rename files
    for file in $(find . -type f -name "*$find_string*")
    do
      mv $file $(echo $file | sed "s/$find_string/$replace_string/g")
    done
    cd - > /dev/null
  fi
}

function rr_dirs(){
  path="$1"
  find_string="$2"
  replace_string="$3"
  if [ -z "$3" ]
  then
    echo "Need three arguments: use rr_dirs path find_string replace_string"
  else
    cd $path
    #Rename the directories
    for dir in $(find . -type d -name "*$find_string*")
    do
      new_dir=$(echo $dir | sed "s/$find_string/$replace_string/g")
      mv $dir $new_dir
    done
    cd - > /dev/null
  fi
}

function rr_all(){
  path="$1"
  find_string="$2"
  replace_string="$3"
  if [ -z "$3" ]
  then
    echo "Need three arguments: use find_replace path find_string replace_string"
  else
    echo "Replacing $find_string with $replace_string in $path"
    rr_text $path $find_string $replace_string
    echo "Renaming directories..."
    rr_dirs $path $find_string $replace_string
    echo "Renaming files..."
    rr_files $path $find_string $replace_string
  fi
}
