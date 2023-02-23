variable "instance_region" {
  description = "Zone for cloud instances"
  type = string
  default = "europe-west1"
}

variable "database_user" {
  description = "User for database"
  type = string
  default = "user"
}

variable "database_password" {
  description = "password for database"
  type = string
  default = "passw0rd!"
}
