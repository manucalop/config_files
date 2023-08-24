#!/bin/bash

GCS_BUCKET=manucalop

function dvc_setup() {
  # Get path relative to home directory
  dest_dir=$(pwd)
  dest_dir=${dest_dir/$HOME\//}
  dest_url="gs://$GCS_BUCKET/$dest_dir"

  echo "Initializing dvc in  $dest_url"
  dvc init
  dvc remote add gcs "$dest_url"
  dvc remote default gcs
  dvc remote modify gcs version_aware true
}

