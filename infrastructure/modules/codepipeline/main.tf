data "aws_ssm_parameter" "github_oauth_token" {
  name = "oauth_token"
}

data "aws_ssm_parameter" "github_webhooks_token" {
  name = "webhooks_token"
}

module "ecs_release_pipeline" {
  source = "cloudposse/ecs-codepipeline/aws"
  version = "0.28.5"

  name                        = var.name
  namespace                   = "eg"
  stage                       = var.env
  github_oauth_token          = data.aws_ssm_parameter.github_oauth_token.value
  github_webhooks_token       = data.aws_ssm_parameter.github_webhooks_token.value
  repo_owner                  = var.repo_owner
  repo_name                   = var.repo_name
  branch                      = var.branch
  image_repo_name             = var.image_repo_name
  service_name                = var.service_name
  ecs_cluster_name            = var.ecs_cluster_name
  region                      = var.region
  privileged_mode             = "true"
  github_webhook_events       = ["release"]
  webhook_filter_json_path    = "$.action"
  webhook_filter_match_equals = "published"
}