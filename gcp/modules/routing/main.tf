module "cloud_router" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "5.0.1"

  name    = "router-shared-host"
  project = var.project_id
  region  = "europe-west1"
  network = module.network.network_name
  nats = [
    {
      name = "nat-shared-host"
    }
  ]
}


resource "google_compute_global_address" "private_ip_alloc" {
  project       = var.project_id
  name          = "airflow-db-ip"
  address_type  = "INTERNAL"
  purpose       = "VPC_PEERING"
  prefix_length = 16
  network       = module.network.network_id
  address       = "10.81.0.0"
}

resource "google_service_networking_connection" "vpc_connection" {
  network                 = module.network.network_id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_alloc.name]
}
###########CHECK PUBLICATION