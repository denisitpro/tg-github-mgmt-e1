# Setting Up a Terragrunt Repository

## Support russian mirror terraform modules
```bash
mkdir -p ~/.terraform.d
cat > ~/.terraform.d/cli.tfrc.json <<EOF
{
  "provider_installation": {
    "network_mirror": [
      {
        "url": "https://tf-proxy.selectel.ru/mirror/v1/",
        "include": ["registry.terraform.io/*/*"]
      }
    ],
    "direct": [
      {
        "exclude": ["registry.terraform.io/*/*"]
      }
    ]
  }
}
EOF
```

## (Optional) Creating an AWS Profile
This section is optional and applies only if you use AWS as your backend or provider.

To configure AWS credentials, update the following files:

### Configure `~/.aws/config`
```ini
[default]  # or another profile name used by your setup
region = eu-central-1
```

### Configure `~/.aws/credentials`
```ini
[c1_example_s3_rw]
aws_access_key_id = YOUR_PROFILE_ACCESS_KEY
aws_secret_access_key = YOUR_PROFILE_SECRET_KEY
```

If you're using a specific profile with Terragrunt, don't forget to export it:

```bash
export AWS_PROFILE=c1_example_s3_rw
```

## Launching Terragrunt
Initialize Terragrunt:

```bash
source secret.env
terragrunt init
terragrunt plan
```

This will initialize and plan your infrastructure using Terragrunt.


## GitHub Organization Setup

Terraform **cannot create GitHub Organizations** — they must be created manually by an authorized GitHub user. To manage organization resources (teams, repos, etc.) via Terraform or Terragrunt:

### 1. Create the Organization

Manually create the GitHub Organization through the GitHub Web UI:  
https://github.com/account/organizations/new

You may need to use a paid GitHub plan to access organization-level features.

### 2. Generate a GitHub Token

Create a Personal Access Token (classic) or fine-grained token:

- Go to https://github.com/settings/tokens
- Click "Generate new token"
- For **classic token**, enable at least the following scopes:
  - `admin:org`
  - `repo`
  - `read:org`
  - `delete_repo`
- Need testing: For **fine-grained token**, grant access to:  
  - Your organization
  - Repositories and organization administration

Export the token as an environment variable:

```bash
export GITHUB_TOKEN=ghp_XXXXXXXXXXXXXXXXXXXX
```

In Terraform/Terragrunt, configure the GitHub provider using this token:

```hcl
provider "github" {
  token = var.github_token
  owner = var.github_org
}
```

