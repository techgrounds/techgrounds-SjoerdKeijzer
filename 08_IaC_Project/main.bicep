targetScope = 'subscription'


// Make resource group for deployment in Uksouth region
param resourceGroupName string = 'biceptest-rg-01'
param resourceGroupLocation string = 'uksouth'
resource azrg01 'Microsoft.Resources/resourceGroups@2021-04-01'= {
  name: resourceGroupName
  location: resourceGroupLocation
}

// place any resource in the region/location of the resourcegroup
// param location string = resourceGroup().location

// Deploy storage account module
// module stg 'Modules/storage.bicep' = {
//  scope: // ? staat al in stg module though
//  name: stgname
// }
