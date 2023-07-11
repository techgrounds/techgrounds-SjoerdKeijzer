targetScope = 'subscription'

@description('Param for different environments. Dev(elopment) and prod(uction) are allowed')
@allowed([
  'dev'
  'prod'
])
param environment string = 'dev'


@description('Make general resource group for deployment in certain region')
// Make a general resource group for deployment in a region
param resourceGroupName string = 'rootrg'
param location string = deployment().location // locate resources at location declared with the deployment command
resource rootgroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
}

 @description('Deploy network module') // works fine
// Deploy network module
module network 'Modules/network._test.bicep' = {
  name: 'networkdeployment'
  scope: rootgroup
  params: {
    location: location
    environment: environment
  }
}

@description('Deploy keyvault and encryption module')   // deploys with encrypted diskset - need to fix passwords at other time
// Deploy Keyvault & encryption module
module keyvault 'Modules/keyvault.bicep' = {
  scope: rootgroup
  name: 'keyvault_deployment'
  params: {
    location: location
    environment: environment
  }
}

// @description('Deploys admin server module') // succesfull rdp login
// // Deploy admin server module
// module adminserver 'Modules/adminserver.bicep' = {
//   name: 'adminserver_deployment'
//   scope: rootgroup
//   params: {
//     location: location
//     environment: environment
//     nicid: network.outputs.nic_id_adminserver
//     diskencryption: keyvault.outputs.diskencryptset_id
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
    dependsOn: [network]
  }


// @description('Deploy storage account module')
// // Deploy storage account module
// module stg 'Modules/storage_test.bicep' = {
// name: 'storagedeployment'
// scope: rootgroup
// params: {
//   location: location
//   environment: environment
//   managed_identity_name: keyvault.outputs.managed_id_name
//   keyVaultName: keyvault.outputs.key_vault_name
//   key_name: keyvault.outputs.kv_key_name
//   }
//   dependsOn: [keyvault]
// }

//  @description('Deploy vmss module')
//  // Deply vmss with application gateway module
//  module vmss 'Modules/vmss_gateway.bicep' = {
//   scope: rootgroup
//   name: 'vmss_agw_deployment'
//   params: {
//     location: location
//     environment: environment
//     name_vnet_webserver: network.outputs.vnet_name_webserver
//     name_ntw_interface: network.outputs.ntw_interface_web_name
//     diskencryption: keyvault.outputs.diskencryptset_id
//     subnet_id_backend: network.outputs.subnet_id_backend
//     nsg_backend: network.outputs.nsg_id_backend
//     nsg_frontend: network.outputs.nsg_id_frontend
//     agw_pub_ip: network.outputs.pub_ip_agw
//     agw_subnet: network.outputs.subnet_id_frontend
//   }
//   dependsOn: [
//     network
//   ]
//  }

 @description('Deploy vmss module')
 // Deply vmss with application gateway module
 module vmss 'Modules/z_vmss_gateway.bicep' = {
  scope: rootgroup
  name: 'z_vmss_agw_deployment'
  params: {
    location: location
    diskencryptionId: keyvault.outputs.diskencryptset_id
    AGWPipId: network.outputs.pub_ip_agw
    AGWSubnetId: network.outputs.subnet_id_frontend
    vmssSubnetId: network.outputs.subnet_id_backend
  }
  dependsOn: [
    network
  ]
 }


@description('Deploy Back-up and recovery module')
// Deploy AZ back-up and recovery vault
module backup_recovery 'Modules/backup_recovery.bicep' = {
  name: 'backup_recovery_deployment'
  scope: rootgroup
}

// @description('Deply database module')
// // Deploy mySQL database attached to webserver as back-end db
// module database 'Modules/database.bicep' = {
//   name: 'database_deployment'
//   scope: rootgroup
//   params: {
//     // db_admin_username: sqladmin // keyvault.getSecret(db_adminuser.name)    // wip
//     // mysqlPassword: mysqlPassword // keyvault.getSecret(secret.name)              // wip
//     environment: environment
//     location: location
//   }
// }
