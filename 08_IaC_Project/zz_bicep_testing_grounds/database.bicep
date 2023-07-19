
param location string
param environment string
param name_vnet_webserver string
param sqlserver_name string = '${environment}sql_server'
param sqldb_name string = '${environment}sql_database'

// sql credentials
@secure()
param sqladmin string = 'sqladmin'
@secure()
param mysqlPassword string = 'Jeweetooknooitwatjeinmoetvullenhier123!'

resource sqlserver 'Microsoft.DBforMySQL/servers@2017-12-01' = {
  name: sqlserver_name
  location: location
  sku: {
    name: 'GP_Gen5_2'
    capacity: 2               // amount of vCores (2,4,8,16,32)
    size: '5120'
    tier: 'GeneralPurpose'
    family: 'Gen5'
  }
  properties: {
    administratorLogin: sqladmin
    administratorLoginPassword: mysqlPassword
    createMode: 'Default'
    publicNetworkAccess: 'Enabled'                // for testing
    infrastructureEncryption: 'Enabled'
    version: '8.0'
    minimalTlsVersion: 'TLS1_2'
    sslEnforcement: 'Disabled'
    storageProfile: {
      storageMB: 5120
      backupRetentionDays: 7
      geoRedundantBackup: 'Disabled'
    }
  }
}

/////////////////////////////////////////////////////

@description('Virtual Network RuleName')
param virtualNetworkRuleName string = 'AllowSubnet'

var db_private_endpoint_name = '${sqlserver_name}-endPoint'
var privateDnsZoneName = 'privatelink.mysql.database.azure.com'
var pvtEndpointDnsGroupName = '${db_private_endpoint_name}/mydnsgroupname'

resource vnet_webserver 'Microsoft.Network/virtualNetworks@2022-11-01'existing = {
  name: name_vnet_webserver
}

  resource virtualNetworkRule 'Microsoft.Sql/servers/virtualNetworkRules@2022-11-01-preview' = {
    name: virtualNetworkRuleName
    properties: {
      virtualNetworkSubnetId: vnet_webserver.properties.subnets[0].id
      ignoreMissingVnetServiceEndpoint: true
    }
  }


resource mySqlServerDB 'Microsoft.DBforMySQL/servers/databases@2017-12-01' = {
  parent: mySqlServer
  name: '${mySqlServerName}-myDB'
}

resource databasePrivateEndpoint 'Microsoft.Network/privateEndpoints@2022-11-01' = {
  name: databasePrivateEndpointName
  location: location
  properties: {
    subnet: {
      id: vnet1.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: databasePrivateEndpointName
        properties: {
          privateLinkServiceId: mySqlServer.id
          groupIds: [
            'mySqlServer'
          ]
        }
      }
    ]
  }
  dependsOn: [
    vnet1
  ]
}

resource privateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' = {
  name: privateDnsZoneName
  location: 'global'
  properties: {}
  dependsOn: [
    vnet1
  ]
}

resource privateDnsZoneLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
  parent: privateDnsZone
  name: '${privateDnsZoneName}-link'
  location: 'global'
  properties: {
    registrationEnabled: false
    virtualNetwork: {
      id: vnet1.id
    }
  }
}

resource pvtEndpointDnsGroup 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2022-11-01' = {
  name: pvtEndpointDnsGroupName
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'config1'
        properties: {
          privateDnsZoneId: privateDnsZone.id
        }
      }
    ]
  }
  dependsOn: [
    databasePrivateEndpoint
  ]
}
