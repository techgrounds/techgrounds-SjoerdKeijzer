param location string

//login webserver
param webadmin_username string = 'vmsjoerd'
@secure()
@minLength(6)
param webadmin_password string = 'PasswordMustBeSafeOk!'                        // later in keyvault zetten

param webServerName string = 'vmss'

param vnet1ID string
param vnet1Subnet1ID string
// param vnet1Subnet2ID string
param nsg1Id string
// param nsg3Id string
//param diskEncryptionSetName string

resource vnet1 'Microsoft.Network/virtualNetworks@2022-11-01' existing = {
  name: vnet1ID
}

resource appGate 'Microsoft.Network/applicationGateways@2022-11-01' = {
  name: 'appGate'
  location: location
  tags: {
    Location: location
  }
  properties: {
    enableHttp2: false
    autoscaleConfiguration: {
      minCapacity: 1
      maxCapacity: 2
    }
    sku: {
      name: 'Standard_v2'
      tier: 'Standard_v2'
      capacity: 1
    }
    gatewayIPConfigurations: [
      {
        name: 'appGatewayIpConfig'
        properties: {
          subnet: {
            id: vnet1.properties.subnets[1].id
          }
        }
      }
    ]
    frontendIPConfigurations: [
      {
        name: 'appGatewayFrontendIP'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id:  webServerPublicIP.id
          }
        }
      }
    ]
    frontendPorts: [
      {
        name: 'appGatewayFrontendPort'
        properties: {
          port: 80
        }
      }
    ]
    backendAddressPools: [
      {
        name: 'appGatewayBackendPool'
      }
    ]
    backendHttpSettingsCollection: [
      {
        name: 'appGatewayBackendHttpSettings'
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
        name: 'appGatewayHttpListener'
        properties: {
          frontendIPConfiguration: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendIPConfigurations', 'appGate', 'appGatewayFrontendIP')
          }
          frontendPort: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendPorts', 'appGate', 'appGatewayFrontendPort')
          }
          protocol: 'Http'
          requireServerNameIndication: false
        }
      }
    ]
    requestRoutingRules: [
      {
        name: 'appGatewayReqRule'
        properties: {
          priority: 1
          ruleType: 'Basic'
          httpListener: {
            id: resourceId('Microsoft.Network/applicationGateways/httpListeners', 'appGate', 'appGatewayHttpListener')
          }
          backendAddressPool: {
            id: resourceId('Microsoft.Network/applicationGateways/backendAddressPools', 'appGate', 'appGatewayBackendPool')
          }
          backendHttpSettings: {
            id: resourceId('Microsoft.Network/applicationGateways/backendHttpSettingsCollection', 'appGate', 'appGatewayBackendHttpSettings')
          }
        }
      }
    ]
    // sslCertificates: [
    //   {}
    //  ]
    }
    dependsOn: [
      vnet1
    ]
  }

resource webServerScaleSet 'Microsoft.Compute/virtualMachineScaleSets@2023-03-01' = {
  name: webServerName
  location: location
  tags: {
    Location: location
  }
  sku: {
    capacity: int(1)
    name: 'Standard_B2s'
    tier: 'Standard'
  }
  properties: {
    overprovision: true
    upgradePolicy: {
      mode: 'Automatic'
    }
    singlePlacementGroup: true
    platformFaultDomainCount: 1
    virtualMachineProfile: {
      storageProfile: {
        osDisk: {
          caching: 'ReadWrite'
          createOption: 'FromImage'
          managedDisk: {
            storageAccountType: 'StandardSSD_LRS'
            // diskEncryptionSet: {
            //   id: diskEncryptionSet.id
            // }
          }
        }
        imageReference: {
          publisher: 'Canonical'
          offer: 'ubuntuServer'
          sku: '18.04-LTS'
          version: 'latest'
        }
      }
      osProfile: {
        computerNamePrefix: 'ScaleSetVM'
        adminUsername: adminUserName
        adminPassword: adminPassword
        customData: loadFileAsBase64('apacheserver.sh')
      }
      networkProfile: {
        networkInterfaceConfigurations: [
          {
            name: 'WebScaleNiconfig'
            properties: {
              primary: true 
              enableAcceleratedNetworking: false
              enableIPForwarding: false
              networkSecurityGroup: {
                id: nsg1Id
              }
              ipConfigurations: [
                {
                  name: 'ipConfigScaleSet'
                  properties: {
                    subnet: {
                      id: resourceId('Microsoft.Network/virtualNetworks/subnets', vnet1ID, vnet1Subnet1ID)
                    }
                    privateIPAddressVersion: 'IPv4'
                    applicationGatewayBackendAddressPools: [
                       {
                         id: resourceId('Microsoft.Network/applicationGateways/backendAddressPools', 'appGate', 'appGatewayBackendPool')
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
  }
  dependsOn: [
    appGate
  ]
}

// resource webServerNic 'Microsoft.Network/networkInterfaces@2022-11-01' = {
//   name: '${webServerName}-nic'
//   location: location
//   properties: {
//     ipConfigurations: [
//       {
//         name: 'ipconfigWebServer'
//         properties: {
//           subnet: {
//             id:  resourceId('microsoft.network/virtualnetworks/subnets', vnet1ID, vnet1Subnet1ID)
//         }
//           privateIPAllocationMethod: 'Dynamic'
//       }
//     }
//     ] 
//     networkSecurityGroup: {
//       id: resourceId('Microsoft.Network/networkSecurityGroups', nsg3Id)
//     }
//   }
// }

// resource scaleHealth 'Microsoft.Compute/virtualMachineScaleSets/extensions@2023-03-01' = {
//   name: 'scaleHealth'
//   parent: webServerScaleSet 
//   properties: {
    
//   } 
// }

//A public IP for application gateway.
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

@description('Autoscaling resource for the vmss')
resource autoScaleResource 'Microsoft.Insights/autoscalesettings@2022-10-01' = {
  name: 'webServerAutoScale'
  location: location
  properties: {
    name: 'webServerAutoScale'
    targetResourceUri: webServerScaleSet.id
    enabled: true
    profiles: [
      {
        name: 'Profile1'
        capacity: {
          minimum: '1'
          maximum: '3'
          default: '1'
        }
        rules: [
          {
            metricTrigger: {
              metricName: 'Percentage CPU'
              metricNamespace: ''
              metricResourceUri: webServerScaleSet.id
              timeGrain: 'PT1M'
              statistic: 'Average'
              timeWindow: 'PT${10}M'
              timeAggregation: 'Average'
              operator: 'GreaterThan'
              threshold: 75
            }
            scaleAction: {
              direction: 'Increase'
              type: 'ChangeCount'
              value: '1'
              cooldown: 'PT1M'
            }
          }
          {
            metricTrigger: {
              metricName: 'Percentage CPU'
              metricNamespace: ''
              metricResourceUri: webServerScaleSet.id
              timeGrain: 'PT1M'
              statistic: 'Average'
              timeWindow: 'PT5M'
              timeAggregation: 'Average'
              operator: 'LessThan'
              threshold: 25
            }
            scaleAction: {
              direction: 'Decrease'
              type: 'ChangeCount'
              value: '1'
              cooldown: 'PT1M'
            }
          }
        ]
      }
    ]
    predictiveAutoscalePolicy: {
      scaleMode: 'ForecastOnly'
      scaleLookAheadTime: 'PT14M'
    }
  }
}
