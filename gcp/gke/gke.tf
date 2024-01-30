module "vpc" {
  source = "../modules/vpc"

  vpc_name = "${var.vpc_name}-${var.gke_id}"
}

module "subnet" {
  source = "../modules/subnet"

  subnet_name   = "${var.subnet_name}-${var.gke_id}"
  region        = var.region
  vpc_name      = "${var.vpc_name}-${var.gke_id}"
  ip_cidr_range = var.ip_cidr_range

  depends_on = [module.vpc]
}

module "gke" {
  source = "../modules/gke"

  gke_num_nodes = var.gke_num_nodes
  machine_type  = var.machine_type

  project_id = var.project_id
  region     = var.region

  vpc_name    = "${var.vpc_name}-${var.gke_id}"
  subnet_name = "${var.subnet_name}-${var.gke_id}"

  sa_id_name = data.google_service_account.sa.email

  depends_on = [
    module.vpc,
    module.subnet
  ]
}
