variable "spring_boot_jar__configuration_appenders_file__filename_1" {
  type        = string
  nullable    = true
  sensitive   = false
  description = "The value associated with the variable /Configuration/Appenders/File/@fileName"
  default     = "/var/log/octopus/example-#{Octopus.Environment.Name | ToLower}.log"
}
resource "octopusdeploy_variable" "spring_boot_jar__configuration_appenders_file__filename_1" {
  owner_id     = "${octopusdeploy_project.project_spring_boot_jar.id}"
  value        = "${var.spring_boot_jar__configuration_appenders_file__filename_1}"
  name         = "/Configuration/Appenders/File/@fileName"
  type         = "String"
  is_sensitive = false
  depends_on   = []
}
