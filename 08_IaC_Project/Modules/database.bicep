
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
  }

  resource sqldb 'databases' = {
    name: sqldb_name
    location: location
    properties: {
      // longTermRetentionBackupResourceId: ''
    }
  }
}
