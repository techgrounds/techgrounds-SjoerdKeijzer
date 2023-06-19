
@description('set resources in same region as the target resource group')
param location string


@description('Input linked outputs from networking module.')
//////////////////
// input linked outputs from networking module. Outputs are defined in adminserver module in main.bicep
param vnetplacement string
param nsgid string
param nicid string

/////////////////
// disk encryption

// adminserver specifics
@description('The name of your Virtual Machine.')
param vm_name_adminserver string = 'windows_adminserver'

@allowed()
// param of var
param vm_specs string =

@allowed([
  'password'
  //'sshkey'          // need to read how to config ssh acces proper 
])
param authentication string = 'password'

@description('Username and pw settings for the Virtual Machine.')
param adminUsername string = 'sjoerdvm'
@secure()
@minLength(6)
param adminpassword string

resource vm_adminserver 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: vm_name_adminserver
  location: location
  properties: {
    hardwareProfile: {
      vmSize: vm_specs
    }
  }
}

////////////////////////
// possible outputs
// vm_admin
// vm_login
// 
