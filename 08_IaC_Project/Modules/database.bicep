

// example

// ============ sqldb.bicep ============

@secure()
param mysqlPassword string

param location string

resource sqlserver 'Microsoft.Sql/servers@2021-02-01-preview' = {
  name: 'ContosoSqlServer'
  location: location
  properties: {
    administratorLogin: 'contosoadmin'
    administratorLoginPassword: mysqlPassword
  }

  resource sqldb 'databases' = {
    name: 'contosodb'
    location: location
  }
}
