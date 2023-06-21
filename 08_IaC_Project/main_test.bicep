targetScope = 'subscription'

@description('Make general resource group for deployment in certain region')
// Make a general resource group for deployment in a region
param resourceGroupName string = 'rootrg'
param location string = deployment().location // locate resources at location declared with the deployment command
resource rootgroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
}

// 'Microsoft.Resources/resourceGroups@2021-04-01'


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

// @description('Deploys admin server module') // need to fix acces rules from nsg and login to vm
// // Deploy admin server module
// module adminserver 'Modules/adminserver.bicep' = {
//   scope: rootgroup
//   name: 'adminserver_deployment'
//   params: {
//     location: location
//     nicid: network.outputs.nic_id_adminserver
//   }
// }

// @description('Deploy webserver module') // need to fix acces/routing from internet via nsg / and login to vm + apache bootstrap
// // Deploy webserver module
// module webserver 'Modules/webserver.bicep' = {
//   scope: rootgroup
//   name: 'webserver_deployment'
//   params: {
//     location: location
//     nicid: network.outputs.nic_id_webserver
//   }
// }

@description('Deploy network peering module') // works fine
// Deploy network peering module
module peering 'Modules/peering.bicep' = {
  name: 'peering_deployment'
  scope: rootgroup
  params: {
    name_vnet_webserver: network.outputs.vnet_name_webserver
    name_vnet_adminserver: network.outputs.vnet_name_adminserver
    peer_web_vnet: network.outputs.vnet_id_webserver
    peer_admin_vnet: network.outputs.vnet_id_adminserver
    }
  }


// @description('Deploy keyvault and encryption module')   // work in progress
// // Deploy Keyvault & encryption module
// module keyvault 'Modules/keyvault.bicep' = {
//   scope: rootgroup
//   name: 'keyvault_deployment'
//   params: {
//     keyVaultName:  
//     location: location
//     objectId: 
//     secretName: 
//     secretValue:
//     secretsPermissions:
//     storageAccount: stg.outputs.stg_id
//     storageName: stg.outputs.stg_name 
//   }
// }

//  @description('Deploy vmss module')
//  // Deply vmss module
//  module vmss 'Modules/vmss.bicep' = {
//   scope: rootgroup
//   name: 'vmss_deployment'
//   params: {
//     location: location
//     name_vnet_webserver: network.outputs.vnet_name_webserver
//     id_vnet_webserver: network.outputs.vnet_id_webserver
//   }
//  }
