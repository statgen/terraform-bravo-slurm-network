provider "google" {
  project = "genome-variant-server"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_filestore_instance" "shared_storage" {
  name = "slrum-shared-storage"
  zone = "us-central1-c"
  tier = "BASIC_SSD"

  file_shares {
    capacity_gb = 1024
    name        = "slurm-share"
  }

  networks {
    network = "cluster_network"
    modes   = ["MODE_IPV4"]
  }
}
