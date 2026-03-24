alias -g VARS='-var-file="vars/env/$(terraform workspace show).tfvars" -var-file="vars/aws-account/data$(terraform workspace show).tfvars"'
