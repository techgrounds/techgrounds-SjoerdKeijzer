targetScope = 'resourceGroup'
param location string = resourceGroup().location

@description('Naming of vnets, subnets and nsg')
// Naming of the vnets, subnets and nsg's
param name_vnet_webserver string = 'vnet_webserver'
param name_subnet_webserver string = 'subnet_webserver'
param name_nsg_webserver string = 'nsg_webserver'
param name_vnet_adminserver string = 'vnet_adminserver'
param name_subnet_adminserver string= 'subnet_adminserver'
param name_nsg_adminserver string = 'nsg_adminserver'

@description('webserver vnet, subnet and nsg details here')
// webserver vnet
resource vnet_webserver 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: name_vnet_webserver
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.10.10.0/24'
      ]}
      subnets: [
        { name: name_subnet_webserver
        properties: {
          addressPrefix: '10.10.10.0/24' // moeten subnets niet /32 zijn? andere keer nakijken
          networkSecurityGroup: {
            id: resourceId('Microsoft.Network/networkSecurityGroups', name_nsg_webserver)
          }
        }
      }
      ]
  }
}

@description('adminserver vnet, subnet and nsg details here')
// webserver vnet
resource vnet_adminserver 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: name_vnet_adminserver
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.20.20.0/24'
      ]}
      subnets: [
        { name: name_subnet_adminserver
        properties: {
          addressPrefix: '10.20.20.0/24' // moeten subnets niet /32 zijn? andere keer nakijken
          networkSecurityGroup: {
            id: resourceId('Microsoft.Network/networkSecurityGroups@2022-11-01', name_nsg_adminserver)
          }
        }}
      ]
  }
}
