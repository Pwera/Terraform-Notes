provider "google" {
  version = "3.82.0"

  credentials = file("../terraform-key.json")

  project = "folkloric-vault-324921"
  region  = "europe-central2"
  zone    = "europe-central2-a"
}

### https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

terraform {
  backend "gcs" {
    bucket      = "buket_t1"
    prefix      = "terrafform1"
    credentials = "../terraform-key.json"
  }
}