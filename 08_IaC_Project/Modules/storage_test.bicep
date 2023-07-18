targetScope = 'resourceGroup'

// general params
param environment string
param location string

// imports from other modules
param managed_identity_name string
param keyVaultName string
param key_name string

//naming of the storage entities
@description('Name the storage acount with a unique name. As f.e. storage123xyz')
@minLength(3)
@maxLength(26)
param storage_name string = 'stg${uniqueString(resourceGroup().id)}'
param blob_name string = 'blob-${environment}${storage_name}'
param container_name string = 'container-${environment}'


resource keyvault_resource 'Microsoft.KeyVault/vaults@2021-11-01-preview' existing = {
  name: keyVaultName
}

resource managed_identity 'Microsoft.ManagedIdentity/userAssignedIdentities@2018-11-30' existing = {
  name: managed_identity_name
}

@description('storage account properties')
// storage account properties
resource storage_account 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storage_name
  location: location
  tags: {
    environment: environment
    location: location
    id: 'storage account'
  }
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  // identity: {
  //   type:  'UserAssigned'               // system assigned
  //   userAssignedIdentities: managed_identity.id // grrr        
    // userAssignedIdentities: {
    //   '${managed_identity.i}': {}
    // }
  // }
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
    publicNetworkAccess: 'Disabled'
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: true              // maybe switch back to false if I can't set the right permissions in 1.0
    allowSharedKeyAccess: true
    allowCrossTenantReplication: false
    defaultToOAuthAuthentication: false
    encryption: {
      requireInfrastructureEncryption: false
      // keySource: 'Microsoft.Keyvault'
      // keyvaultproperties: {
      //   keyvaulturi: keyvault_resource.properties.vaultUri
      //   keyname: key_name
      // }
      // identity: {
      //   userAssignedIdentity: managed_identity.properties.principalId    // had eerst managed_identity.id
      // }
      // services: {
      //   blob: {
      //     enabled: true
      //   }
      //   table: {
      //     enabled: true
      //   }
      //   file: {
      //     enabled: true
      //   }
      //   queue: {
      //     enabled: true
      //   }
      // }
    }
    networkAcls: {
      defaultAction: 'Allow'
      bypass: 'AzureServices'
    }
    isSftpEnabled: false
    immutableStorageWithVersioning: {
      enabled: false
    }
  }
}

resource blob 'Microsoft.Storage/storageAccounts/blobServices@2022-09-01' = {
  name: blob_name
  parent: storage_account
  properties: {
    isVersioningEnabled: false
    automaticSnapshotPolicyEnabled: false
    lastAccessTimeTrackingPolicy: {
      enable: true
    }
    restorePolicy: {
      enabled: false
    }
    deleteRetentionPolicy: {
      enabled: true
      days: 7
    }
    containerDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-09-01' = {
  name: container_name
  parent: blob
  properties: {
    publicAccess: 'None'
    immutableStorageWithVersioning: {
      enabled: false
    }
    denyEncryptionScopeOverride: false
  }
}
