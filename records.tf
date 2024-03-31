resource "digitalocean_record" "k3s" {
  domain = data.digitalocean_domain.k3s.id
  type   = "A"
  name   = var.k3s_subdomain
  ttl    = 60
  value  = digitalocean_droplet.k3s.ipv4_address
}

resource "digitalocean_record" "apps" {
  domain = data.digitalocean_domain.k3s.id
  type   = "A"
  name   = var.apps_subdomain
  ttl    = 60
  value  = digitalocean_droplet.k3s.ipv4_address
}