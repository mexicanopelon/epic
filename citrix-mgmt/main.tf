resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name = "${var.resource_group_name}"

  tags = {
    Department = var.department
    Project = var.project
    Owner = var.owner
    Environment = var.env
    Release = var.release
  }
}
