variable "bucket_name" {
  description = "Bucket name variable"
  default     = "infrastructure-tfstate"
}

variable "project_id" {
  description = "Project ID"
  default     = "kubecloud-404510"
}

variable "subnet_name" {
  description = "Subnet Name"
  default     = "subnet-gke"
}

variable "region" {
  description = "Project Region"
  default     = "us-central1"
}

variable "vpc_name" {
  description = "VPC Name"
  default     = "vpc-gke"
}

variable "ip_cidr_range" {
  description = "IP CIDR Range"
  default     = "10.10.10.0/24"
}

variable "gke_id" {
  description = "GKE ID"
  default     = "tooling"
}

variable "gke_num_nodes" {
  # recomended 3 or more.
  description = "number of gke nodes"
  default     = 1
}

variable "machine_type" {
  # This e2-micro is a sample for the free tier; however, this machine doesn't support all the basic cluster features.
  description = "Machine type"
  default     = "e2-micro"
}