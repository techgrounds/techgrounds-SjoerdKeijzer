targetScope = 'subscription'

@description('Make general resource group for deployment in certain region')
// Make a general resource group for deployment in a region
param resourceGroupName string = 'rootrg'
param location string = deployment().location // locate resources at location declared with the deployment command
resource rootgroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

@description('Deploy storage account module') // works just fine
// Deploy storage account module
module stg 'Modules/storage.bicep' = {
name: 'storagedeployment'
scope: rootgroup
params: {
  location: location
}
}

 @description('Deploy network module') // works fine
// Deploy network module
// Ideally I want different resource groups for each vnet, but for easy testing purposes let's deploy everything in the main root resource group
module network 'Modules/network._test.bicep' = {
  name: 'networkdeployment'
  scope: rootgroup
  params: {
    location: location
  }
}

@description('Deploys admin server module')
// Deploy admin module
module adminserver 'Modules/adminserver.bicep' = {
  scope: rootgroup
  name: 'adminserver_deployment'
  params: {
    admin_password: 'testing'
    location: location
    nicid: network.outputs.nic_id_adminserver
  }
}

@description('Deploy webserver module')
// Deploy webserver module
module webserver 'Modules/webserver.bicep' = {
  scope: rootgroup
  name: 'webserver_deployment'
  params: {
    location: location
    nicid: network.outputs.nic_id_webserver
  }
}
