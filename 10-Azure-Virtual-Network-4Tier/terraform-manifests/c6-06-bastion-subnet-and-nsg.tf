resource "azurerm_subnet" "bastion_subnet" {
  name                 = "${azurerm_virtual_network.vnet.name}-${var.bastion_subnet_name}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.bastion_subent_address
}

resource "azurerm_network_security_group" "bastion_subnet_nsg" {
  name                = "${azurerm_subnet.bastion_subnet.name}-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet_network_security_group_association" "bastion_nsg_association" {
  depends_on = [ azurerm_network_security_rule.bastion_nsg_rule_inbound ]  
  subnet_id                 = azurerm_subnet.bastion_subnet.id 
  network_security_group_id = azurerm_network_security_group.bastion_subnet_nsg.id    
}

locals {
  bastion_inbound_port_map = {
    "100" : "22"
    "110" : "3389"
  }
}

resource "azurerm_network_security_rule" "bastion_nsg_rule_inbound" {
  for_each =   local.app_inbound_port_map
  name                        = "Rule-Port${each.value}"
  priority                    = each.key
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.bastion_subnet_nsg.name   
  
}