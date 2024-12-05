terraform {

  required_providers {
    octopusdeploy = { source = "OctopusDeployLabs/octopusdeploy", version = "0.30.7" }
    shell         = { source = "scottwinkler/shell", version = "1.7.10" }
    external      = { source = "hashicorp/external", version = "2.3.3" }
  }
  required_version = ">= 1.6.0"
}
