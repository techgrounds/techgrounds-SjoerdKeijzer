// General imported params
param location string
param environment string

// VMSS specifics
param diskencryption string
param name_vmss string = 'vmss_webserver'
param vm_size string = 'Standard_B1s'
param vm_sku string = '20_04-lts'
param name_vm string = '${environment}-web-vm'

// import the outputs from network module
param name_vnet_webserver string
param subnet_id_backend string
param nsg_backend string
param name_ntw_interface string = 'network_interface'

// Gateway specifics
param app_gateway_name string = '${environment}-agw'
param agw_subnet string
param agw_pub_ip string

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

resource network_interface 'Microsoft.Network/networkInterfaces@2022-11-01' existing = {
  name: name_ntw_interface
}

@description('VMSS settings to follow')
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
                  applicationGatewayBackendAddressPools: [
                    {
                      id: app_gateway.properties.backendAddressPools[0].id // resourceId('Microsoft.Network/applicationGateways/backendAddressPools', app_gateway_name, 'backend_pool')
                    }
                  ]
                }  
              }
              ] 
            }
          }
        ]
      } 
    }
    orchestrationMode: 'Flexible'                         // 'Flexible' or 'Uniform'
    // scaleInPolicy: {
    //   rules: [
    //   ]
    // }
    // overprovision: false                                    // when set to true I got deployment errors
    singlePlacementGroup: true
    platformFaultDomainCount: 1
  }
}


////////////////////////////////////////////////////////////////////////////////////////
// Gateway 
//

resource app_gateway 'Microsoft.Network/applicationGateways@2022-11-01' = {
  name: app_gateway_name
  location: location
  properties: {
    autoscaleConfiguration: {
      minCapacity: 1
      maxCapacity: 2
    }
    backendAddressPools: [
      {
        name: 'backend_pool'
        // properties: 
      }
    ]
    enableHttp2: false
    gatewayIPConfigurations: [
      {
        name: 'AGW_ipconfig'
        properties: {
          subnet: {
            id: agw_subnet                  // get subnet id from networking module
          }
        }
      }
    ]
    frontendIPConfigurations: [
      {
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: agw_pub_ip                  // public IP for gateway here
          }
        }
      }
    ]
    frontendPorts: [
      {
        name: 'https'
        properties: {
          port: 443
        }
      }
      { name: 'http'
      properties: {
        port: 80
      }
      }
    ]
    sku: {
      name: 'Standard_v2'
      tier: 'Standard_v2'          // 'Standard_v2'
    }
    // sslCertificates:
    probes: [
      {
        properties: {
          timeout: 60
          unhealthyThreshold: 60
          interval: 55
        }
      }
    ]
    // sslPolicy:
    // sslProfiles:
    // webApplicationFirewallConfiguration:
    // redirectConfigurations:                              // need to write rule here for http > https
  }
}


output name_agw string = app_gateway_name
output name_vmss string = name_vmss
