resource "google_compute_firewall" "allow_app" {
  name    = "allow-app"
  network = google_compute_network.app_network.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80","443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["app-instance"]
}

resource "google_compute_firewall" "allow_mysql" {
  name    = "allow-mysql"
  network = google_compute_network.app_network.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443", "3306"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["mysql-instance"]
}

resource "google_compute_firewall" "allow_jenkins" {
  name    = "allow-jenkins"
  network = google_compute_network.app_network.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "8080", "443"]  
  }

  source_ranges = [
    "0.0.0.0/0" 
  ]

  target_tags = ["jenkins-instance"]
}