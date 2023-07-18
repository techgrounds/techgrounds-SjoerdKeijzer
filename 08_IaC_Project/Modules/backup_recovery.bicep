// general params
param environment string
param location string

// import adminserver name
param vm_name_adminserver string

@description('The name of the Recovery Services Vault')
param recovery_vault_name string = '${environment}-recoveryvault-${uniqueString(resourceGroup().id)}'

var backupFabric = 'Azure'
var protectionContainer = 'iaasvmcontainer;iaasvmcontainerv2;${resourceGroup().name};${vm_name_adminserver}'
var protectedItem = 'vm;iaasvmcontainerv2;${resourceGroup().name};${vm_name_adminserver}'

resource vm_adminserver 'Microsoft.Compute/virtualMachines@2022-03-01' existing =  {
  name: vm_name_adminserver
}

resource recovery_vault_resource 'Microsoft.RecoveryServices/vaults@2023-01-01' = {
  name: recovery_vault_name
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  tags: {
    location: location
    environment: environment
  }
  sku: {
    name: 'RS0'
    tier: 'Standard'
  }
  properties: {
    monitoringSettings: {
      azureMonitorAlertSettings: {
        alertsForAllJobFailures: 'Enabled'   
      }
      classicAlertSettings: {
        alertsForCriticalOperations: 'Enabled'
      }
    }
    publicNetworkAccess: 'Disabled'
  }
  dependsOn: [
    vm_adminserver
  ]
}

// Backup policy for adminserver
resource adminserver_backup 'Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems@2023-02-01' = {
  name: '${recovery_vault_name}/${backupFabric}/${protectionContainer}/${protectedItem}'
  location: location
  properties: {
    protectedItemType: 'Microsoft.Compute/virtualMachines'
    policyId: '${recovery_vault_resource.id}/backupPolicies/DefaultPolicy'
    sourceResourceId: vm_adminserver.id
  }
  dependsOn: [
    vm_adminserver
  ]
}
