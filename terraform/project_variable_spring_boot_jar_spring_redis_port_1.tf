variable "spring_boot_jar_spring_redis_port_1" {
  type        = string
  nullable    = true
  sensitive   = false
  description = "The value associated with the variable spring.redis.port"
  default     = "6352"
}
resource "octopusdeploy_variable" "spring_boot_jar_spring_redis_port_1" {
  owner_id     = "${octopusdeploy_project.project_spring_boot_jar.id}"
  value        = "${var.spring_boot_jar_spring_redis_port_1}"
  name         = "spring.redis.port"
  type         = "String"
  is_sensitive = false
  depends_on   = []
}
