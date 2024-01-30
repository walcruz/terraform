output "gke_endpoint" {
  value = module.gke.gke_endpoint
}

output "gke_ca_certificate" {
  value = module.gke.gke_ca_certificate
}

output "vpc_id" {
  value = module.vpc.vpc_id
}