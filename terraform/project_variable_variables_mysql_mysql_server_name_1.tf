variable "variables_mysql_mysql_server_name_1" {
  type        = string
  nullable    = true
  sensitive   = false
  description = "The value associated with the variable MySQL.Server.Name"
  default     = "192.168.1.64"
}
resource "octopusdeploy_variable" "variables_mysql_mysql_server_name_1" {
  owner_id     = "${octopusdeploy_library_variable_set.library_variable_set_variables_mysql.id}"
  value        = "${var.variables_mysql_mysql_server_name_1}"
  name         = "MySQL.Server.Name"
  type         = "String"
  is_sensitive = false
  depends_on   = []
}
