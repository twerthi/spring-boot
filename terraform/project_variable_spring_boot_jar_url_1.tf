variable "spring_boot_jar_url_1" {
  type        = string
  nullable    = true
  sensitive   = false
  description = "The value associated with the variable url"
  default     = "jdbc:mysql://#{MySql.Server.Name}:#{MySQL.Server.Port}/#{Project.MySql.Database.Name}?useUnicode=true"
}
resource "octopusdeploy_variable" "spring_boot_jar_url_1" {
  owner_id     = "${octopusdeploy_project.project_spring_boot_jar.id}"
  value        = "${var.spring_boot_jar_url_1}"
  name         = "url"
  type         = "String"
  is_sensitive = false
  depends_on   = []
}
