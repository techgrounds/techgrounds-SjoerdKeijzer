targetScope = 'subscription'

@description('Make general resource group for deployment in certain region')
// Make a general resource group for deployment in Uksouth region
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

 @description('Deploy network module')
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
    adminPassword: 'testing'
    location: location
    vnetplacement: network.outputs.vnet_id_adminserver
    nsgid: network.outputs.nsg_id_adminserver
    nicid: network.outputs.nic_id_adminserver
    pubip_admin: network.outputs.pub_ip_id_adminserver
  }
}
