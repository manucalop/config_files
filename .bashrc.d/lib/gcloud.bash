#!/usr/bin/bash
path_file="$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
completion_file="$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

if [ -f "$path_file" ]; then
    source "$path_file"
fi
if [ -f "$completion_file" ]; then
    source "$completion_file"
fi

function sql-bastion-tunnel() {
    PROJECT_ID=prj-alto-p-genai-bau-96754
    ZONE=europe-west1-b
    PORT=5432
    MACHINE="bastion-host"
    gcloud compute ssh ${MACHINE} \
        --project ${PROJECT_ID} \
        --zone ${ZONE} \
        --tunnel-through-iap \
        -- -NL ${PORT}:localhost:${PORT}
}
