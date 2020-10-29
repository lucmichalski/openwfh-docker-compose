output "droplet_id" {
    description = "ID of the Droplet created"
    value       = digitalocean_droplet.openwfh.id
}

output "private_ip" {
    description = "Private IP of the droplet"
    value       = digitalocean_droplet.openwfh.ipv4_address_private
}

output "public_ip" {
    description = "Public IP of the droplet"
    value       = digitalocean_droplet.openwfh.ipv4_address
}

locals {
  ansible-inventory = templatefile("inventory.tmpl", {
    openwfh_ip = digitalocean_droplet.openwfh.ipv4_address
    private_key = var.ssh_private_key_path
  })
}

resource "local_file" "openwfh_inventory" {
  content  = local.ansible-inventory
  filename = "../../ansible/inventory/do_inventory"
}