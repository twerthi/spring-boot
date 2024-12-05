variable "variables_mysql_mysql_server_port_2" {
  type        = string
  nullable    = true
  sensitive   = false
  description = "The value associated with the variable MySQL.Server.Port"
  default     = "30002"
}
resource "octopusdeploy_variable" "variables_mysql_mysql_server_port_2" {
  owner_id     = "${octopusdeploy_library_variable_set.library_variable_set_variables_mysql.id}"
  value        = "${var.variables_mysql_mysql_server_port_2}"
  name         = "MySQL.Server.Port"
  type         = "String"
  description  = ""
  is_sensitive = false
  depends_on   = []
}
