data "terraform_remote_state" "citrix-mgmt" {
  backend = "azurerm"

  config = {
    storage_account_name="cdelapaztfc21345"
    resource_group_name="cdelapaz-tfc-21345"
    container_name="terraform-state"
    key = "epicenv:citrix-mgmt"
  }
}

data "azurerm_resource_group" "rg" {
  name = data.terraform_remote_state.citrix-mgmt.outputs.resource_group_name
}

# Create virtual network
resource "azurerm_virtual_network" "my_terraform_network" {
  name                = "${var.username}_${var.env}_Vnet"
  address_space       = ["10.0.0.0/16"]
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  tags = {
    Department = var.department
    Project = var.project
    Owner = var.owner
    Environment = var.env
    Release = var.release
  }

  lifecycle {
    ignore_changes = [
      tags["CreatedBy"],
      tags["CreatedOn"],
      tags["Exempted"],
      tags["ExpiryDate"]
    ] 
  }
  
}