output "cluster_summary" {
  value = {
    apps_fqdn: digitalocean_record.apps.fqdn
    k3s_server_fqdn : digitalocean_record.k3s.fqdn
    region : var.region
    server : {
        name       = digitalocean_droplet.k3s.name
        ip_public  = digitalocean_droplet.k3s.ipv4_address
        ip_private = digitalocean_droplet.k3s.ipv4_address_private
        price      = digitalocean_droplet.k3s.price_monthly
      }
  }
}