variable "project_name" {
  type = string
  description = "Existing project name managed by DigitalOcean"
}

variable "domain_name" {
  type = string
  description = "Existing domain name managed by DigitalOcean"
}

variable "ssh_key_name" {
  type = string
  description = "Existing ssh key name managed by DigitalOcean"
}

variable "region" {
  type = string
  description = "DigitalOcean region"
  default = "nyc3"
}

variable "droplet_image" {
  type = string
  description = "DigitalOcean droplet image slug"
  default = "ubuntu-22-04-x64"
}

variable "droplet_size" {
  type = string
  description = "DigitalOcean droplet size"
  default = "s-2vcpu-4gb"
}

variable "k3s_subdomain" {
  type = string
  description = "Subdomain to host the k3s server"
  default = "k3s"
}

variable "apps_subdomain" {
  type = string
  description = "Subdomain to host apps on k3s"
  default = "*.x"
}

variable "k3s_server_tag" {
  type = string
  description = "Droplet tag"
  default = "k3s-server"
}