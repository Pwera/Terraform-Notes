provider "google" {
  credentials = file("terraform-key.json")
}

### https://registry.terraform.io/modules/terraform-google-modules/network/google/latest
module "network" {
  source       = "terraform-google-modules/network/google"
  version      = "3.4.0"
  network_name = "my-vpc-network"
  project_id   = var.project

  subnets = [
    {
      subnet_name   = "subnet-01"
      subnet_ip     = var.cidr
      subnet_region = var.region
    },
    {
      subnet_name           = "subnet-02"
      subnet_ip             = "10.1.0.0/16"
      subnet_region         = var.region
      google_private_access = "true"
    },
  ]

  secondary_ranges = {
    subnet-01 = []
  }
}

### https://registry.terraform.io/modules/terraform-google-modules/network/google/latest/submodules/fabric-net-firewall
module "network_fabric-net-firewall" {
  source                  = "terraform-google-modules/network/google//modules/fabric-net-firewall"
  version                 = "3.4.0"
  project_id              = var.project
  network                 = module.network.network_name
  internal_ranges_enabled = true
  internal_ranges         = [var.cidr]

}