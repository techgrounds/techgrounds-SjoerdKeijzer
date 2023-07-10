param location string
param environment string
param name_vnet_webserver string
param diskencryption string
param subnet_id_backend string
param nsg_backend string

// VMSS specifics
param name_vmss string = 'vmss_webserver'
param vm_size string = 'Standard_B1s'
param vm_sku string = '20_04-lts'
param name_vm string = '${environment}-web-vm'

//interface
param name_ntw_interface string = 'network_interface'

// installs apache on each scaling instance
var apache_script = loadFileAsBase64('bashscript/web_installscript.sh')

//login webserver
param webadmin_username string = 'vmsjoerd'
@secure()
@minLength(6)
param webadmin_password string = 'PasswordMustBeSafeOk!'                        // later in keyvault zetten

resource vnet_webserver 'Microsoft.Network/virtualNetworks@2022-11-01' existing = {
  name: name_vnet_webserver
}

resource network_interface 'Microsoft.Network/networkInterfaces@2022-11-01' = {
  name: name_ntw_interface
  location: location
  tags: {
    location: location
    vnet: name_vnet_webserver
    id: 'ntw_interface'
  }
  properties: {
    networkSecurityGroup: {
      id: nsg_backend
    }
    enableAcceleratedNetworking: false
    enableIPForwarding: false
    nicType: 'Standard'
    ipConfigurations: [
      {
        name: 'ntw_interface_config'
        properties: {
          subnet: {
            id: subnet_id_backend
          }
          // applicationGatewayBackendAddressPools:
          // applicationSecurityGroups: 
          privateIPAllocationMethod: 'Dynamic'
          // publicIPAddress:
          // privateIPAddress:
          primary: null
        }
      }
    ]
  }
}

resource vmss 'Microsoft.Compute/virtualMachineScaleSets@2021-11-01' = {
  name: name_vmss
  location: location
  tags: {
    vnet: name_vnet_webserver
    location: location
    id: 'vm scale set'
    project: 'IaC'
  }
  sku: {
    tier: 'Standard'
    name: vm_size
    capacity: 1
  }
  properties: {
    automaticRepairsPolicy: {
      enabled: true
    }
    upgradePolicy: {
      mode: 'Rolling'                                // can be set to 'Automatic', 'Rolling' and 'Manual'
      rollingUpgradePolicy: {
        prioritizeUnhealthyInstances: true
      }
    }
    additionalCapabilities: {
      hibernationEnabled: false
      ultraSSDEnabled: false
    }
    virtualMachineProfile: {
      userData: apache_script
      storageProfile: {
        imageReference: {
          offer: '0001-com-ubuntu-server-focal'
          version: 'latest'
          publisher: 'canonical'
          sku: vm_sku
        }
        osDisk: {
          caching: 'ReadWrite'
          createOption: 'FromImage'
          osType: 'Linux'
          managedDisk: {
            storageAccountType: 'StandardSSD_LRS'
            diskEncryptionSet: {
              id: diskencryption
            }
          }
        }
      }
      osProfile: {
        computerNamePrefix: name_vm
        adminUsername: webadmin_username
        adminPassword: webadmin_password
        linuxConfiguration: {
          disablePasswordAuthentication: false
          provisionVMAgent: false                               // or true
        }
      }
      networkProfile: {
        networkApiVersion: '2020-11-01'
        networkInterfaceConfigurations: [
          {
            // id: network_interface.id
            name: '${environment}-VMSS-interface'
            properties: {
              enableAcceleratedNetworking: false
              primary: true
              ipConfigurations: [
                {
                name: '${environment}-VMSS-IPconfig'
                properties: {
                  subnet: {
                    id: subnet_id_backend
                  }
                  // applicationGatewayBackendAddressPools: [
                  //   {
                  //     id: resourceId('Microsoft.Network/applicationGateways/backendAddressPools', applicationGateWayName, 'myBackendPool')
                  //   }
                  // ]
                }  
              }
              ] 
            }
          }
        ]
      } 
    }
    orchestrationMode: 'Flexible'
    // scaleInPolicy: {
    //   rules: [
    //   ]
    // }
    // overprovision: false                                    // when set to true I got deployment errors
    singlePlacementGroup: true
    platformFaultDomainCount: 1
  }
}

output name_vmss string = name_vmss
