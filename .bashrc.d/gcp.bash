#!/usr/bin/bash
export GOOGLE_APPLICATION_CREDENTIALS="${HOME}/.config/gcloud/application_default_credentials.json"

function slu_airbyte() {
    gcloud compute ssh \
        --zone "europe-southwest1-a" "airbyte"\
        --project "prj-gcp-sls-sl01-poc01-lsc01"
}
function slu_airbyte_browser() {
    gcloud compute ssh \
        --zone "europe-southwest1-a" "airbyte"\
        --project "prj-gcp-sls-sl01-poc01-lsc01"\
        -- -L 8000:localhost:8000 -N -f
}

