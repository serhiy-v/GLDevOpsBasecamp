output "public_azure_ip" {
  value = azurerm_public_ip.public_ip.ip_address
}