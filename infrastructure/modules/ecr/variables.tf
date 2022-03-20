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
  default     = "123456789012"
}

variable "name" {
  description = "The name of the ECR repository to create"
  type = string
  default = "my-repo"
}

variable "env_list" {
  description = "The list of environment variables to set"
  type = list
  default = ["dev", "qa"]
}

variable "tags" {
  description = "The tags to apply to the ECR repository"
  type = map(string)
  default = {}
}