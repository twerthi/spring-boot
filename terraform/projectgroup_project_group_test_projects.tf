variable "project_group_test_projects_name" {
  type        = string
  nullable    = false
  sensitive   = false
  description = "The name of the project group to lookup"
  default     = "Test projects"
}
resource "octopusdeploy_project_group" "project_group_test_projects" {
  name = "${var.project_group_test_projects_name}"
}
