resource "azurerm_resource_group" "grafana_rg" {
  location = var.resource_group_location
  name     = var.resource_group_name
}

resource "azurerm_virtual_network" "grafana_vnet" {
  name                = "grafanaVnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.grafana_rg.location
  resource_group_name = azurerm_resource_group.grafana_rg.name
}

resource "azurerm_subnet" "grafana_subnet" {
  name                 = "grafanaSubnet"
  resource_group_name  = azurerm_resource_group.grafana_rg.name
  virtual_network_name = azurerm_virtual_network.grafana_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "public_ip" {
  name                = "Grafana_ip"
  location            = azurerm_resource_group.grafana_rg.location
  resource_group_name = azurerm_resource_group.grafana_rg.name
  allocation_method   = "Static"
}


resource "azurerm_network_interface" "grafana_nic" {
  name                = "Grafana_Network_Interface"
  location            = azurerm_resource_group.grafana_rg.location
  resource_group_name = azurerm_resource_group.grafana_rg.name

  ip_configuration {
    name                          = "myNicConfiguration"
    subnet_id                     = azurerm_subnet.grafana_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_linux_virtual_machine" "grafana_vm" {
  name                  = "grafana-vm"
  location              = azurerm_resource_group.grafana_rg.location
  resource_group_name   = azurerm_resource_group.grafana_rg.name
  network_interface_ids = [azurerm_network_interface.grafana_nic.id]
  user_data             = filebase64("./install-script.sh")
  size                  = "Standard_B1s"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name                   = "myvm"
  admin_username                  = "azureuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

}

