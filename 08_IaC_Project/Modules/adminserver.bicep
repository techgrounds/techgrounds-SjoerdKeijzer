
@description('set resources in same region as the target resource group')
param location string

param environment string

@description('Input linked outputs from networking module.')
// input linked outputs from networking module. Outputs are defined in adminserver module in main.bicep
param nicid string

// param diskencryption string

// adminserver specifics
@description('The name of your Virtual Machine. Windows computer name cannot be longer than 15 characters max. Trust me, I tried.')
@maxLength(15) 
param vm_name_adminserver string = 'winadminserver'
param vm_size string = 'Standard_B1s'
// param vm_size string = environment == 'dev' ? 'Standard_B1s' : 'Standard_D2ds_v4' // set b1s as dev and d2ds_V4 as prod standard || pos sizes test 'Standard_D2ps_v5' // 'Standard_B1s' // 'Standard_D2ds_v4'
param vm_sku string = '2022-datacenter-azure-edition-core' // 2022-datacenter-core-smalldisk-g2 als alternative


@description('Username and pw settings for the Virtual Machine.')
param admin_username string = 'sjoerdvm'
@secure()
@minLength(6)
param admin_password string = 'PasswordMustBeSafeOk!'       // later in keyvault als secret zetten en reference maken

resource vm_adminserver 'Microsoft.Compute/virtualMachines@2022-03-01' = {
  name: vm_name_adminserver
  location: location
  tags: {
    environment: environment
    type: vm_name_adminserver
    location: location
  }
  properties: {
    hardwareProfile: {
      vmSize: vm_size
    }
    osProfile: {
      computerName: vm_name_adminserver
      adminUsername: admin_username
      adminPassword: admin_password
      windowsConfiguration: {
        enableAutomaticUpdates: false          // admin will use scheduled maintance feature to apply (security) updates
        provisionVMAgent: true
      }
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: vm_sku
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          // diskEncryptionSet: {                     enable when keyvault deploys proper
          //   id: diskencryption
          // }
          storageAccountType: 'StandardSSD_LRS'
        }
      }
      dataDisks: [
        // {
        //   diskSizeGB: 512
        //   lun: 0
        //   createOption: 'Empty'
        // }
      ]
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nicid
          properties: {
            deleteOption: 'Detach'
                   }
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: false
      }
    }
  }
}


