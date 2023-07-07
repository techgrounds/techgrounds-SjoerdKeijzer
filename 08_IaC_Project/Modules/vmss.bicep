param location string
param environment string
param name_vnet_webserver string
param id_vnet_webserver string
param diskencryption string
param subnet_id_backend string

// VMSS specifics
param name_vmss string = 'vmss_webserver'
param vm_size string = 'Standard_B1s'
param vm_sku string = '20_04-lts'

// installs apache on each scaling instance
var apache_script = loadFileAsBase64('bashscript/web_installscript.sh')

//login webserver
param webadmin_username string = 'vmsjoerd'
@secure()
@minLength(6)
param webadmin_password string = 'PasswordMustBeSafeOk!'                        // later in keyvault zetten

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
          createOption: 'FromImage'
          managedDisk: {
            diskEncryptionSet: {
              id: diskencryption
            }
          }
        }
      }
      osProfile: {
        adminUsername: webadmin_username
        adminPassword: webadmin_password
        linuxConfiguration: {
          disablePasswordAuthentication: false
          provisionVMAgent: true
        }
      }
      networkProfile: {
        networkInterfaceConfigurations: [
          {
            // id: vmss_interface_id
            name: '${environment}-VMSS_interface' 
            properties: {
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
    overprovision: true
    singlePlacementGroup: true
    platformFaultDomainCount: 1
  }
  
}

output name_vmss string = name_vmss
