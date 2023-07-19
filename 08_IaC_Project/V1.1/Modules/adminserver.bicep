
@description('set resources in same region as the target resource group')
param location string
param environment string

// Imported params from other modules
param nicid string 
param diskencryption string

// adminserver specifics
@description('The name of your Virtual Machine. Windows computer name cannot be longer than 15 characters max. Trust me, I tried.')
@maxLength(15) 
param vm_name_adminserver string = 'winadminserver'
param vm_size string = 'Standard_B1s'
param vm_sku string = '2022-datacenter-azure-edition-core'

@description('Installs openSSH on adminserver, so you can connect via SSH protocol (key or password) with scale set instances')
var ssh_script = loadFileAsBase64('../scripts/sshinstallwin.ps1')        // installs openSSH server on adminserver to connect with scale set instances


@description('Username and pw settings for the Virtual Machine.')
param admin_username string = 'sjoerdvm'
@secure()
@minLength(6)
param admin_password string = 'PasswordMustBeSafeOk!'       

resource vm_adminserver 'Microsoft.Compute/virtualMachines@2022-03-01' = {
  name: vm_name_adminserver
  location: location
  tags: {
    environment: environment
    type: vm_name_adminserver
    location: location
  }
  properties: {
    userData: ssh_script
    hardwareProfile: {
      vmSize: vm_size
    }
    osProfile: {
      computerName: vm_name_adminserver
      adminUsername: admin_username
      adminPassword: admin_password
      windowsConfiguration: {
        enableAutomaticUpdates: false          // admin will use scheduled maintenance feature to apply (security) updates
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
          diskEncryptionSet: {                     
            id: diskencryption
          }
          storageAccountType: 'StandardSSD_LRS'
        }
      }
      dataDisks: [
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

output vm_name_adminserver string = vm_name_adminserver
