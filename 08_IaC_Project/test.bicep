

param location string = resourceGroup().location
param environment string = 'testomgeving'

// param vnet1 string = 'vnet_webserver'
// param vnet2 string - 'vnet_adminserver'
// nsg1 voor webserver vnet/subnet
// nsg2 voor adminserver vnet/subnet
// publicip voor webserver
// publicip voor adminserver
// nic voor webserver
// nic voor adminserver
// vnet peering


// netwerk gedeelte maken
// vnet 1 setup
resource vnet1 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: vnet_webserver
  location: location
  tags: {
    TagName1: 'vnet1'}
  properties: {
    addressSpace: 
      {addressPrefixes: ['10.10.10.0/24']
    } 
  }
}

// resource subnet 'Microsoft.Network/virtualNetworks/subnets@2022-11-01'

