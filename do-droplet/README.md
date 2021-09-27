``` bash
export DO_PAT=<PERSONAL_ACCESS_TOKEN>
terraform plan   -var "do_token=${DO_PAT}"   -var "pvt_key=$HOME/.ssh/id_rsa"
terraform apply   -var "do_token=${DO_PAT}"   -var "pvt_key=$HOME/.ssh/id_rsa"
terraform destroy   -var "do_token=${DO_PAT}"   -var "pvt_key=$HOME/.ssh/id_rsa"
```