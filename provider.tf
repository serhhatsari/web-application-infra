provider "google" {
  credentials = file("gcp-credential.json")
  project     = var.project
  region      = var.region
  zone        = var.zone
}
