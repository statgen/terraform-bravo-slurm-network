output "filestore_ip" {
  value = google_filestore_instance.shared_storage.networks.0.ip_addresses.0
}

output "network_name" {
  value = google_compute_network.cluster_network.name
}
