output "mysql_root_password" {
  value     = random_password.mysql_root_password.result
  sensitive = true
}

