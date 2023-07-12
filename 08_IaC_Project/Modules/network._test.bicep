targetScope = 'resourceGroup'

param environment string

@description('Place all resources in the same region of target resourcegroup, declared in main.bicep')
param location string

@description('Naming of vnets, subnets and nsg')
// Naming of the vnets, subnets and nsg's
param name_vnet_webserver string = '${environment}_vnet_webserver'
param name_subnet_backend string = 'subnet_backend'
param name_subnet_front_agw string = 'subnet_frontend_agw'
param name_nsg_frontend string = 'nsg_frontend'
param name_nsg_backend string = 'nsg_backend'
param name_vnet_adminserver string = '${environment}_vnet_adminserver'
param name_subnet_adminserver string= 'subnet_adminserver'
param name_nsg_adminserver string = 'nsg_adminserver'

@description('Naming of network components; nics and public IP')
// Naming of network components; nics and public IPs
param name_nic_vnet_adminserver string = 'nic_${name_vnet_adminserver}'
param name_pubip_adminserver string = '${name_vnet_adminserver}-publicIP'
param name_pubip_AGW string = 'AGW-pub-ip-address'
// param name_ntw_interface string = 'network_interface'


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
    enableDdosProtection: false
    addressSpace: {
      addressPrefixes: [
        '10.10.10.0/24'
      ]}
      subnets: [
        {
          name: name_subnet_front_agw
          properties: {
            addressPrefix: '10.10.10.128/25'                  // front end subnet
            networkSecurityGroup: {
              id: nsg_frontend.id
            }
          }
        }
        { 
          name: name_subnet_backend
        properties: {
          addressPrefix: '10.10.10.0/25'                  // back-end subnet
          networkSecurityGroup: {
            id: nsg_backend.id}
          }
        }
      ]
  }
}

resource pub_ip_agw 'Microsoft.Network/publicIPAddresses@2022-11-01' = {
  name: name_pubip_AGW
  location: location
  sku: {
    name: 'Standard'
  }
  tags: {
    vnet: name_vnet_webserver
    location: location
  }
  properties: {
    publicIPAllocationMethod: 'Static'
    publicIPAddressVersion: 'IPv4'
    idleTimeoutInMinutes: 4                       // must be between 4 and 30
    }
  }


  resource webServerPublicIP 'Microsoft.Network/publicIPAddresses@2022-11-01' = {
    name: 'webServerpublicIP'
    location: location
    sku: {
      name: 'Standard'
    }
    tags: {
      Location: location
    }
    properties: {
      publicIPAddressVersion: 'IPv4'
      publicIPAllocationMethod: 'Static'
      idleTimeoutInMinutes: 4
      dnsSettings: {
        domainNameLabel: 'webserverscaleset'
      }
    }
  }

  // resource network_interface 'Microsoft.Network/networkInterfaces@2022-11-01' = {
  //   name: name_ntw_interface
  //   location: location
  //   tags: {
  //     location: location
  //     vnet: name_vnet_webserver
  //     id: 'ntw_interface'
  //   }
  //   properties: {
  //     networkSecurityGroup: {
  //       id: nsg_backend.id
  //     }
  //     enableAcceleratedNetworking: false
  //     enableIPForwarding: false
  //     nicType: 'Standard'
  //     ipConfigurations: [
  //       {
  //         name: 'ntw_interface_config'
  //         properties: {
  //           subnet: {
  //             id: vnet_webserver.properties.subnets[0].id
  //           }
  //           privateIPAllocationMethod: 'Dynamic'
  //           primary: null
  //         }
  //       }
  //     ]
  //   }
  // }


// resource nic_webserver 'Microsoft.Network/networkInterfaces@2022-11-01' = {
//   name: name_nic_vnet_webserver
//   location: location
//   tags: {
//     vnet: name_vnet_webserver
//     location:location
//   }
//   properties: {
//     networkSecurityGroup: {
//       id: nsg_backend.id
//     }
//     ipConfigurations: [
//       {
//         name: 'ipconfig_webserver'
//         properties: {
//           subnet: {
//             id: vnet_webserver.properties.subnets[0].id
//           }
//           privateIPAllocationMethod: 'Dynamic'
//           publicIPAddress: {
//             id: pub_ip_webserver.id
//           }
//         }
//       }
//     ]
//   }
// }

resource nsg_frontend 'Microsoft.Network/networkSecurityGroups@2022-11-01' = {
  name: name_nsg_frontend
  location: location
  tags: {
    vnet: name_vnet_webserver
    location: location
  }
  properties: {
    securityRules: [
      { name: 'http'
      properties: {
        access: 'Allow'                       
        direction: 'Inbound'
        priority: 200
        protocol: 'Tcp'
        sourcePortRange: '*'
        sourceAddressPrefix: '*'
        destinationPortRange: '80'
        destinationAddressPrefix: '*'
      }
    }
    {
    name: 'GatewayManager'
        properties: {
          protocol: 'TCP'
          sourceAddressPrefix: 'GatewayManager'
          sourcePortRange: '*' 
          destinationAddressPrefix: '*' 
          destinationPortRange: '65200-65535'
          access: 'Allow'
          priority: 1100
          direction: 'Inbound'
        }
      }
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
        }
      } 
    ]
  }
}

resource nsg_backend 'Microsoft.Network/networkSecurityGroups@2022-11-01' = {
  name: name_nsg_backend
  location: location
  tags: {
    vnet: name_vnet_webserver
    location: location
  }
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
        }
      } 
      { name: 'http'
      properties: {
        access: 'Allow'                       // later op deny na ssl termination
        direction: 'Inbound'
        priority: 200
        protocol: 'Tcp'
        sourcePortRange: '*'
        sourceAddressPrefix: '*'
        destinationPortRange: '80'
        destinationAddressPrefix: '*'
        // destinationPortRanges: ['8080']          // 8080 port nodig ?
      }
    }
    { name: 'ssh'
    properties: {
      access: 'Allow'
      direction: 'Inbound'
      priority: 400
      protocol: 'Tcp'
      sourcePortRange: '*'                        
      sourceAddressPrefix: '*'                    // admin server of ip als je ssh forwarding doet
      destinationPortRange: '22'
      destinationAddressPrefix: '*'               // waarschijnlijk nog specifieker maken
    }
    }
    {
      name: 'GatewayManager'
          properties: {
            protocol: 'TCP'
            sourceAddressPrefix: 'GatewayManager'
            sourcePortRange: '*' 
            destinationAddressPrefix: '*' 
            destinationPortRange: '65200-65535'
            access: 'Allow'
            priority: 1100
            direction: 'Inbound'
          }
        }
    ]
  }
}

@description('All adminserver infra to follow below. Order is vnet with nested subnet -> public IP -> nics -> NSG')
// adminserver vnet
resource vnet_adminserver 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: name_vnet_adminserver
  location: location
  tags: {
    project: 'IaC'
    vnet: name_vnet_adminserver
    location:location
  }
  properties: {
  enableDdosProtection: false
    addressSpace: {
      addressPrefixes: [
        '10.20.20.0/24'
      ]}
      subnets: [
        { 
          name: name_subnet_adminserver
        properties: {
          addressPrefix: '10.20.20.0/24' // subnet(s) address here
          networkSecurityGroup: {
            id: nsg_adminserver.id}
          }
        }
      ]
  }
}

resource pub_ip_adminserver 'Microsoft.Network/publicIPAddresses@2021-02-01' = {
  name: name_pubip_adminserver
  location: location
  tags: {
    vnet: name_vnet_adminserver
    location: location
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

resource nic_adminserver 'Microsoft.Network/networkInterfaces@2022-11-01' = {
  name: name_nic_vnet_adminserver
  location: location
  tags: {
    vnet: name_vnet_adminserver
    location:location
  }
  properties: {
    networkSecurityGroup: {
      id: nsg_adminserver.id
    }
    ipConfigurations: [
      {
        name: 'ipconfig_adminserver'
        properties: {
          subnet: {
            id: vnet_adminserver.properties.subnets[0].id
          }
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: pub_ip_adminserver.id
          }
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
        name: 'admin_rdp'
        properties: {
          access: 'Allow'
          direction: 'Inbound'
          priority: 300
          protocol: 'Tcp'
          sourcePortRange: '*'
          sourceAddressPrefix: '77.175.148.54'            // allow admin IP('s)
          destinationPortRange: '3389'                    // allow RDP acces on the usual RDP port
          destinationAddressPrefix: '*'
        }
      }
    ]
  }
}

@description('Outputs to connect with other modules that need networking details')
// Outputs
output vnet_id_webserver string = vnet_webserver.id
output vnet_id_adminserver string = vnet_adminserver.id
output vnet_name_webserver string = name_vnet_webserver
output vnet_name_adminserver string = name_vnet_adminserver
output subnet_id_backend string = vnet_webserver.properties.subnets[0].id   
output subnet_id_frontend string = vnet_webserver.properties.subnets[1].id                
output subnet_id_adminserver string = vnet_adminserver.properties.subnets[0].id
output nsg_id_backend string = nsg_backend.id
output nsg_id_frontend string = nsg_frontend.id
output nsg_id_adminserver string = nsg_adminserver.id
output nic_id_adminserver string = nic_adminserver.id
// output ntw_interface_web_name string = name_ntw_interface
output pub_ip_id_adminserver string = pub_ip_adminserver.id
output pub_ip_agw string = pub_ip_agw.id



