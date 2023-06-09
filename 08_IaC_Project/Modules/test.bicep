resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
name: 'test_tosti_name_for_deployment'
location:'uksouth'
sku: {
  name: 'Standard_LRS'
}
kind: 'StorageV2'
properties: {
  accessTier: 'Hot'
}
}
