resource "google_compute_instance" "app_instance" {
  count        = 2
  name         = "app-instance-${count.index}"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.os-image
    }
  }

    metadata = {
    ssh-keys = "serhatsari:${file("~/.ssh/gce.pub")}"
  }

  network_interface {
    network   = google_compute_network.app_network.name
    subnetwork = google_compute_subnetwork.app_subnetwork.name
   
     access_config {
    
    
    }
  }

  tags = ["app-instance"] 
}

resource "google_compute_instance" "mysql_instance" {
  name         = "mysql-instance"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.os-image
    }
  }

    metadata = {
    ssh-keys = "serhatsari:${file("~/.ssh/gce.pub")}"
  }

  network_interface {
    network   = google_compute_network.app_network.name
    subnetwork = google_compute_subnetwork.app_subnetwork.name
   
     access_config {
    
    }
  }

  tags = ["mysql-instance"] 
}

resource "google_compute_instance" "jenkins_instance" {
  name         = "jenkins-instance"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.os-image
    }
  }

    metadata = {
    ssh-keys = "serhatsari:${file("~/.ssh/gce.pub")}"
  }

  network_interface {
    network   = google_compute_network.app_network.name
    subnetwork = google_compute_subnetwork.app_subnetwork.name
   
     access_config {
    
    }
  }

  tags = ["jenkins-instance"] 
}

resource "local_file" "inventory" {
  filename = "../inventory.ini"
  content = <<-EOT
    [app_servers]
    ${join("\n", [
      for instance in google_compute_instance.app_instance :
      "${instance.name} ansible_ssh_host=${instance.network_interface[0].access_config[0].nat_ip}"
    ])}

    [mysql_server]
    mysql-instance ansible_ssh_host=${google_compute_instance.mysql_instance.network_interface[0].access_config[0].nat_ip}

    [jenkins_server]
    jenkins-instance ansible_ssh_host=${google_compute_instance.jenkins_instance.network_interface[0].access_config[0].nat_ip}
  EOT
}

resource "null_resource" "run_ansible_playbook" {
  depends_on = [local_file.inventory]

  provisioner "local-exec" {
    command = "ansible-playbook ../ansible/main.yml --ask-vault-pass"
  }
}


