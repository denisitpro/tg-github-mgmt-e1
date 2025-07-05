resource "github_team_repository" "example" {
  team_id    = github_team.dreamteam.id
  repository = github_repository.dreamteam.name
  permission = "push"
}