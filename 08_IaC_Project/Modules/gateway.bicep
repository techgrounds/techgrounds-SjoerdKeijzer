
// import the regular params from main
param location string
param environment string

// import needed outputs from other modules
param name_vnet_webserver string
param agw_subnet string
param subnet_id_backend string
param agw_pub_ip string
param nsg_backend string

param app_gateway_name string = 'app_gateway'

resource vnet_webserver 'Microsoft.Network/virtualNetworks@2022-11-01' existing = {
  name: name_vnet_webserver
}

resource app_gateway 'Microsoft.Network/applicationGateways@2022-11-01' = {
  name: app_gateway_name
  location: location
  properties: {
    sku: {
      name: 'Standard_v2'
      tier: 'Standard_v2'          // standard v2
      capacity: 1
    }
    backendAddressPools: [
      {
      name: 'backend_pool'
      properties: {}
    }
    ]
    forceFirewallPolicyAssociation: false
    enableHttp2: false
    gatewayIPConfigurations: [
      {
        name: 'AGW_ipconfig'
        properties: {
          subnet: {
            id: vnet_webserver.properties.subnets[1].id                 // agw_subnet  
          }
        }
      }
    ]
    frontendIPConfigurations: [
      {
        name: 'FrontendIPconfig'
        properties: {
          publicIPAddress: {
            id: agw_pub_ip                  // public IP for gateway here
          }
        }
      }
    ]
    frontendPorts: [
      {
        name: 'port_https'
        properties: {
          port: 443
        }
      }
      { name: 'port_http'
      properties: {
        port: 80
      }
      }
    ]
    backendHttpSettingsCollection: [
        {
          name: 'BackendHttpSettings'
          properties: {
            port: 80
            protocol: 'Http'
            cookieBasedAffinity: 'Disabled'
            requestTimeout: 20
          }
        }
    ]
      httpListeners: [
        {
          name: 'HttpListener'
          properties: {
            frontendIPConfiguration: {
              id: resourceId('Microsoft.Network/applicationGateways/frontendIPConfigurations', app_gateway_name, 'FrontendIPconfig')
            }
            frontendPort: {
              id: resourceId('Microsoft.Network/applicationGateways/frontendPorts', app_gateway_name, 'port_http')
            }
            protocol: 'Http'
            requireServerNameIndication: false
          }
        }
      ]
      requestRoutingRules: [
        {
          name: 'GatewayReqRule'
          properties: {
            priority: 1
            ruleType: 'Basic'
            httpListener: {
              id: resourceId('Microsoft.Network/applicationGateways/httpListeners', app_gateway_name, 'HttpListener')
            }
            backendAddressPool: {
              id: resourceId('Microsoft.Network/applicationGateways/backendAddressPools', app_gateway_name, 'backend_pool')
            }
            backendHttpSettings: {
              id: resourceId('Microsoft.Network/applicationGateways/backendHttpSettingsCollection', app_gateway_name, 'BackendHttpSettings')
            }
          }
        }
      ]
    // sslCertificates:
    // probes:
    // sslPolicy:
    // sslProfiles:
    // webApplicationFirewallConfiguration:
    // redirectConfigurations:                              // need to write rule here for http > https
  }
}

/////////////////////////////// 
// VMSS

// VMSS specifics
param diskencryption string
param name_vmss string = 'vmss_webserver'
param vm_size string = 'Standard_B1s'
param vm_sku string = '20_04-lts'
param name_vm string = '${environment}-web-vm'

// installs apache on each scaling instance
var apache_script = loadFileAsBase64('bashscript/web_installscript.sh')

//login webserver
param webadmin_username string = 'vmsjoerd'
@secure()
@minLength(6)
param webadmin_password string = 'PasswordMustBeSafeOk!'                        // later in keyvault zetten

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
    singlePlacementGroup: true
    platformFaultDomainCount: 1
    overprovision: true
    automaticRepairsPolicy: {
      enabled: true
    }
    upgradePolicy: {
      mode: 'Rolling'
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
        // networkApiVersion: '2020-11-01'
        networkInterfaceConfigurations: [
          {
            name: '${environment}-VMSS-interface'
            properties: {
              networkSecurityGroup: {
                id: nsg_backend
              }
              enableAcceleratedNetworking: false
              enableIPForwarding: false
              primary: true
              ipConfigurations: [
                {
                name: '${environment}-VMSS-IPconfig'
                properties: {
                  privateIPAddressVersion: 'IPv4'
                  subnet: {
                    id: vnet_webserver.properties.subnets[0].id                                                       // backend subnet
                  }
                  applicationGatewayBackendAddressPools: [
                    {
                      id: app_gateway.properties.backendAddressPools[0].id                                             // resourceId('Microsoft.Network/applicationGateways/backendAddressPools', app_gateway_name, 'backend_pool')
                    }
                  ]
                }  
              }
              ] 
            }
          }
        ]
      }
      extensionProfile: {
        extensions: [
          {
            name: '${environment}-healthname'
            properties: {
              enableAutomaticUpgrade: false
              autoUpgradeMinorVersion: false
              publisher: 'Microsoft.ManagedServices'
              type: 'ApplicationHealthLinux'
              typeHandlerVersion: '1.0'
              settings: {
                port: 80
                protocol: 'http'
                requestPath: ''
              }
            }
          }
        ]
      } 
    }
    // orchestrationMode: 'Flexible'                         // 'Flexible' or 'Uniform'
  }
}



