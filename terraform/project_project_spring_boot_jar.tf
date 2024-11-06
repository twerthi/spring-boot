variable "project_spring_boot_jar_name" {
  type        = string
  nullable    = false
  sensitive   = false
  description = "The name of the project exported from Spring-boot-jar"
  default     = "Spring-boot-jar"
}
variable "project_spring_boot_jar_description_prefix" {
  type        = string
  nullable    = false
  sensitive   = false
  description = "An optional prefix to add to the project description for the project Spring-boot-jar"
  default     = ""
}
variable "project_spring_boot_jar_description_suffix" {
  type        = string
  nullable    = false
  sensitive   = false
  description = "An optional suffix to add to the project description for the project Spring-boot-jar"
  default     = ""
}
variable "project_spring_boot_jar_description" {
  type        = string
  nullable    = false
  sensitive   = false
  description = "The description of the project exported from Spring-boot-jar"
  default     = ""
}
variable "project_spring_boot_jar_tenanted" {
  type        = string
  nullable    = false
  sensitive   = false
  description = "The tenanted setting for the project Untenanted"
  default     = "Untenanted"
}
resource "octopusdeploy_project" "project_spring_boot_jar" {
  name                                 = "${var.project_spring_boot_jar_name}"
  auto_create_release                  = false
  default_guided_failure_mode          = "EnvironmentDefault"
  default_to_skip_if_already_installed = false
  discrete_channel_release             = false
  is_disabled                          = false
  is_version_controlled                = false
  lifecycle_id                         = "${data.octopusdeploy_lifecycles.lifecycle_default_lifecycle.lifecycles[0].id}"
  project_group_id                     = "${octopusdeploy_project_group.project_group_test_projects.id}"
  included_library_variable_sets       = ["${octopusdeploy_library_variable_set.library_variable_set_variables_mysql.id}"]
  tenanted_deployment_participation    = "${var.project_spring_boot_jar_tenanted}"

  connectivity_policy {
    allow_deployments_to_no_targets = true
    exclude_unhealthy_targets       = false
    skip_machine_behavior           = "None"
  }

  versioning_strategy {
    template = "#{Octopus.Version.LastMajor}.#{Octopus.Version.LastMinor}.#{Octopus.Version.NextPatch}"
  }

  lifecycle {
    ignore_changes = []
  }
  description = "${var.project_spring_boot_jar_description_prefix}${var.project_spring_boot_jar_description}${var.project_spring_boot_jar_description_suffix}"
}
