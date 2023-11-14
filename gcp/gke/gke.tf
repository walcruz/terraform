locals {
  subnet_name = "${var.subnet_name}-${var.gke_id}"
  vpc_name    = "${var.vpc_name}-${var.gke_id}"
}

module "vpc" {
  source = "../modules/vpc"

  vpc_name = local.vpc_name
}

module "subnet" {
  source = "../modules/subnet"

  subnet_name   = local.subnet_name
  region        = var.region
  vpc_name      = local.vpc_name
  ip_cidr_range = var.ip_cidr_range

  depends_on = [module.vpc]
}

module "gke" {
  # to activate: gcloud services enable container.googleapis.com (take 3 minutes)
  source = "../modules/gke"

  gke_num_nodes = var.gke_num_nodes
  machine_type  = var.machine_type

  project_id = var.project_id
  region     = var.region

  vpc_name    = local.vpc_name
  subnet_name = local.subnet_name

  depends_on = [
    module.vpc,
    module.subnet
  ]
}