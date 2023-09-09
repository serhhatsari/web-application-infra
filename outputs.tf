output "app_instance_ips" {
  value = [for instance in google_compute_instance.app_instance : instance.network_interface[0].access_config[0].nat_ip]
}

output "mysql_instance_ip" {
  value =  google_compute_instance.mysql_instance.network_interface[0].access_config[0].nat_ip
}

output "load_balancer_ip" {
  value = google_compute_forwarding_rule.app_forwarding_rule.ip_address
}