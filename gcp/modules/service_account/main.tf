resource "google_service_account" "sa" {
  account_id   = var.sa_id_name
  display_name = "Service account: ${var.sa_id_name}"
  project      = var.project
}

resource "google_project_iam_member" "sa_iam" {
  for_each = toset(var.roles)

  project = var.project
  role    = each.value
  member  = "serviceAccount:${google_service_account.sa.email}"
}
