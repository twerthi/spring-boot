variable "spring_boot_jar_spring_redis_host_1" {
  type        = string
  nullable    = true
  sensitive   = false
  description = "The value associated with the variable spring.redis.host"
  default     = "myredishost"
}
resource "octopusdeploy_variable" "spring_boot_jar_spring_redis_host_1" {
  owner_id     = "${octopusdeploy_project.project_spring_boot_jar.id}"
  value        = "${var.spring_boot_jar_spring_redis_host_1}"
  name         = "spring.redis.host"
  type         = "String"
  is_sensitive = false
  depends_on   = []
}
