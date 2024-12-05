variable "variables_mysql_anothervar_1" {
  type        = string
  nullable    = true
  sensitive   = false
  description = "The value associated with the variable AnotherVar"
  default     = "Sesna"
}
resource "octopusdeploy_variable" "variables_mysql_anothervar_1" {
  owner_id     = "${octopusdeploy_library_variable_set.library_variable_set_variables_mysql.id}"
  value        = "${var.variables_mysql_anothervar_1}"
  name         = "AnotherVar"
  type         = "String"
  is_sensitive = false
  depends_on   = []
}
