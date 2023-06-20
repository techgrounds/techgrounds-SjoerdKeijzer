
@description('set resources in same region as the target resource group')
param location string


@description('Input linked outputs from networking module.')
// input linked outputs from networking module. Outputs are defined in adminserver module in main.bicep
param nicid string


/////////////////
// disk encryption

// adminserver specifics
@description('The name of your Virtual Machine.')
param vm_name_adminserver string = 'winadminserver'
param vm_size string = 'Standard_D2ds_v4' // /!\ this needs adjusting as I keep getting errors // Standard_D2ps_v5 ? // 'Standard_B1s' // 'Standard_D2ds_v4'
param vm_sku string = '2022-datacenter-azure-edition-core' // 2022-datacenter-core-smalldisk-g2 as alternative

// @allowed([
//   'password'
//   //'sshkey'          // need to read how to config ssh acces proper 
// ])
// //param authentication string = 'password'

@description('Username and pw settings for the Virtual Machine.')
param admin_username string = 'sjoerdvm'
@secure()
@minLength(6)
param admin_password string = 'PasswordMustBeSafeOk!'       // later in keyvault zetten en reference maken

resource vm_adminserver 'Microsoft.Compute/virtualMachines@2022-03-01' = {
  name: vm_name_adminserver
  location: location
  properties: {
    hardwareProfile: {
      vmSize: vm_size
    }
    osProfile: {
      computerName: vm_name_adminserver
      adminUsername: admin_username
      adminPassword: admin_password
      windowsConfiguration: {
        enableAutomaticUpdates: true          // automatic updates yes, but could be unscheduled maintenance time
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
          storageAccountType: 'StandardSSD_LRS'
        }
      }
      dataDisks: [
        {
          diskSizeGB: 512
          lun: 0
          createOption: 'Empty'
        }
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

////////////////////////
// possible outputs
// vm_admin
// vm_login
// 
