export VAULT_ADDR=https://vault.leboncoin.ci
export VAULT_USERNAME=manuel.castillolopez

function vault-login() {
    vault login -address=$VAULT_ADDR -method=ldap username=$VAULT_USERNAME
    export VAULT_TOKEN=$(cat -p ~/.vault-token)
}
