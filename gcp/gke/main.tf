provider "google" {
  project = var.project_id
  region  = var.region
}

data "google_project" "project" {
}

data "google_service_account" "sa" {
  account_id = "service-${data.google_project.project.number}"
}
