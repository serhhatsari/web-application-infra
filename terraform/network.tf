resource "google_compute_network" "app_network" {
  name = "app-network"
}

resource "google_compute_subnetwork" "app_subnetwork" {
  name          = "app-subnetwork"
  ip_cidr_range = "10.13.0.0/24"
  network       = google_compute_network.app_network.id
  region        =  var.region
}
