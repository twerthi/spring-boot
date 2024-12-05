variable "variables_mysql_mysql_database_admin_password_1" {
  type        = string
  nullable    = true
  sensitive   = true
  description = "The secret variable value associated with the variable MySQL.Database.Admin.Password"
}
resource "octopusdeploy_variable" "variables_mysql_mysql_database_admin_password_1" {
  owner_id        = "${octopusdeploy_library_variable_set.library_variable_set_variables_mysql.id}"
  name            = "MySQL.Database.Admin.Password"
  type            = "Sensitive"
  is_sensitive    = true
  sensitive_value = var.variables_mysql_mysql_database_admin_password_1
  depends_on      = []
}
