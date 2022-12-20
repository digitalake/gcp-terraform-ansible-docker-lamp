# generate inventory file for Ansible
resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/ansible/hosts.tpl",
    {
      web_public_ip = google_compute_address.static.address
    }
  )
  filename   = "ansible/inventory/hosts.cfg"
  depends_on = [google_compute_address.static]
}

