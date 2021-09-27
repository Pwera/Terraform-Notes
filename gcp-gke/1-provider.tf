### https://registry.terraform.io/providers/hashicorp/google/latest

provider "google" {
  region = "us-west2"
}

### https://registry.terraform.io/providers/hashicorp/random/latest
resource "random_integer" "int" {
  min = 100
  max = 1000000
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.66"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
}