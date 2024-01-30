variable "gke_num_nodes" {
  description = "number of gke nodes"
}

variable "project_id" {
  description = "Project ID"
}

variable "region" {
  description = "Region"
}

variable "vpc_name" {
  description = "VPC Name"
}

variable "subnet_name" {
  description = "Subnet Name"
}

variable "machine_type" {
  description = "Machine type"
}

variable "initial_node_count" {
  description = "GKE Initial node count"
  default     = 1
}

variable "sa_id_name" {
  description = "Service Account ID and Name"
}