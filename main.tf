provider "google" {
  project = "genome-variant-server"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_filestore_instance" "shared_home" {
  name = "slurm-shared-home"
  zone = "us-central1-c"
  tier = "BASIC_SSD"

  file_shares {
    capacity_gb = 2560
    name        = "slurm_home"
  }

  networks {
    network = google_compute_network.cluster_network.name
    modes   = ["MODE_IPV4"]
  }
}

resource "google_filestore_instance" "shared_app" {
  name = "slurm-shared-app"
  zone = "us-central1-c"
  tier = "BASIC_SSD"

  file_shares {
    capacity_gb = 2560
    name        = "slurm_app"
  }

  networks {
    network = google_compute_network.cluster_network.name
    modes   = ["MODE_IPV4"]
  }
}
