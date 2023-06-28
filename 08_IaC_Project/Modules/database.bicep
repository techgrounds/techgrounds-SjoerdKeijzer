
param location string
param environment string
param sqlserver_name string = '${environment}sql_server'
param sqldb_name string = '${environment}sql_database'

// fix later after keyvault sheningans are solved
@secure()
param sqladmin string = 'sqladmin'
@secure()
param mysqlPassword string = 'Jeweetooknooitwatjeinmoetvullenhier123!'

resource sqlserver 'Microsoft.Sql/servers@2021-02-01-preview' = {
  name: sqlserver_name
  location: location
  properties: {
    administratorLogin: sqladmin
    administratorLoginPassword: mysqlPassword
    publicNetworkAccess: 'Disabled'
    version: 'mysqlversion'
    restrictOutboundNetworkAccess: 'Enabled'
    minimalTlsVersion: '1.2'
    // keyId:
    // federatedClientId:
    // administrators:

  }
}

  resource sqldb 'Microsoft.DBforMySQL/servers/databases@2017-12-01' = {
    name: sqldb_name
    parent: sqlserver               // need to fix this / get right resource
    properties: {
      // charset: 
      // collation: 
    }
  }


