targetScope = 'resourceGroup'

// general params
param environment string
param location string

//naming of the storage entities
@description('Name the storage acount with a unique name. As f.e. stg123xyz')
@minLength(3)
@maxLength(26)
param storage_name string = 'stg${uniqueString(resourceGroup().id)}'
param blob_name string = 'blob-${storage_name}'
param container_name string = 'container-${environment}'


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

  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
    publicNetworkAccess: 'Disabled'
    minimumTlsVersion: 'TLS1_2'
  }
}

resource blob 'Microsoft.Storage/storageAccounts/blobServices@2022-09-01' = {
  name: blob_name
  parent: storage_account
  properties: {
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
