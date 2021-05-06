resource "random_password" "database_password" {
  length           = 32
  special          = true
}

resource "scaleway_rdb_instance" "main" {
  name           = "raising-unicorn-database"
  node_type      = "db-dev-s"
  engine         = "PostgreSQL-11"
  is_ha_cluster  = false
  disable_backup = true
  user_name      = "unicorn-app-user"
  password       = random_password.database_password.result
}

output "database-password" {
  value = random_password.database_password.result
}
