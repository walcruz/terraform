# Storage encryption
# to activate KMS: gcloud services enable cloudkms.googleapis.com
resource "google_kms_key_ring" "bucket" {
  name     = "${var.bucket_name}"
  location = "us"
}

resource "google_kms_crypto_key" "bucket" {
  name            = "${var.bucket_name}"
  key_ring        = google_kms_key_ring.bucket.id
  rotation_period = "86400s"

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_project_iam_member" "default" {
  project = var.project_number
  role    = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member  = var.member
}
#################################################################################

# Storage
resource "google_storage_bucket" "bucket" {
  name          = "${var.bucket_name}"
  force_destroy = false
  location      = "US"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
  encryption {
    default_kms_key_name = google_kms_crypto_key.bucket.id
  }
  depends_on = [
    google_project_iam_member.default
  ]
}

#################################################################################