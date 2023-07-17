
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
  parent: vnet_webserver                             
  properties: {
    allowForwardedTraffic: true
    allowGatewayTransit: false
    allowVirtualNetworkAccess: true
    doNotVerifyRemoteGateways: true                 
    peeringState: 'Connected'
    peeringSyncLevel: 'FullyInSync'
    remoteAddressSpace: {
      addressPrefixes: [
        'string'
      ]
    }
    remoteVirtualNetwork: {
      id: peer_admin_vnet                        
    }
    remoteVirtualNetworkAddressSpace: {
      addressPrefixes: [
        'string'
      ]
    }
    useRemoteGateways: false                    
  }
}

resource vnet_adminserver 'Microsoft.Network/virtualNetworks@2022-11-01' existing = {
  name: name_vnet_adminserver }

resource admin_to_web_peer 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2022-07-01' = {
  name: '${name_vnet_adminserver}_to_${name_vnet_webserver}' 
  parent: vnet_adminserver                             
  properties: {
    allowForwardedTraffic: true
    allowGatewayTransit: false
    allowVirtualNetworkAccess: true
    doNotVerifyRemoteGateways: true                 
    peeringState: 'Connected'
    peeringSyncLevel: 'FullyInSync'
    remoteAddressSpace: {
      addressPrefixes: [
        'string'
      ]
    }
    remoteVirtualNetwork: {
      id: peer_web_vnet                        
    }
    remoteVirtualNetworkAddressSpace: {
      addressPrefixes: [
        'string'
      ]
    }
    useRemoteGateways: false                    
  }
}
