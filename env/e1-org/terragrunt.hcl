include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "${get_repo_root()}/tf-modules/e1-org"
}

inputs = {
  github_token = get_env("github_token")
  github_org = "e1-demo"
  repo_root = get_repo_root()
}