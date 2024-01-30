terraform {
  backend "gcs" {
    bucket = "tfstate-devops-walter-sre-test"
    prefix = "terraform/gke-state"
  }
}
