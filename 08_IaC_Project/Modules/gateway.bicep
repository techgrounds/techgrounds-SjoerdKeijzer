
// import the regular params from main
param location string
param environment string
param diskencryption string

// import needed outputs from other modules
param name_vnet_webserver string
param name_vmss string


// public ip voor gateway
// gateway in webserver vnet
// gateway eigen subnet
// gateway eigen NSG ?
// scale set aan gateway koppelen
// listeners / rules instellen

resource vnet_webserver 'Microsoft.Network/virtualNetworks@2022-11-01' existing = {
  name: name_vnet_webserver
}

resource app_gateway 'Microsoft.Network/applicationGateways@2022-11-01' = {
  name: app_gateway_name
  properties: {
    autoscaleConfiguration: {
      minCapacity: 1
      maxCapacity: 3
    }
    // authenticationCertificates:
    // backendAddressPools:
    // forceFirewallPolicyAssociation:
    enableHttp2: false
    // customErrorConfigurations: 
    // gatewayIPConfigurations:
    // frontendIPConfigurations:
    // frontendPorts:
    sku: gateway_sku
    // sslCertificates:
    // probes:
    // sslPolicy:
    // sslProfiles:
    // webApplicationFirewallConfiguration:
  }
}
