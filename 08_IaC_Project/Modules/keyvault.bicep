@description('Place keyvault in default region of target resourcegroup declared in main.bicep')
param location string

param environment string

@description('Outputs from stg module')
// import storage module outputs that might be required for disk encryption sets
param storageAccount string
param storageName string


// N2K: Azure Key Vault enforces Transport Layer Security (TLS) protocol to protect data when it’s traveling between Azure Key vault and clients

// assigned identity resource
// az policy add voor toevoegen van secrets oid
// admin pw moet gestored kunnen worden (via az policy add?)
// back-up encryptie / secret? 


@description('The name of the User Assigned Identity.')
param user_assigned_identity_name string= 'userid${uniqueString(resourceGroup().name)}' 

@description('Name of the key in the Key Vault')
param kv_key_name string = 'key${uniqueString(resourceGroup().name)}' 

@description('Specifies the name of the key vault.')
param keyVaultName string = 'keyvault${environment}-${uniqueString(resourceGroup().id)}'

@description('Specifies the Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. Get it by using Get-AzSubscription cmdlet.')
param tenantId string = subscription().tenantId
// param tenantId string = '7810209c-8fef-48a1-8881-d6946b6a7633'

@description('Specifies the permissions to keys in the vault. Valid values are: all, encrypt, decrypt, wrapKey, unwrapKey, sign, verify, get, list, create, update, import, delete, backup, restore, recover, and purge.')
param keysPermissions array = [
  'wrapKey'
  'unwrapKey'
  'get'
  'encrypt'
  'decrypt'
  'sign'
  'verify'
  'list'
]

@description('Specifies the permissions to secrets in the vault. Valid values are: all, get, list, set, delete, backup, restore, recover, and purge.')
param secretsPermissions array = [
  'list'
  'get'
  'recover'
  'restore'
]

@description('Specifices the permissions to certificates in the vault.')
param certificatesPermissions array = [
  'list'
  'get'
  'set'
]

@description('Specifies whether the key vault is a standard vault or a premium vault.')
@allowed([
  'standard'
  'premium'
])
param skuName string = 'standard'

resource user_assigned_identity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: user_assigned_identity_name
  location: location
}

resource keyvault_resource 'Microsoft.KeyVault/vaults@2021-11-01-preview' = {
  name: keyVaultName
  location: location
  properties: {
    enabledForDeployment: true            // Specifies whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault
    enabledForDiskEncryption: true        // Specifies whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys
    enabledForTemplateDeployment: true    // Specifies whether Azure Resource Manager is permitted to retrieve secrets from the key vault. Must enable this for IaC projects upon deployment for keyvault to work. 
    tenantId: tenantId
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
    accessPolicies: [
      {
        objectId: user_assigned_identity.properties.principalId
        tenantId: tenantId
        permissions: {
          keys: keysPermissions
          secrets: secretsPermissions
          certificates: certificatesPermissions
        }
      }
    ]
    sku: {
      name: skuName
      family: 'A'
    }
    networkAcls: {
      defaultAction: 'Allow'
      bypass: 'AzureServices'
    }
  }
}

resource kv_key_resource 'Microsoft.KeyVault/vaults/keys@2023-02-01' = {
  name: kv_key_name
  parent: keyvault_resource
  properties: {
    attributes: {
      enabled: true
    }
     keySize: 2048              // Other possible values are 3072 or 4096
    kty: 'RSA'
  }
}

resource disk_encryption 'Microsoft.Compute/diskEncryptionSets@2022-07-02' = {
  name: 'disk_encryption_sets'
  location: location
  properties: {
    // encryptionType:                            // ???????
    rotationToLatestKeyVersionEnabled: true
  }
}

@description('Outputs to other modules that need reference to Keyvault or encryption')
// Outputs to other modules that need reference to Keyvault or encryption
output key_vault_resource_id string = keyvault_resource.id
output key_vault_url string = keyvault_resource.properties.vaultUri
output kv_key_name string = kv_key_resource.name
output managed_id string = user_assigned_identity.id
output diskencrypset string = disk_encryption.id
