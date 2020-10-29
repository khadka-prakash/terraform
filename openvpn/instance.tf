resource "google_compute_instance" "ovpn" {
  name         = "ovpn"
  machine_type = var.machine_type 
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.os_image 
    }
  }

  can_ip_forward = true

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_file)}"
    startup-script = data.template_file.deployment_shell_script.rendered
  }

  network_interface {
    network = google_compute_network.ovpn.name

    access_config {
      // Include this section to give the VM an external ip address
    }
  }

  // Apply the firewall rule to allow external IPs to access this instance
  tags = ["http-server", "ovpn"]
}

data "template_file" "deployment_shell_script" {
  template = file("script.sh")
}

resource "google_compute_firewall" "http-server" {
  name    = "default-allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443", "943", "1194"]
  }

  // Allow traffic from everywhere to instances with an http-server tag
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}

output "ip" {
  value = "${google_compute_instance.ovpn.network_interface.0.access_config.0.nat_ip}"
}
