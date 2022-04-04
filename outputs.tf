output "filestore_ip" {
  value = google_filestore_instance.shared_storage.networks.0.ip_addresses.0
}

output "filestore_share" {
  value = google_filestore_instance.shared_storage.file_shares[0].name
}

output "network_name" {
  value = google_compute_network.cluster_network.name
}

output "subnet_name" {
  value = google_compute_subnetwork.cluster_subnet.name
}
