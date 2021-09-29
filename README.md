Terraform

Provider used:
- Digital Ocean
- GCP


<table>
<tr>
<td>Basic commands
<td>

``` bash
alias t=terraform
t init 
t fmt
t validate
t plan
t apply
```

<tr>
<td>Debug command
<td>

```bash
TF_LOG=ERROR terraform init
```

<tr>
<td>Recursive format
<td>

```bash
terraform fmt -recursive
```


<tr>
<td>Show format diff
<td>

```bash
terrafrom fmt --diff
```

<tr>
<td>Automatic provider update
<td>

```bash
~> will update 0.0.X X into latest or 0.Y Y to latest
```

<tr>
<td>auto-approve
<td>

```bash
terrafrom --auto-approve
```


<tr>
<td>Prettify terraform state
<td>

```bash
terrafrom show -json | jq
```

<tr>
<td>Show resource state list
<td>

```bash
terraform state list
```

<tr>
<td>Terraform command playgound 
<td>

```bash
terraform console
docker_container.nodered_container.name
```

<tr>
<td>Show terraform output
<td>

```bash
terraform output # if they were defined
```


<tr>
<td>Run terraform with environmental variable
<td>

```bash
export TF_VAR_some_variable=123
```


</table>
