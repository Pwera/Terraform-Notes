### https://registry.terraform.io/providers/digitalocean/digitalocean/latest

# export TF_LOG=1
# export DO_PAT="your_personal_access_token"
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}