resource "azurerm_resource_group" "myrg-01" {
  name     = "myrg-01"
  location = "East Us"
}

resource "azurerm_resource_group" "myrg-02" {
  name     = "myrg-02"
  location = "West Us"
  provider = azurerm.provider2-azurm
}