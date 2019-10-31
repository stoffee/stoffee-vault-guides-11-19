terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "cdunlap"

    workspaces {
      name = "gcp-vault-agent-k8s"
    }
  }
}
