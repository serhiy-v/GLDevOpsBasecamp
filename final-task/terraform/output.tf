output "external_ip" {
  value = google_compute_instance.k8s-wordpress.network_interface[0].access_config[0].nat_ip
}

output "database_ip" {
  value = google_sql_database_instance.sql_instance.ip_address
}

output "database_name" {
  value = google_sql_database.database.name
}
