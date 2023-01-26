provider "google" {
  project = "genome-variant-server"
  region  = local.region
  zone    = var.zone
}

locals {
  region = join("-", slice(split("-", var.zone), 0, 2))
} 

resource "google_filestore_instance" "shared_home" {
  name = "slurm-shared-home"
  zone = var.zone
  tier = "BASIC_SSD"

  file_shares {
    capacity_gb = var.shared_home_capacity
    name        = "slurm_home"
  }

  networks {
    network = google_compute_network.cluster_network.name
    modes   = ["MODE_IPV4"]
  }
}

resource "google_filestore_instance" "shared_app" {
  name = "slurm-shared-app"
  zone = var.zone
  tier = "BASIC_SSD"

  file_shares {
    capacity_gb = var.shared_app_capacity
    name        = "slurm_app"
  }

  networks {
    network = google_compute_network.cluster_network.name
    modes   = ["MODE_IPV4"]
  }
}
