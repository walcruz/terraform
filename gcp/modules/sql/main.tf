resource "google_sql_database_instance" "db" {
  name             = var.sql_instance_name
  database_version = var.sql_version

  project = var.project_id
  region  = var.region

  deletion_protection = false #var.sql_delete_protection

  settings {
    tier              = var.sql_tier
    edition           = var.sql_edition
    availability_type = var.sql_availability_type

    ip_configuration {
      ipv4_enabled                                  = var.sql_private_network == null ? true : false
      private_network                               = var.sql_private_network
      enable_private_path_for_google_cloud_services = var.sql_private_network == null ? false : true
      allocated_ip_range                            = var.allocated_ip_range
      require_ssl                                   = var.require_ssl
    }

    backup_configuration {
      enabled                        = true
      point_in_time_recovery_enabled = true
    }
  }
}

resource "google_sql_database" "db" {
  instance = google_sql_database_instance.db.name
  name     = var.sql_database_name
  project  = var.project_id
}

resource "google_sql_user" "db_user" {
  name     = var.sql_user
  instance = google_sql_database_instance.db.name
  password = random_password.db_password.result
  project  = var.project_id
}

resource "random_password" "db_password" {
  length  = 12
  special = false
}

# SECRET MANAGER USER & PASS

resource "google_secret_manager_secret" "db_user" {
  secret_id = "${var.sql_database_name}-user-db"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "db_user" {
  secret = google_secret_manager_secret.db_user.id

  secret_data = var.sql_user
}

resource "google_secret_manager_secret" "db_password" {
  secret_id = "${var.sql_database_name}-password-db"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "db_password" {
  secret = google_secret_manager_secret.db_password.id

  secret_data = random_password.db_password.result
}