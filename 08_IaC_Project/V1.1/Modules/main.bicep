targetScope = 'subscription'

@description('Param for different environments. Dev(elopment) and prod(uction) are allowed.')
@allowed([
  'dev'
  'prod'
])
param environment string = 'prod'

@description('Password set for ssl cert, please see documentation.')
@secure()
param ssl_cert_password string

@description('Password param for adminserver, this is set at deployment.')
@secure()
param admin_password string

@description('Set password for webserver to login on vmss instances. The password is set at deployment.')
@secure()
param webadmin_password string 


@description('Make general resource group for deployment in certain region.')
// Make a general resource group for deployment in a region
param resourceGroupName string = 'rootrg25'
param location string = deployment().location                           // locate resources at location declared with the deployment command
resource rootgroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
}

 @description('Deploy network module')
// Deploy network module
module network 'V1.1/Modules/network.bicep' = {
  name: 'networkdeployment'
  scope: rootgroup
  params: {
    location: location
    environment: environment
  }
}

@description('Deploy keyvault and encryption module')
// Deploy Keyvault & encryption module
module keyvault 'V1.1/Modules/keyvault.bicep' = {
  scope: rootgroup
  name: 'keyvault_deployment'
  params: {
    location: location
    environment: environment
  }
}

@description('Deploys admin server module')
// Deploy admin server module
module adminserver 'V1.1/Modules/adminserver.bicep'  = {
  name: 'adminserver_deployment'
  scope: rootgroup
  params: {
    location: location
    environment: environment
    admin_password: admin_password
    nicid: network.outputs.nic_id_adminserver
    diskencryption: keyvault.outputs.diskencryptset_id
  }
}

@description('Deploy network peering module')
// Deploy network peering module
module peering 'V1.1/Modules/peering.bicep' = {
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


@description('Deploy storage account module')
// Deploy storage account module
module stg 'V1.1/Modules/storage_test.bicep' = {
name: 'storagedeployment'
scope: rootgroup
params: {
  location: location
  environment: environment
  }
}

@description('Deploys application gateway and webserver with scale set')
 // deploys application gateway and webserver with scale set
 module gateway_vmss 'V1.1/Modules/gateway.bicep' = {
  scope: rootgroup
  name: 'gateway_vmss'
  params: {
    location: location
    environment: environment
    name_vnet_webserver: network.outputs.vnet_name_webserver
    diskencryption: keyvault.outputs.diskencryptset_id
    nsg_backend: network.outputs.nsg_id_backend
    agw_pub_ip: network.outputs.pub_ip_agw
    ssl_cert_password: ssl_cert_password
    webadmin_password: webadmin_password
  }
  dependsOn: [
    network
  ]
 }

// @description('Deploy Back-up and recovery module')
// // Deploy AZ back-up and recovery vault
// module backup_recovery 'V1.1/Modules/backup_recovery.bicep' = {
//   name: 'backup_recovery_deployment'
//   scope: rootgroup
//   params: {
//     location: location
//     environment: environment
//     vm_name_adminserver: adminserver.outputs.vm_name_adminserver
//   }
// }

