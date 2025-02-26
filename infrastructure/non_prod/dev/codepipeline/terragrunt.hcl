include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules//codepipeline"
}
locals {
  env = "dev"
}

inputs = {
  name                        = "time-off"
  stage                       = local.env
  repo_owner                  = "mbaquer6"
  repo_name                   = "timeoff-management-application"
  branch                      = "feature/deactivate_autoreg"
  image_repo_name             = "time-off"
  service_name                = "dev-time-off-service"
  ecs_cluster_name            = "dev-time-off"
  region                      = "us-east-1"
  privileged_mode             = "true"
  github_webhook_events       = ["release"]
  webhook_filter_json_path    = "$.action"
  webhook_filter_match_equals = "published"
  
  tags = {
    Environment   = local.env
    ProvisionedBy = "Terraform"
  }
}
