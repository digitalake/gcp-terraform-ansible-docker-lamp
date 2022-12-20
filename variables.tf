# GCP authentication file
variable "gcp_auth_file" {
  type        = string
  description = "GCP authentication file"
  default     = "~/.config/gcloud/application_default_credentials.json"
}
# Public ssh key path
variable "ssh-public_key_path" {
  type        = string
  description = "ssh key to add to vm"
  default     = "~/.ssh/deploy.pub"
}
# Private ssh key path
variable "ssh-private_key_path" {
  type        = string
  description = "ssh key to connect to vm with"
  default     = "~/.ssh/deploy"
}
# SSH-user's username
variable "ssh-user" {
  type        = string
  description = "user to connect ot vm via ssh"
  default     = "weber"
}

# define GCP region
variable "gcp_region" {
  type        = string
  description = "GCP region"
}
# define GCP zone
variable "gcp_zone" {
  type        = string
  description = "GCP zone"
}
# define GCP project name
variable "gcp_project" {
  type        = string
  description = "GCP project name"
}
# define subnet cidr
variable "network-subnet-cidr" {
  type        = string
  description = "The CIDR for the network subnet"
}
# define instance type for vm will be created
variable "linux_instance_type" {
  type        = string
  description = "VM instance type for Linux Server"
  default     = "e2-micro"
}
# define vm boot disk image
variable "linux_boot_image" {
  type        = string
  description = "The disk image for vm boot"
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
}