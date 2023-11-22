#!/bin/bash

GCSFUSE_PATH=$HOME/gcs/manucalop
GCS_BUCKET=manucalop

function confirmation() {
  local response
  printf "%s" "${1:-Do you want to continue? [y/N]} "
  read -r response
  # read -r -p "${1:-Do you want to continue? [y/N]} " response
  case "$response" in
    [yY][eE][sS]|[yY])
      true
      ;;
    *)
      false
      ;;
  esac
}

function gcs_push() {
  # Source dir is the current directory, relative to home
  source_dir=$(pwd)

  # Get source path relative to home directory
  dest_dir=${source_dir/$HOME\//}
  dest_url="gs://$GCS_BUCKET/$dest_dir"

  echo "Pushing new files from $source_dir to $dest_url"
  gsutil -m rsync -r -e -n $source_dir $dest_url
  if confirmation; then
    gsutil -m rsync -r -e $source_dir $dest_url
  fi
}

function gcs_remote_sync() {
  source_dir=$(pwd)

  # Get source path relative to home directory
  dest_dir=${source_dir/$HOME\//}
  dest_url="gs://$GCS_BUCKET/$dest_dir"

  echo "Syncing $source_dir to $dest_url"
  gsutil -m rsync -r -e -d -n $source_dir $dest_url
  if confirmation; then
    gsutil -m rsync -r -e -d $source_dir $dest_url
  fi
}

function gcs_pull() {
  source_dir=$(pwd)

  # Get source path relative to home directory
  dest_dir=${source_dir/$HOME\//}
  dest_url="gs://$GCS_BUCKET/$dest_dir"

  echo "Pulling new files from $dest_url to $source_dir"
  gsutil -m rsync -r -e -d -n $dest_url $source_dir
  if confirmation; then
    gsutil -m rsync -r -e -d $dest_url $source_dir
  fi
}

function gcs_unmount() {
  fusermount -u $GCSFUSE_PATH
}

function gcs_cd() {
  cd $GCSFUSE_PATH
}

function gcs_mount() {
  mkdir -p $GCSFUSE_PATH
  gcs_unmount
  gcsfuse --implicit-dirs $GCS_BUCKET $GCSFUSE_PATH
  gcs_cd
}

function gcs_fuse_pull(){
  # Pull current GCS directory to $HOME
  source_dir=$(pwd)
  # Get source path relative to GCSFUSE_PATH
  source_dir=${source_dir/$GCSFUSE_PATH\/}
  dest_url="gs://$GCS_BUCKET/$source_dir"
  source_dir=$HOME/$source_dir

  echo "Pulling new files from $dest_url to $source_dir"
  mkdir -p $source_dir
  cd $source_dir
  gcs_pull
}
