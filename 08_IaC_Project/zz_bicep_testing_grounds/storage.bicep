targetScope = 'resourceGroup'

param managed_identity_name string
param keyVaultName string
param key_name string
param environment string

//naming of the storage entities
@description('Name the storage acount with a unique name. As f.e. storage123xyz')
@minLength(3)
@maxLength(26)
param storageName string = 'storage${uniqueString(resourceGroup().id)}' // note that if the target resource group also has a long name, you may opt for 'stg${uniqueString(resourceGroup().id)}'
param blob_name string = 'blob-${environment}${storageName}'
param container_name string = 'container-${environment}'

@description('Place storage account in same region as resource group')
param location string

resource keyvault_resource 'Microsoft.KeyVault/vaults@2021-11-01-preview' existing = {
  name: keyVaultName
}

resource managed_identity 'Microsoft.ManagedIdentity/userAssignedIdentities@2018-11-30' existing = {
  name: managed_identity_name
}

@description('storage account properties')
// storage account properties
resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageName
  location: location
  tags: {
    environment: environment
  }
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  identity: {
    type: 'SystemAssigned'        
    userAssignedIdentities: managed_identity
  }
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
    publicNetworkAccess: 'Disabled'
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: true             
    encryption: {
      keySource: 'Microsoft.Keyvault'
      keyvaultproperties: {
        keyvaulturi: keyvault_resource.properties.vaultUri
        keyname: key_name
      }
    }
    networkAcls: {
      defaultAction: 'Deny'
      bypass: 'AzureServices'
    }
    }
  }

resource blob 'Microsoft.Storage/storageAccounts/blobServices@2022-09-01' = {
  name: blob_name
  parent: storageAccount
  properties: {
    isVersioningEnabled: false
  }

}

  resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-09-01' = {
    name: container_name
    parent: blob
    properties: {
      publicAccess: 'None'
    }
  }
