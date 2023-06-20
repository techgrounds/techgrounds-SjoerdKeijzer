param location string
param name_vnet_webserver string
param id_vnet_webserver string

resource vmss 'Microsoft.Compute/virtualMachineScaleSets@2021-11-01' = {
  name: 'vmss_webserver'
  location: location
  properties: {
    
  }
  tags: {
    vnet: name_vnet_webserver
    location: location
    id: 'vm scale sset'
    project: 'IaC'
  }
}

