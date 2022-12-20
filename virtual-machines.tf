resource "google_compute_address" "static" {
  name = "ipv4-address"
}

resource "google_compute_instance" "vm_instance_public" {
  name         = "web-server-vm"
  machine_type = var.linux_instance_type
  zone         = var.gcp_zone
  tags         = ["ssh", "http", "rdp", "http-php"]
  boot_disk {
    initialize_params {
      image = var.linux_boot_image
    }
  }
  metadata = {
    ssh-keys = "${var.ssh-user}:${file(var.ssh-public_key_path)}"
  }

  network_interface {
    network    = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.default.name
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }

    provisioner "local-exec" {
      command = "ansible-playbook -i ansible/inventory/hosts.cfg -u ${var.ssh-user} --private-key ${var.ssh-private_key_path}  ansible/deploy-lamp.yml"
    }
  
   connection {
      type = "ssh"
      host = google_compute_address.static.address
      user = var.ssh-user
      private_key = "${file(var.ssh-private_key_path)}"
      agent = "false"
    }
}
