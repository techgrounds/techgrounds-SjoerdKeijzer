targetScope = 'resourceGroup'
param location string = resourceGroup().location

// Naming of the vnets, subnets and nsg's
param name_vnet_webserver string = 'vnet_webserver'
param name_subnet_webserver string = 'subnet_webserver'
param name_nsg_webserver string = 'nsg_webserver'
param name_vnet_adminserver string = 'vnet_adminserver'
param name_subnet_adminserver string= 'subnet_adminserver'
param name_nsg_adminserver string = 'nsg_adminserver'

// webserver vnet
resource vnet_webserver 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: name_vnet_webserver
  location: location
  tags: {
    vnet: 'vnet_webserver'
  }
  properties: {
    addressSpace: 
      {addressPrefixes: ['10.10.10.0/24']
    } 
  }
}
resource subnet_webserver 'Microsoft.Network/virtualNetworks/subnets@2022-11-01' = {
  name: name_subnet_webserver
  location: location
  tags: {
    vnet: 'vnet_webserver'
  } 
}

// adminserver vnet
resource vnet2 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: name_vnet_adminserver
  location: location
  tags: {
    vnet: 'vnet_adminserver'
  } 
}

resource subnet_adminserver 'Microsoft.Network/virtualNetworks/subnets@2022-11-01' = {
  name: name_subnet_adminserver
  location: location
}
