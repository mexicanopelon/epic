data "azurerm_resource_group" "rg" {
  name = "${var.resource_group_name}"
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
}