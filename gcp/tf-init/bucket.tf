data "google_storage_project_service_account" "gcs_account" {
}

module "storage_bucket" {
  source         = "../modules/storage_bucket"
  bucket_name    = "${var.bucket_name}-${var.project_id}"
  project_number = data.google_project.project.number
  storage_sa     = "serviceAccount:${data.google_storage_project_service_account.gcs_account.email_address}"

  depends_on = [
    google_project_service.apis,
    module.sa,
  ]

}