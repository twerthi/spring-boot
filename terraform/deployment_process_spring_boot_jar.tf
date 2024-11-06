variable "project_spring_boot_jar_step_deploy_java_archive_packageid" {
  type        = string
  nullable    = false
  sensitive   = false
  description = "The package ID for the package named  from step Deploy Java Archive in project Spring-boot-jar"
  default     = "logging-log4j2"
}
resource "octopusdeploy_deployment_process" "deployment_process_spring_boot_jar" {
  project_id = "${octopusdeploy_project.project_spring_boot_jar.id}"

  step {
    condition           = "Success"
    name                = "Deploy Java Archive"
    package_requirement = "LetOctopusDecide"
    start_trigger       = "StartAfterPrevious"

    action {
      action_type                        = "Octopus.JavaArchive"
      name                               = "Deploy Java Archive"
      condition                          = "Success"
      run_on_server                      = true
      is_disabled                        = false
      can_be_used_for_project_versioning = true
      is_required                        = false
      properties                         = {
        "Octopus.Action.Package.DownloadOnTentacle" = "False"
        "Octopus.Action.Package.JsonConfigurationVariablesTargets" = "BOOT-INF/classes/log4j2.xml\nBOOT-INF/classes/application.properties\nBOOT-INF/classes/db.properties"
        "Octopus.Action.Package.UseCustomInstallationDirectory" = "False"
        "Octopus.Action.Package.CustomInstallationDirectoryShouldBePurgedBeforeDeployment" = "False"
        "Octopus.Action.Package.CustomPackageFileName" = "#{Octopus.Action.Package.PackageId}.jar"
        "Octopus.Action.JavaArchive.DeployExploded" = "False"
        "Octopus.Action.Package.JavaArchiveCompression" = "False"
      }
      environments                       = []
      excluded_environments              = []
      channels                           = []
      tenant_tags                        = []

      primary_package {
        package_id           = "${var.project_spring_boot_jar_step_deploy_java_archive_packageid}"
        acquisition_location = "Server"
        feed_id              = "feeds-builtin"
        properties           = { SelectionMode = "immediate" }
      }

      features = ["Octopus.Features.JsonConfigurationVariables"]
    }

    properties   = {}
    target_roles = ["Jar-Example"]
  }
  step {
    condition           = "Success"
    name                = "Execute jar"
    package_requirement = "LetOctopusDecide"
    start_trigger       = "StartAfterPrevious"

    action {
      action_type                        = "Octopus.Script"
      name                               = "Execute jar"
      condition                          = "Success"
      run_on_server                      = false
      is_disabled                        = false
      can_be_used_for_project_versioning = false
      is_required                        = false
      properties                         = {
        "Octopus.Action.GitRepository.Source" = "External"
        "Octopus.Action.Script.ScriptFileName" = "scripts/run-jar.sh"
        "Octopus.Action.RunOnServer" = "false"
        "Octopus.Action.Script.ScriptSource" = "GitRepository"
      }
      environments                       = []
      excluded_environments              = []
      channels                           = []
      tenant_tags                        = []
      features                           = []

      git_dependency {
        repository_uri      = "https://github.com/twerthi/spring-boot.git"
        default_branch      = "main"
        git_credential_type = "Library"
        git_credential_id   = "${octopusdeploy_git_credential.gitcredential_github.id}"
      }
    }

    properties   = {}
    target_roles = ["Jar-Example"]
  }
  depends_on = []
}
