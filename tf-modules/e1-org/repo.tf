resource "github_repository" "dreamteam" {
  name        = "dream-repo"
  description = "Terraform-managed repo"
  visibility  = "public"

  delete_branch_on_merge = true

  security_and_analysis {

    # 422 Advanced security is always available for public repos
    # advanced_security {
    #   status = "enabled"
    # }
    secret_scanning {
      status = "enabled"
    }

    secret_scanning_push_protection {
      status = "enabled"
    }
  }
}