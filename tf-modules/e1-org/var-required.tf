variable "github_token" {
  description = "GitHub personal access token with org:admin, repo scope"
  type        = string
  sensitive   = true
}

variable "github_org" {
  description = "GitHub organization name"
  type        = string
}