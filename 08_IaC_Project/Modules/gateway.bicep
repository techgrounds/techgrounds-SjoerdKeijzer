
// import the regular params from main
param location string
param environment string

// import needed outputs from other modules
param name_vnet_webserver string
param agw_pub_ip string
param nsg_backend string

// Certificate vars
param name_ssl_cert string = 'ssl_cert_gateway'
// var ssl_cert = {path to script} of loadasbasefile64
@secure()
param ssl_cert_password string = 'Yousslnotpass'

/////////////////////////////////////////
// Application Gateway 

@description('Application Gateway name')
param app_gateway_name string = 'app_gateway'

resource vnet_webserver 'Microsoft.Network/virtualNetworks@2022-11-01' existing = {
  name: name_vnet_webserver
}

resource app_gateway 'Microsoft.Network/applicationGateways@2022-11-01' = {
  name: app_gateway_name
  location: location
  tags: {
    location: location
    vnet: name_vnet_webserver
    id: app_gateway_name
  }
  properties: {
    sku: {
      name: 'Standard_v2'
      tier: 'Standard_v2'
      capacity: 1
    }
    // sslCertificates: [
    //   {
    //     name: name_ssl_cert
    //     properties: {
    //       keyVaultSecretId:
    //       data: ssl_cert
    //       password: ssl_cert_password
    //     }
    //   }
    // ]
    sslPolicy: {
      policyName: ''
      minProtocolVersion: 'TLSv1_2'
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
            id: vnet_webserver.properties.subnets[1].id         // frontend subnet
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
        // {
        //   name: 'HttpsListener'
        //   properties: {
        //     frontendIPConfiguration: { 
        //       id: resourceId('Microsoft.Network/applicationGateways/frontendIPConfigurations', app_gateway_name, 'FrontendIPconfig')
        //     }
        //     frontendPort: {
        //       id: resourceId('Microsoft.Network/applicationGateways/frontendPorts', app_gateway_name, 'port_https')
        //     }
        //     protocol: 'Https'
        //     requireServerNameIndication: false
        //     sslCertificate: {
        //       id: resourceId('Microsoft.Network/applicationGateways/sslCertificates', app_gateway_name, name_ssl_cert) 
        //     }
        //   }
        // }
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
    // probes: [
    //   {
    //     name: 'probe'
    //     properties: {
    //       unhealthyThreshold:
    //       timeout:
    //       minServers:
    //       match:
    //       interval:
    //       port:
    //       protocol:
    //     }
    //   }
    // ]
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
param name_autoscaling string = 'autoscale_resource'

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
          provisionVMAgent: false                               
        }
      }
      networkProfile: {
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
                    id: vnet_webserver.properties.subnets[0].id                                 // backend subnet
                  }
                  applicationGatewayBackendAddressPools: [
                    {
                      id: app_gateway.properties.backendAddressPools[0].id                    
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
              enableAutomaticUpgrade: true
              autoUpgradeMinorVersion: false
              publisher: 'Microsoft.ManagedServices'
              type: 'ApplicationHealthLinux'
              typeHandlerVersion: '1.0'
              settings: {
                port: 80
                protocol: 'Http'
                requestPath: ''
              }
            }
          }
        ]
      } 
    }
  }
}

resource autoscaling 'Microsoft.Insights/autoscalesettings@2022-10-01' = {
  name: name_autoscaling
  location: location
  properties: {
    enabled: true
    targetResourceUri: vmss.id
    profiles: [
      {
        name: 'autoscale_config'
        capacity: {
          default: '1'
          maximum: '3'
          minimum: '1'
        }
        rules: [
          {
            metricTrigger: {                                  // scale out rules
              metricName: 'Percentage CPU' 
              metricNamespace: ''
              metricResourceUri: vmss.id 
              operator: 'GreaterThan'
              statistic: 'Average' 
              threshold: 75 
              timeAggregation: 'Average' 
              timeGrain: 'PT1M'
              timeWindow: 'PT10M' 
              dividePerInstance: false
            }
          scaleAction: {
            cooldown: 'PT1M'
            direction: 'Increase'
            type: 'ChangeCount'
            value: '1'
          }
          }
          {
            metricTrigger: {                                // scale in rules
              metricName: 'Percentage CPU'
              metricNamespace: ''
              metricResourceUri: vmss.id 
              operator: 'LessThan'
              statistic: 'Average' 
              threshold: 25 
              timeAggregation: 'Average' 
              timeGrain: 'PT1M'
              timeWindow: 'PT10M' 
              dividePerInstance: false
            }
          scaleAction: {
            cooldown: 'PT1M'
            direction: 'Decrease'
            type: 'ChangeCount'
            value: '1'
          }
          }
        ]
      }
    ]
  }
}
