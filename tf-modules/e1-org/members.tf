resource "github_team_membership" "dreamteam_members" {
  team_id  = github_team.dreamteam.id
  username = "denisitpro"
  role     = "member"
}