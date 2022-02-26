#!/usr/bin/bash

function toolscd(){
    cd $TOOLS || exit
}

function wdset(){
    pwd > ${TOOLS}/tmp/current_working_directory.txt
}

function wdcd(){
    cd "$(cat $TOOLS/tmp/current_working_directory.txt)" || exit
}

function workcd(){
    cd $MAIN_WS/projects || exit
}

function findcd(){
  OUT=$(find -name "$1" -printf '%h\n' -quit)
 # if [ $(echo $OUT | wc -l) -gt 1 ]; then
 #   echo "Not the only one"
 #   echo $OUT
 #   return
 # fi
  cd "$OUT" || exit
}
