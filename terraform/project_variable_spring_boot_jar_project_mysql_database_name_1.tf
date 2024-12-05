variable "spring_boot_jar_project_mysql_database_name_1" {
  type        = string
  nullable    = true
  sensitive   = false
  description = "The value associated with the variable Project.MySql.Database.Name"
  default     = "mydatabase"
}
resource "octopusdeploy_variable" "spring_boot_jar_project_mysql_database_name_1" {
  owner_id     = "${octopusdeploy_project.project_spring_boot_jar.id}"
  value        = "${var.spring_boot_jar_project_mysql_database_name_1}"
  name         = "Project.MySql.Database.Name"
  type         = "String"
  is_sensitive = false
  depends_on   = []
}
