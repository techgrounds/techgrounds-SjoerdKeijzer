@description('Place keyvault in default region of target resourcegroup declared in main.bicep')
param location string

@description('Outputs from stg module')
// import storage module outputs that might be required for disk encryption sets
param storageAccount string
param storageName string


// To do any operations with Key Vault, you first need to authenticate to it.
// managed / assigned identity ??

// Azure Key Vault enforces Transport Layer Security (TLS) protocol to protect data when it’s traveling between Azure Key vault and clients

// keyvault resource
// assigned identity resource
// keyvault key (resource?) 
// disk encryption sets
// az policy add voor toevoegen van secrets oid
// admin pw moet gestored kunnen worden (via az policy add?)
// back-up encryptie / secret? 

@description('Specifies the name of the key vault.')
param keyVaultName string = 'keyvault' // unique id? 

@description('Specifies the Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. Get it by using Get-AzSubscription cmdlet.')
param tenantId string = subscription().tenantId
// param tenantId string = '7810209c-8fef-48a1-8881-d6946b6a7633'

@description('Specifies the object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies. Get it by using Get-AzADUser or Get-AzADServicePrincipal cmdlets.')
param objectId string = ''

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

@description('Specifies whether the key vault is a standard vault or a premium vault.')
@allowed([
  'standard'
  'premium'
])
param skuName string = 'standard'

resource keyvault_resource 'Microsoft.KeyVault/vaults@2021-11-01-preview' = {
  name: keyVaultName
  location: location
  properties: {
    enabledForDeployment: true            // Specifies whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault
    enabledForDiskEncryption: true        // Specifies whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys
    enabledForTemplateDeployment: true    // Specifies whether Azure Resource Manager is permitted to retrieve secrets from the key vault
    tenantId: tenantId
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
    accessPolicies: [
      {
        objectId: objectId
        tenantId: tenantId
        permissions: {
          keys: keysPermissions
          secrets: secretsPermissions
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
    
    keySize: ''         // ????
    kty: 'RSA'
  }
}
/////////
// possible outputs

// assigned user to storage module for least privilege principle
// diskencryption id to storage module
// perhaps some keyvault properties to stg module to link encryption or safeguard storage
// 

output key_vault_resource_id string = keyvault_resource.id
output key_vault_url string = keyvault_resource.properties.vaultUri
output kv_key_name string = kv_key_resource.name
