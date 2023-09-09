resource "google_compute_instance_group" "app_instance_group" {
  name        = "app-instance-group"
  instances   = google_compute_instance.app_instance.*.self_link
  named_port {
    name = "http"
    port = 80
  }
}

resource "google_compute_http_health_check" "app_health_check" {
  name               = "app-health-check"
  request_path       = "/"
  port               = 80
}

resource "google_compute_backend_service" "app_backend_service" {
  name        = "app-backend-service"
  protocol    = "HTTP"
  port_name   = "http"

  health_checks = [google_compute_http_health_check.app_health_check.self_link]

  backend {
    group = google_compute_instance_group.app_instance_group.self_link
  }
}

resource "google_compute_target_pool" "app_target_pool" {
  name         = "app-target-pool"
  instances    = google_compute_instance.app_instance.*.self_link
  health_checks = [google_compute_http_health_check.app_health_check.self_link]
}

resource "google_compute_forwarding_rule" "app_forwarding_rule" {
  name       = "app-forwarding-rule"
  target     = google_compute_target_pool.app_target_pool.self_link
  port_range = "80"
}