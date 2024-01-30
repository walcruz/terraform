# Storage encryption
# to activate KMS: gcloud services enable cloudkms.googleapis.com
resource "google_kms_key_ring" "bucket" {
  name     = var.bucket_name
  location = "us"
}

# If the Ring is already created you need to switch to data
# data "google_kms_key_ring" "bucket" {
#   name = var.bucket_name
#   location = "us"
# }

resource "google_kms_crypto_key" "bucket" {
  name = var.bucket_name
  #key_ring        = data.google_kms_key_ring.bucket.id
  key_ring        = google_kms_key_ring.bucket.id
  rotation_period = "86400s"

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_kms_crypto_key_iam_binding" "bucket" {

  crypto_key_id = google_kms_crypto_key.bucket.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

  members = [
    "${var.storage_sa}",
  ]
}

#################################################################################

# Storage
resource "google_storage_bucket" "bucket" {
  name                     = var.bucket_name
  force_destroy            = true
  location                 = "US"
  storage_class            = "STANDARD"
  public_access_prevention = "enforced"

  versioning {
    enabled = true
  }
  encryption {
    default_kms_key_name = google_kms_crypto_key.bucket.id
  }
  depends_on = [
    google_kms_crypto_key_iam_binding.bucket
  ]
}

#################################################################################