variable "resource_group_name" {
  description = "Resource Group Name for Grafana web server"
  type = string
  default = "grafana_rg"
}

variable "resource_group_location" {   
    description = "LOcation for Resource Group"
    type = string
    default = "East US"
}
