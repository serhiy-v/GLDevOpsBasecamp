resource "google_sql_database" "database" {
  name     = "wordpress_database"
  instance = google_sql_database_instance.sql_instance.name
}

resource "google_sql_database_instance" "sql_instance" {
  name             = "wordpress-database"
  region           = var.instance_region
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
    
    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.vpc.self_link
    }
  }

  deletion_protection = false

  depends_on = [google_service_networking_connection.private_vpc_connection]
}

resource "google_sql_user" "users" {
  name     = var.database_user
  instance = google_sql_database_instance.sql_instance.name
  password = var.database_password
}
