resource "google_service_account" "service_account" {
  account_id   = var.sa_id_name
  display_name = "Service account: ${var.sa_id_name}"
}