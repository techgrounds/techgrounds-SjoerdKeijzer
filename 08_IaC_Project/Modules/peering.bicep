//////////////////////////////////////////////

@description('Naming for the vnets')
param name_vnet_webserver string
param name_vnet_adminserver string

@description('imported vnet ids and resources from network module')
param peer_web_vnet string // vnet id webserver
param peer_admin_vnet string // vnet id adminserver


resource vnet_webserver 'Microsoft.Network/virtualNetworks@2022-11-01' existing = {
  name: name_vnet_webserver }

resource web_to_admin_peer 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2022-07-01' = {
  name: '${name_vnet_webserver}_to_${name_vnet_adminserver}'
  parent: vnet_webserver                             // adjust to proper network name
  properties: {
    allowForwardedTraffic: true
    allowGatewayTransit: false
    allowVirtualNetworkAccess: true
    doNotVerifyRemoteGateways: true                 // remote gateway settings
    peeringState: 'Connected'
    peeringSyncLevel: 'FullyInSync'
    remoteAddressSpace: {
      addressPrefixes: [
        'string'
      ]
    }
    remoteVirtualNetwork: {
      id: peer_admin_vnet                        // adjust to network name you wish to pair the parent network with
    }
    remoteVirtualNetworkAddressSpace: {
      addressPrefixes: [
        'string'
      ]
    }
    useRemoteGateways: false                    // remote gateway settings 2
  }
}

resource vnet_adminserver 'Microsoft.Network/virtualNetworks@2022-11-01' existing = {
  name: name_vnet_adminserver }

resource admin_to_web_peer 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2022-07-01' = {
  name: '${name_vnet_adminserver}_to_${name_vnet_webserver}' 
  parent: vnet_adminserver                             // adjust to proper network name
  properties: {
    allowForwardedTraffic: true
    allowGatewayTransit: false
    allowVirtualNetworkAccess: true
    doNotVerifyRemoteGateways: true                 // remote gateway settings
    peeringState: 'Connected'
    peeringSyncLevel: 'FullyInSync'
    remoteAddressSpace: {
      addressPrefixes: [
        'string'
      ]
    }
    remoteVirtualNetwork: {
      id: peer_web_vnet                        // adjust to network name you wish to pair the parent network with
    }
    remoteVirtualNetworkAddressSpace: {
      addressPrefixes: [
        'string'
      ]
    }
    useRemoteGateways: false                    // remote gateway settings 2
  }
}
