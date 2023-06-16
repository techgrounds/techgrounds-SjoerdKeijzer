targetScope = 'resourceGroup'

@description('Place all resources in the same region of target resourcegroup, declared in main.bicep')
param location string = resourceGroup().location

@description('Naming of vnets, subnets and nsg')
// Naming of the vnets, subnets and nsg's
param name_vnet_webserver string = 'vnet_webserver'
param name_subnet_webserver string = 'subnet_webserver'
param name_nsg_webserver string = 'nsg_webserver'
param name_vnet_adminserver string = 'vnet_adminserver'
param name_subnet_adminserver string= 'subnet_adminserver'
param name_nsg_adminserver string = 'nsg_adminserver'

@description('Naming of network components; nics and public IP')
param name_nic_vnet_webserver string = 'nic_${name_vnet_webserver}'
param name_nic_vnet_adminserver string = 'nic_${name_vnet_adminserver}'
param name_pubip_webserver string = '${name_vnet_webserver}-publicIP'
param name_pubip_adminserver string = '${name_vnet_adminserver}-publicIP'


@description('All webserver infra to follow below. Order is vnet with nested subnet -> public IP -> nics -> NSG')
// webserver vnet
resource vnet_webserver 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: name_vnet_webserver
  location: location
  tags: {
    project: 'IaC'
    vnet: name_vnet_webserver
    location: location
  }
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.10.10.0/24'
      ]}
      subnets: [
        { 
          name: name_subnet_webserver
        properties: {
          addressPrefix: '10.10.10.0/24' // subnet(s) address here
          networkSecurityGroup: nsg_webserver
          }
        }
      
      ]
  }
}

resource pub_ip_webserver 'Microsoft.Network/publicIPAddresses@2021-02-01' = {
  name: name_pubip_webserver
  location: location
  properties: {
    publicIPAllocationMethod: 'Dynamic'
  }
}

resource nic_webserver 'Microsoft.Network/networkInterfaces@2022-11-01' = {
  name: name_nic_vnet_webserver
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig_webserver'
        properties: {
          subnet: {
            id: vnet_webserver.properties.subnets[0].id
          }
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: pub_ip_webserver.id
          }
        }
      }
    ]
  }
}


resource nsg_webserver 'Microsoft.Network/networkSecurityGroups@2022-11-01' = {
  name: name_nsg_webserver
  location: location
  properties: {
    securityRules: [
      { name: 'https'
        properties: {
          access: 'Allow' 
          direction: 'Inbound' 
          priority: 100
          protocol: 'Tcp'
          sourcePortRange: '*'
          sourceAddressPrefix: '*'
          destinationPortRange: '443'
          destinationAddressPrefix: '*'
        }}
    ]
  }
}



@description('adminserver vnet, subnet and nsg details here')
// webserver vnet
resource vnet_adminserver 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: name_vnet_adminserver
  location: location
  tags: {
    project: 'IaC'
    vnet: name_vnet_adminserver
    location:location
  }
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.20.20.0/24'
      ]}
      subnets: [
        { 
          name: name_subnet_adminserver
        properties: {
          addressPrefix: '10.20.20.0/25' // subnet(s) address here
          networkSecurityGroup: nsg_adminserver
          }
        }
      ]
  }
}
resource nsg_adminserver 'Microsoft.Network/networkSecurityGroups@2022-11-01' = {
  name: name_nsg_adminserver
  location: location
  properties: {
    securityRules: [
      {
        name: 'ssh'
        properties: {
          access: 'Allow'
          direction: 'Inbound'
          priority: 100
          protocol: 'Tcp'
          sourcePortRange: '*'
          sourceAddressPrefix: '*'
          destinationPortRange: '22'
          destinationAddressPrefix: '*'
        }
      }
    ]
  }
}