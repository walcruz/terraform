data "google_project" "project" {
}

module "sa" {
  source = "../modules/service_account"

  sa_id_name = "service-${data.google_project.project.number}"
}