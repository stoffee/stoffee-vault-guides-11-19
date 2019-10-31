variable "public_key" {
  default = ""
}

variable "vm_name" {
  default = "azure-auth-demo-vm"
}

variable "vault_download_url" {
  default = "https://releases.hashicorp.com/vault/0.10.1/vault_0.10.1_linux_amd64.zip"
}

variable "resource_group_name" {
  default = "vault-demo-azure-auth"
}

variable "client_id" {
  default = "blarg"
}

variable "client_secret" {
  description = "Client secret to use"
}

variable "subscription_id" {
  description = "Client secret to use"
}

variable "tenant_id" {
  description = "Client secret to use"
}
