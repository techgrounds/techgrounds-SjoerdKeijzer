@description('set resources in same region as the target resource group')
param location string


@description('Input linked outputs from networking module.')
// input linked outputs from networking module. Outputs are defined in webserver module in main.bicep
param nicid string


@description('Name and specs of webserver.')
// Name and specs of webserver
param vm_name_webserver string = 'linuxwebserver'
param vm_size string = 'Standard_B1s'
param vm_sku string = '20_04-lts'

//login webserver
param webadmin_username string = 'vmsjoerd'
@secure()
@minLength(6)
param webadmin_password string = 'PasswordMustBeSafeOk!'

// var apache_script = loadFileAsBase64 // Path iets hier zoals (./web_installscript.sh)         // apache user data to get onto webserver


resource webvm 'Microsoft.Compute/virtualMachines@2022-03-01' = {
  name: vm_name_webserver
  location: location
  properties: {
    // userData: apache_script
    hardwareProfile: {
      vmSize: vm_size
    }
    storageProfile: {
      imageReference: {
        publisher: 'canonical'
        offer: '0001-com-ubuntu-server-focal'
        sku: vm_sku
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
      }
    }
    osProfile: {
      computerName: vm_name_webserver
      adminUsername: webadmin_username
      adminPassword: webadmin_password
    }
    networkProfile:  {
      networkInterfaces: [
        {
          id: nicid
          properties: {
            deleteOption: 'Detach'
            primary: true
          }
        }
      ]
    }
  }
}
