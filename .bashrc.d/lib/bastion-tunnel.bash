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
