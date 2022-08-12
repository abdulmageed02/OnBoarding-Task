resource "google_compute_subnetwork" "my_subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  region      = var.region
  network       = google_compute_network.vpc_network.id
  # private_ip_google_access = true
}