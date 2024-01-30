output "random_db_password" {
  value = random_password.db_password.result
}

output "sql_database_ip_addres" {
  value = google_sql_database_instance.db.first_ip_address
}