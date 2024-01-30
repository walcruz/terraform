provider "google" {
  project = var.project_id
  region  = var.region
}

data "google_project" "project" {
}

resource "time_sleep" "wait_kms_activation" {
  depends_on = [google_project_service.apis]

  create_duration = "120s"
}