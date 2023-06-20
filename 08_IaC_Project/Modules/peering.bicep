//////////////////////////////////////////////

param location string

@description('Naming for the vnets')
param peer_web string = 'vnet_webserver' // vnet web_server.id
param peer_admin string = 'vnet_adminserver' // vnet admin_server.id

// need 2 resources so we can make the proper connections with vnet 1 -> vnet 2 and also vnet 2 -> vnet1 
// example below
resource peer2appple 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2022-07-01' = {
  name: '${vnet1Name}-${vnet2Name}'
  parent: vnet1                               // adjust to proper network name
  properties: {
    allowForwardedTraffic: true
    allowGatewayTransit: false
    allowVirtualNetworkAccess: true
    doNotVerifyRemoteGateways: bool
    peeringState: 'Connected'
    peeringSyncLevel: 'FullyInSync'
    remoteAddressSpace: {
      addressPrefixes: [
        'string'
      ]
    }
    remoteBgpCommunities: {
      virtualNetworkCommunity: 'string'
    }
    remoteVirtualNetwork: {
      id: vnet2.id                        // adjust to network name you wish to pair the parent network with
    }
    remoteVirtualNetworkAddressSpace: {
      addressPrefixes: [
        'string'
      ]
    }
    useRemoteGateways: bool
  }
}
