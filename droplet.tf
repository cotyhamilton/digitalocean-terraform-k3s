resource "digitalocean_droplet" "k3s" {
  name       = "k3s-server-0"
  region     = var.region
  image      = var.droplet_image
  size       = var.droplet_size
  monitoring = true
  ssh_keys   = [data.digitalocean_ssh_key.default.id]
  vpc_uuid   = digitalocean_vpc.k3s.id
  tags       = [digitalocean_tag.k3s.name]

  user_data = templatefile("${path.module}/user_data/k3s.yaml", {
    K3S_TOKEN = random_password.k3s_token.result,
    K3S_DOMAIN = "${var.k3s_subdomain}.${var.domain_name}"
  })
}

resource "digitalocean_project_resources" "k3s" {
  project = data.digitalocean_project.default.id
  resources = [digitalocean_droplet.k3s.urn]
}