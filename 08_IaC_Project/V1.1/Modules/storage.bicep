targetScope = 'resourceGroup'

// general params
param environment string
param location string

//naming of the storage entities
@description('Name the storage acount with a unique name. As f.e. stg123xyz')
@minLength(3)
@maxLength(26)
param storage_name string = 'stg${uniqueString(resourceGroup().id)}'

resource storage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storage_name
  location: location
  tags: {
    environment: environment
    location: location
  }
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties:{
    accessTier: 'Hot'
    allowBlobPublicAccess: true
     publicNetworkAccess: 'Enabled'
     minimumTlsVersion: 'TLS1_2'
     networkAcls:{
      defaultAction: 'Allow'
      }
     encryption: {
     services:{
      blob:{
        enabled: true
      }
     }
     keySource:'Microsoft.Storage'
     }
     
  }
}

resource blobservice 'Microsoft.Storage/storageAccounts/blobServices@2022-09-01' = {
 parent: storage
  name: 'default'
   properties: {
     
   }
}

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-09-01' = {
  parent: blobservice
  name: 'containerpds'
   properties: {
    publicAccess:'Blob'
   }      
}
