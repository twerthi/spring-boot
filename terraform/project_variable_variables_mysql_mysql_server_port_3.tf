variable "variables_mysql_mysql_server_port_3" {
  type        = string
  nullable    = true
  sensitive   = false
  description = "The value associated with the variable MySQL.Server.Port"
  default     = "30000"
}
resource "octopusdeploy_variable" "variables_mysql_mysql_server_port_3" {
  owner_id     = "${octopusdeploy_library_variable_set.library_variable_set_variables_mysql.id}"
  value        = "${var.variables_mysql_mysql_server_port_3}"
  name         = "MySQL.Server.Port"
  type         = "String"
  is_sensitive = false
  depends_on   = []
}
