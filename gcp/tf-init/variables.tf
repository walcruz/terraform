variable "bucket_name" {
  description = "Bucket name variable"
  default     = "tfstate-devops"
}

variable "project_id" {
  description = "Project ID"
  default     = "walter-sre-test"
}

variable "region" {
  default = "us-central1"
}

variable "project_apis" {
  description = "Project APIs to enabled"
  default = [
    "storage.googleapis.com",
    "container.googleapis.com",
    "serviceusage.googleapis.com",
    "iam.googleapis.com",
    "cloudbuild.googleapis.com",
    "secretmanager.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "cloudkms.googleapis.com",
    "sqladmin.googleapis.com",
    "servicenetworking.googleapis.com",
  ]
}

variable "roles" {
  description = "SA roles"
  default = [
    "roles/editor",
  ]
}