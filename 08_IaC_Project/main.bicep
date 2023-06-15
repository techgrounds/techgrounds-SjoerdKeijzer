targetScope = 'subscription'


// Make a general resource group for deployment in Uksouth region
param resourceGroupName string = 'root_resource_group'
param location string = 'uksouth'
resource rootgroup 'Microsoft.Resources/resourceGroups@2021-04-01'= {
  name: resourceGroupName
  location: location
}

// place any resource in the region/location of the resourcegroup
// param location string = resourceGroup().location

// Deploy storage account module
module stg 'Modules/storage.bicep' = {
name: 'stgname'
scope: rootgroup
 }

// Deploy network module
// Ideally I want different resource groups for each vnet, but for testing purposes let's deploy everything in the main root resource group
module network 'Modules/network.bicep' = {
  name: 'networkdeployment'
  scope: rootgroup
  params: {
    location: location
  }
}
