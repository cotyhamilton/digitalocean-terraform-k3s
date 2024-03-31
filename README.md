# digitalocean k3s single node terraform module

Provisions a single node k3s cluster on DigitalOcean.

Useful for experimenting with kubernetes without incurring extra costs for cloud resources like loadbalancers, volumes, and managed databases. Just pay for the cost of the droplet. ($6/mo)

## usage

```
module "do-k3s" {
  source       = "github.com/cotyhamilton/digitalocean-terraform-k3s"
  project_name = var.project_name
  domain_name  = var.domain_name
  ssh_key_name = var.ssh_key_name
}

...

Apply complete! ...

Outputs:

summary = {
  "apps_fqdn" = "*.x.cotyhamilton.com"
  "k3s_server_fqdn" = "k3s.cotyhamilton.com"
  "region" = "nyc3"
  "server" = {
    "ip_private" = "10.10.10.2"
    "ip_public" = "174.138.70.208"
    "name" = "k3s-server-0"
    "price" = 24
  }
}
```

Copy the kube config to your local machine.

```sh
scp root@174.138.70.208:/etc/rancher/k3s/k3s.yaml ~/.kube/config
```

Replace endpoint with your k3s server fqdn.

```sh
sudo sed -i -e "s/127.0.0.1/k3s.cotyhamilton.com/g" ~/.kube/config
```

Test

```sh
kubectl cluster-info
```

## Inputs

| Name           | Description                                   |  Type  |      Default       | Required |
| -------------- | --------------------------------------------- | :----: | :----------------: | :------: |
| project_name   | Existing project name managed by DigitalOcean | string |        n/a         |   yes    |
| domain_name    | Existing domain name managed by DigitalOcean  | string |        n/a         |   yes    |
| ssh_key_name   | Existing ssh key name managed by DigitalOcean | string |        n/a         |   yes    |
| region         | DigitalOcean region                           | string |       `nyc3`       |    no    |
| droplet_image  | DigitalOcean droplet image slug               | string | `ubuntu-22-04-x64` |    no    |
| droplet_size   | DigitalOcean droplet size                     | string |   `s-2vcpu-4gb`    |    no    |
| k3s_subdomain  | Subdomain to host the k3s server              | string |       `k3s`        |   yes    |
| apps_subdomain | Wildcard subdomain to host apps on            | string |       `*.x*`       |    no    |
| k3s_server_tag | Droplet tag                                   | string |    `k3s-server`    |    no    |
