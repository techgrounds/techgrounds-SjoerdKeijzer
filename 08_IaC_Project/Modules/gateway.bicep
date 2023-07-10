
// import the regular params from main
param location string
param environment string

// import needed outputs from other modules
param name_vnet_webserver string
param name_vmss string
param agw_subnet string
param agw_pub_ip string
// param agw_subnet_prefix string

param app_gateway_name string = '${environment}-agw'

// public ip voor gateway
// gateway in webserver vnet
// gateway eigen subnet + subnet prefix
// gateway eigen nsg? Nee, vmss eigen nsg
// scale set aan gateway koppelen
// listeners / rules instellen

resource vnet_webserver 'Microsoft.Network/virtualNetworks@2022-11-01' existing = {
  name: name_vnet_webserver
}


resource app_gateway 'Microsoft.Network/applicationGateways@2022-11-01' = {
  name: app_gateway_name
  location: location
  properties: {
    autoscaleConfiguration: {
      minCapacity: 1
      maxCapacity: 2
    }
    // authenticationCertificates:
    backendAddressPools: [
      // {
      //   id: resourceId()
      // }
    ]
    // forceFirewallPolicyAssociation:
    enableHttp2: false
    // customErrorConfigurations: 
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
      tier: 'Standard'          // standard v2
    }
    // sslCertificates:
    // probes:
    // sslPolicy:
    // sslProfiles:
    // webApplicationFirewallConfiguration:
    // redirectConfigurations:                              // need to write rule here for http > https
  }
}


output name_agw string = app_gateway_name
