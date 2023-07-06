param location string
param name_vnet_webserver string
param id_vnet_webserver string
param name_vmss string = 'vmss_webserver'

// installs apache on each scaling instance
var apache_script = loadFileAsBase64('bashscript/web_installscript.sh')

resource vmss 'Microsoft.Compute/virtualMachineScaleSets@2021-11-01' = {
  name: name_vmss
  location: location
  tags: {
    vnet: name_vnet_webserver
    location: location
    id: 'vm scale set'
    project: 'IaC'
  }
  properties: {
    automaticRepairsPolicy: {
      enabled: true
    }
    upgradePolicy: {
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
    }
    orchestrationMode: 'Flexible'
    scaleInPolicy: {
      rules: [
      ]
    }
    overprovision: true
  }
  
}

output name_vmss string = name_vmss
