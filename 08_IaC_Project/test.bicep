

param location string = resourceGroup().location
param testtostistorage string = 'deploy_storage_account${uniqueString(resourceGroup().id)}'
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


resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
name: testtostistorage
location:location
sku: {
  name: 'Standard_LRS'
}
kind: 'StorageV2'
properties: {
  accessTier: 'Hot'
}
}

// netwerk gedeelte maken
// vnet 1 setup
resource vnet1 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: condition ? TrueValue : FalseValue
  location: location
  tags: {
    project: 'vnet1'}
  properties: {
    addressSpace: 
      {addressPrefixes: ['10.0.0.0/24']
    } 
  }
}
resource subnet 'Microsoft.Network/virtualNetworks/subnets@2022-11-01' = {

}
