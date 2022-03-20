include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules//ecr"
}

inputs = {
  name     = "time-off"
  env_list = ["dev", "qa"]
  tags     = {
    Environment = "non-prod"
  }
}
