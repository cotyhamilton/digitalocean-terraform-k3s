resource "digitalocean_firewall" "k3s" {
  name = "k3s"

  tags = [digitalocean_tag.k3s.name]

  inbound_rule {
    protocol         = "icmp"
    source_addresses = [digitalocean_vpc.k3s.ip_range]
    source_tags      = [digitalocean_tag.k3s.name]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "6443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "all"
    source_addresses = [digitalocean_vpc.k3s.ip_range]
    source_tags      = [digitalocean_tag.k3s.name]
  }

  inbound_rule {
    protocol         = "udp"
    port_range       = "all"
    source_addresses = [digitalocean_vpc.k3s.ip_range]
    source_tags      = [digitalocean_tag.k3s.name]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "all"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "all"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}