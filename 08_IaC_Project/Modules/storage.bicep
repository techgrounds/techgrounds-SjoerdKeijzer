targetScope = 'resourceGroup'

@description('Name the storage acount with a unique name.')
@minLength(3)
@maxLength(24)
param storageName string = 'storage_${uniqueString(resourceGroup().id)}'

// place storage account in same region as resource group
param location string = resourceGroup().location

@description('storage account properties')
// storage account properties
resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
  }
