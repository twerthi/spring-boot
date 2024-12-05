variable "variables_mysql_mysql_database_admin_username_1" {
  type        = string
  nullable    = true
  sensitive   = false
  description = "The value associated with the variable MySQL.Database.Admin.Username"
  default     = "root"
}
resource "octopusdeploy_variable" "variables_mysql_mysql_database_admin_username_1" {
  owner_id     = "${octopusdeploy_library_variable_set.library_variable_set_variables_mysql.id}"
  value        = "${var.variables_mysql_mysql_database_admin_username_1}"
  name         = "MySQL.Database.Admin.Username"
  type         = "String"
  is_sensitive = false
  depends_on   = []
}
