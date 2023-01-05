
output "AWS_public_ip" {
  value = module.aws_grafana.public_e2c_ip
}
output "Azure_public_ip" {
  value = module.azure_grafana.public_azure_ip
}