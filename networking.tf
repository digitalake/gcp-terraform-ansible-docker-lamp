resource "google_compute_network" "vpc_network" {
  name                    = "primary-network"
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
}

resource "google_compute_subnetwork" "default" {
  name          = "web-server-subnet"
  ip_cidr_range = var.network-subnet-cidr
  region        = var.gcp_region
  network       = google_compute_network.vpc_network.id
}