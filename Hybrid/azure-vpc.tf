# Define the Virtual Network (VPC)
resource "azurerm_virtual_network" "myVnet" {
  name                = "myVnet"
  address_space       = ["10.0.0.0/16"]
  location            = "${data.azurerm_resource_group.resource_group.location}"
  resource_group_name = "${data.azurerm_resource_group.resource_group.name}"

  tags {
        environment = "Terraform Demo"
    }
}


# Define Subnets
resource "azurerm_subnet" "myVnetSubnet" {
  name                 = "sub"
  resource_group_name  = "${data.azurerm_resource_group.resource_group.name}"
  virtual_network_name = "${azurerm_virtual_network.myVnet.name}"
  address_prefix       = "10.0.2.0/24"
}

# Create public IPs
resource "azurerm_public_ip" "publicip" {
    name                         = "JenkinsPublicIP"
    location                     = "${data.azurerm_resource_group.resource_group.location}"
    resource_group_name          = "${data.azurerm_resource_group.resource_group.name}"
    public_ip_address_allocation = "dynamic"
    
    tags {
        environment = "Terraform Demo"
    }
}

# Define Network Interface for assigning public IP
resource "azurerm_network_interface" "network_interface" {
  name                = "acctni"
  location            = "${data.azurerm_resource_group.resource_group.location}"
  resource_group_name = "${data.azurerm_resource_group.resource_group.name}"

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = "${azurerm_subnet.myVnetSubnet.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${azurerm_public_ip.publicip.id}"
  }
}