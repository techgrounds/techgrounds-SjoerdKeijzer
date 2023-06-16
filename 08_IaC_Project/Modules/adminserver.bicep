
@description('set resources in same region as the target resource group')
param location string = resourceGroup().location


//////////////////
// input linked outputs from networking module

/////////////////
// disk encryption

// adminserver specifics
@description('The name of your Virtual Machine.')
param vm_name_adminserver string = 'linux_adminserver'

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



////////////////////////
// possible outputs
// vm_admin
// vm_login
// 
