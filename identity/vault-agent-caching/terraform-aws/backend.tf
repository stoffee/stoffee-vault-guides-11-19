terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "cdunlap"

    workspaces {
      name = "aws-vault-agent-cache"
    }
  }
}
