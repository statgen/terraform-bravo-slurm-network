output "filestore_ip_home" {
  value = google_filestore_instance.shared_home.networks.0.ip_addresses.0
  sensitive = false
}

output "filestore_name_home" {
  value = google_filestore_instance.shared_home.file_shares[0].name
  sensitive = false
}

output "filestore_ip_app" {
  value = google_filestore_instance.shared_app.networks.0.ip_addresses.0
  sensitive = false
}

output "filestore_name_app" {
  value = google_filestore_instance.shared_app.file_shares[0].name
  sensitive = false
}

output "network_name" {
  value = google_compute_network.cluster_network.name
  sensitive = false
}

output "subnet_name" {
  value = google_compute_subnetwork.cluster_subnet.name
  sensitive = false
}
