resource "octopusdeploy_git_credential" "gitcredential_github" {
  name     = "Github"
  type     = "UsernamePassword"
  username = "twerthi"
  password = "${var.gitcredential_github}"
}
variable "gitcredential_github" {
  type        = string
  nullable    = false
  sensitive   = true
  description = "The secret variable value associated with the git credential \"Github\""
}
