
resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'testtostistorage'
  location: 'uksouth'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
  }
  