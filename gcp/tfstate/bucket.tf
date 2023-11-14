data "google_project" "project" {
}

# data "google_service_account" "sa" {
#   account_id = "service-${data.google_project.project.number}"
# }

data "google_storage_project_service_account" "gcs_account" {
}

module "storage_bucket" {
  source         = "../modules/storage_bucket"
  bucket_name    = "${var.bucket_name}-${var.project_id}"
  project_number = data.google_project.project.number
  member         = "serviceAccount:${data.google_storage_project_service_account.gcs_account.email_address}" ###${data.google_service_account.sa.email}
}