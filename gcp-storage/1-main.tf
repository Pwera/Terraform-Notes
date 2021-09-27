provider "google" {
  version = "3.82.0"

  credentials = file("../terraform-key.json")

  project = "folkloric-vault-324921"
  region  = "europe-central2"
  zone    = "europe-central2-a"
}


module "terraform-gcp-gcs" {
  source        = "./module"
  gcp_stg_name  = var.gcp_stg_name
  gcp_location  = var.gcp_location
  force_destroy = var.force_destroy
  storage_class = var.storage_class
  project       = var.project
  labels        = var.labels
}