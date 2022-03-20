data "aws_ssm_parameter" "github_oauth_token" {
  name = "/github/oauth_token"
}

module "ecs_release_pipeline" {
  source = "cloudposse/ecs-codepipeline/aws"
  version = "0.28.5"

  name                        = var.name
  namespace                   = null
  stage                       = var.env
  github_oauth_token          = data.aws_ssm_parameter.github_oauth_token.value
  github_webhooks_token       = data.aws_ssm_parameter.github_oauth_token.value
  repo_owner                  = var.repo_owner
  repo_name                   = var.repo_name
  branch                      = var.branch
  image_repo_name             = var.image_repo_name
  service_name                = var.service_name
  ecs_cluster_name            = var.ecs_cluster_name
  region                      = var.region
  privileged_mode             = "true"
  github_webhook_events       = ["push"]
  environment_variables = [
    {
      name: "CONTAINER_NAME"
      value: "time-off"
      type: "PLAINTEXT"
    }
  ]
}

resource "aws_ecr_repository_policy" "default" {
  repository = var.image_repo_name

  policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
      {
        "Sid": "AllowPushPull",
        "Effect": "Allow",
        "Principal": {
          "AWS": ["arn:aws:iam::${var.account_id}:role/dev-time-off-build"]
        },
        "Action": [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:GetDownloadUrlForLayer",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ]
      }
    ]
}
EOF
}