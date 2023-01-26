# Copyright 2022 University of Michigan
# Modified for use with BRAVO.
#
# Copyright 2021 SchedMD LLC
# Modified for use with the Slurm Resource Manager.
#
# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

resource "google_compute_network" "cluster_network" {
  name                    = "bravo-slurm-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "cluster_subnet" {
  name                     = "bravo-slurm-subnet"
  network                  = google_compute_network.cluster_network.self_link
  region                   = local.region
  ip_cidr_range            = "10.1.0.0/16"
  private_ip_google_access = true
}

resource "google_compute_firewall" "cluster_ssh_firewall" {
  count         = (var.use_iap ? 0 : 1)
  name          = "bravo-slurm-allow-ssh"
  network       = google_compute_network.cluster_network.name
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "cluster_iap_ssh_firewall" {
  count         = (var.use_iap ? 1 : 0)
  name          = "bravo-slurm-allow-iap"
  network       = google_compute_network.cluster_network.name
  source_ranges = ["35.235.240.0/20"]

  allow {
    protocol = "tcp"
    ports    = ["22", "6842", "8642"]
  }
}

resource "google_compute_firewall" "cluster_internal_firewall" {
  name = "bravo-slurm-allow-internal"
  network       = google_compute_network.cluster_network.name
  source_ranges = ["10.0.0.0/8"]

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
}
