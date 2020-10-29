resource "digitalocean_droplet" "openwfh" {
    image = var.droplet_image
    name = var.droplet_name
    region = var.region
    size = var.droplet_size
    private_networking = true
    monitoring = true
    ssh_keys = [
      var.do_ssh_key
    ]
}