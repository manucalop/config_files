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

function get_exclude_pattern(){
  ignore_file="$HOME/.config/gsync/ignore_patterns"
  exclude_pattern=""
  if [[ -f "$ignore_file" ]]; then
    while IFS= read -r line || [[ -n "$line" ]]; do
      # Convert line to a Python regular expression to match at any location
      regex_pattern="(^|.*\/)$line(\/.*|$)"
      exclude_pattern="${exclude_pattern}${regex_pattern}|"
    done < "$ignore_file"
    # Remove the trailing pipe from the exclude_pattern string
    exclude_pattern=${exclude_pattern%?}
  fi
  echo $exclude_pattern
}

function gcs_sync() {
  source_dir=$(pwd)

  # Get source path relative to home directory
  dest_dir=${source_dir/$HOME\//}
  dest_url="gs://$GCS_BUCKET/$dest_dir"

  # Check if .syncignore file exists and read patterns
  ignore_file="$HOME/.config/gsync/ignore_patterns"
  exclude_pattern=$(get_exclude_pattern)
  echo "Syncing $source_dir to $dest_url with exclusions: $exclude_pattern "
  # Perform dry run sync with exclusions
  gsutil -m rsync -r -e -d -n -x "$exclude_pattern" $source_dir $dest_url
  if confirmation; then
    # Perform actual sync with exclusions
    gsutil -m rsync -r -e -d -x "$exclude_pattern" $source_dir $dest_url
  fi
}

function gcs_push() {
  # Source dir is the current directory, relative to home
  source_dir=$(pwd)

  # Get source path relative to home directory
  dest_dir=${source_dir/$HOME\//}
  dest_url="gs://$GCS_BUCKET/$dest_dir"
  exclude_pattern=$(get_exclude_pattern)

  echo "Pushing new files from $source_dir to $dest_url"
  gsutil -m rsync -r -e -n -x "$exclude_pattern" $source_dir $dest_url
  if confirmation; then
    gsutil -m rsync -r -e -x "$exclude_pattern" $source_dir $dest_url
  fi
}

function gcs_pull() {
  source_dir=$(pwd)

  # Get source path relative to home directory
  dest_dir=${source_dir/$HOME\//}
  dest_url="gs://$GCS_BUCKET/$dest_dir"
  exclude_pattern=$(get_exclude_pattern)

  echo "Pulling new files from $dest_url to $source_dir"
  gsutil -m rsync -r -e -d -n -x "$exclude_pattern" $dest_url $source_dir
  if confirmation; then
    gsutil -m rsync -r -e -d -x "$exclude_pattern" $dest_url $source_dir
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

