resource "digitalocean_vpc" "k3s" {
  name        = "k3s"
  region      = var.region
  description = "k3s"
  ip_range    = "10.10.10.0/24"
}