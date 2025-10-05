resource "azurerm_virtual_network" "myvnet" {
  name                = "myvnet-01"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.myrg-01.location
  resource_group_name = azurerm_resource_group.myrg-01.name
  tags = {
    "stage" = "dev"
  }
}

resource "azurerm_subnet" "mysubnet" {
  name                 = "mysubnet-01"
  resource_group_name  = azurerm_resource_group.myrg-01.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "mypublic" {
  name                = "mypublic-01"
  resource_group_name = azurerm_resource_group.myrg-01.name
  location            = azurerm_resource_group.myrg-01.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "myvmnic" {
  name                = "vmnic"
  resource_group_name = azurerm_resource_group.myrg-01.name
  location            = azurerm_resource_group.myrg-01.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mypublic.id
  }

}
