#!/usr/bin/bash
export GOOGLE_APPLICATION_CREDENTIALS="${HOME}/.config/gcloud/application_default_credentials.json"

function slu_airbyte() {
    gcloud compute ssh \
        --zone "europe-west1-b" "airbyte" \
        --project "prj-gcp-sls-sl01-poc01-lsc01" \
        -- -L 8000:localhost:8000 -N -f
}
