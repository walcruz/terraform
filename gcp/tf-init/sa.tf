module "sa" {
  source = "../modules/service_account"

  sa_id_name = "service-${data.google_project.project.number}"
  project    = var.project_id
  roles      = var.roles

  depends_on = [
    google_project_service.apis,
    time_sleep.wait_kms_activation,
  ]
}