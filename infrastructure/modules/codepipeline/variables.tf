variable "role_arn" {
  description = "The ARN of the role to assume"
  type        = string
  default     = null
}

variable "session_name" {
  description = "The name of the session to create"
  type        = string
  default     = null
}

variable "region" {
  description = "The region to connect to"
  type        = string
  default     = "us-east-1"
}

variable "account_id" {
  description = "The account ID to connect to"
  type        = string
  default     = ""
}

variable "env" {
  description = "The environment to deploy to"
  type        = string
  default     = "dev"
}

variable "name" {
  description = "The name of the stack to deploy"
  type        = string
  default     = "app"
}

variable "repo_owner" {
  description = "The owner of the repo to deploy"
  type        = string
  default     = "james-d-turner"
}

variable "branch" {
  description = "The branch to deploy"
  type        = string
  default     = "master"
}

variable "service_name" {
  description = "The name of the service to deploy"
  type        = string
  default     = "app"
}

variable "ecs_cluster_name" {
  description = "The name of the ECS cluster to deploy to"
  type        = string
  default     = "app"
}

variable "github_webhook_events" {
  description = "The events to enable for the webhook"
  type        = string
  default     = "push"
}

variable "webhook_filter_json_path" {
  description = "The JSON path to filter on"
  type        = string
  default     = "$.action"
}

variable "webhook_filter_match_equals" {
  description = "The value to match"
  type        = string
  default     = "published"
}
