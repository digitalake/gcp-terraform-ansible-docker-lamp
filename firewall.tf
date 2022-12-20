# allow http
resource "google_compute_firewall" "allow-http" {
  name    = "allow-http"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http"]
}

# allow http
resource "google_compute_firewall" "allow-http-php-myadmin" {
  name    = "allow-http-php-myadmin"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "tcp"
    ports    = ["7080"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-php"]
}

# allow ssh
resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}

# allow rdp
resource "google_compute_firewall" "allow-rdp" {
  name    = "allow-rdp"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["rdp"]
}