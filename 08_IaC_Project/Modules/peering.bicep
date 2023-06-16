//////////////////////////////////////////////

// Copy this later into main.bicep // 

@description('Deploy network peering module')
// Deploy network peering module
module peering 'Modules/peering.bicep' = {
  name: 'peering deployment'
  scope: rootgroup
  params: {
    something: something                      // probably need outputs and id's here
    somethingelse: againsomething             // probably need outputs and id's here
  }
  }

///////////////////////////////////////////////
@description('Naming for the vnets')
param vnet1Name string = 'vNet1'
param vnet2Name string = 'vNet2'

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
