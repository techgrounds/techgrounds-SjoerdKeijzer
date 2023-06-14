targetScope = 'resourceGroup'

param storageName string = 'storage_${uniqueString(resourceGroup().id)}'

// place storage account in same region as resource group
param location string = resourceGroup().location

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
