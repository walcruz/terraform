terraform {
  backend "gcs" {
    bucket = "infrastructure-tfstate-kubecloud-404510"
    prefix = "terraform/gke-state"
  }
}
