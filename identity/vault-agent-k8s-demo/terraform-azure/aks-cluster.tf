#--------------------------------------
# Create an AKS cluster
#--------------------------------------
resource "random_pet" "vault" {
# Declare variabls
#--------------------------------------
variable "prefix" {
  default = "demo"
}

variable "client_id" {
  default = "vault-agent-demo"
}

variable "client_secret" {
  description = "Client secret to use"
}

variable "subscription_id" {
  description = "The Azure subscription ID"
}

variable "tenant_id" {
  description = "The Azure tenant ID"
}

#--------------------------------------
# Create an AKS cluster
#--------------------------------------
provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id = "${var.client_id}"
  client_secret = "${var.client_secret}"
  tenant_id = "${var.tenant_id}"
>>>>>>> c4eb8b752e574521b7b3ba25893acef23bdd2fe4
}

resource "random_id" "vault" {
  byte_length = 4
}

resource "azurerm_resource_group" "default" {
  name     = "${var.prefix}-${random_id.vault.hex}-rg"
  location = "West US 2"

<<<<<<< HEAD
#  tags {
#    environment = "cd-Demo"
#  }
=======
 # tags {
 #   environment = "Demo"
 # }
>>>>>>> c4eb8b752e574521b7b3ba25893acef23bdd2fe4
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = "${var.prefix}-${random_id.vault.hex}-aks"
  location            = "${azurerm_resource_group.default.location}"
  resource_group_name = "${azurerm_resource_group.default.name}"
  dns_prefix          = "${var.prefix}-${random_id.vault.hex}-k8s"

  agent_pool_profile {
    name            = "default"
    count           = 2
    vm_size         = "Standard_D2_v2"
    os_type         = "Linux"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }

  role_based_access_control {
    enabled = true
  }

#  tags {
#    environment = "cd-Demo"
#  }
  #tags {
  #  environment = "Demo"
  #}

  provisioner "local-exec" {
    # Load credentials to local environment so subsequent kubectl commands can be run
    command = <<EOS
      az aks get-credentials --resource-group ${azurerm_resource_group.default.name} --name ${self.name};
    EOS
  }
}

output "resource_group_name" {
  value = "${azurerm_resource_group.default.name}"
}

output "kubernetes_cluster_name" {
  value = "${azurerm_kubernetes_cluster.default.name}"
}
