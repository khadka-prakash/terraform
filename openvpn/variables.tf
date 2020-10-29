variable "machine_type" {
  default = "n1-standard-1"
}

variable "os_image" {
  default = "ubuntu-os-cloud/ubuntu-1804-lts"
}

variable "region" {
  default = "europe-west2"
}

variable "zone" {
  default = "europe-west2-c"
}

variable "project_id" {
  description = "The project ID to host the cluster in"
  default = ""
}

variable "private_key_file" {
  default = "./certs/ovpn"
}

variable "public_key_file" {
  default = "./certs/ovpn.pub"
}

variable "network" {
  description = "The VPC network to host the cluster in"
  default     = "default"
}

variable "subnetwork" {
  description = "The subnetwork to host the cluster in"
  default     = "default"
}

variable "compute_engine_service_account" {
  description = "Service account to associate to the nodes in the cluster"
  default     = ""
}

variable "skip_provisioners" {
  type        = bool
  description = "Flag to skip local-exec provisioners"
  default     = true
}
