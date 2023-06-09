param environment string

@description('set resources in same region as the target resource group')
param location string


@description('Input linked outputs from networking module.')
// input linked outputs from other module. Outputs are defined in webserver module in main.bicep
param nicid string

param diskencryption string


@description('Name and specs of webserver.')
// Name and specs of webserver
param vm_name_webserver string = '${environment}linuxwebserver'
param vm_size string = 'Standard_B1s'
param vm_sku string = '20_04-lts'

//login webserver
param webadmin_username string = 'vmsjoerd'
@secure()
@minLength(6)
param webadmin_password string = 'PasswordMustBeSafeOk!'                        // later in keyvault zetten

var apache_script = loadFileAsBase64('bashscript/web_installscript.sh')          // apache user data to get onto webserver

resource webvm 'Microsoft.Compute/virtualMachines@2022-03-01' = {
  name: vm_name_webserver
  location: location
  tags:{
    location: location
    environment: environment
    type: vm_name_webserver

  }
  properties: {
    userData: apache_script
    hardwareProfile: {
      vmSize: vm_size
    }
    storageProfile: {
      imageReference: {
        publisher: 'canonical'
        offer: '0001-com-ubuntu-server-focal'
        sku: vm_sku
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          diskEncryptionSet: {
            id: diskencryption
          }
        }
      }
    }
    osProfile: {
      computerName: vm_name_webserver
      adminUsername: webadmin_username
      adminPassword: webadmin_password
      linuxConfiguration: {
        // disablePasswordAuthentication: true
        // ssh: {                                       // insert ssh key here but need to config it proper
        //   publicKeys:
        // }
        provisionVMAgent: true
      }
    }
    networkProfile:  {
      networkInterfaces: [
        {
          id: nicid
          properties: {
            deleteOption: 'Detach'
            primary: true
          }
        }
      ]
    }
  }
}



// output vm_webserver_principal_id string = webvm.identity.principalId       // is apparantly invalid output according to Azure Bicep upon deployment

// results in error: {
// 'The template output \'vm_webserver_principal_id\' is not valid: The language expression property \'identity\' doesn\'t exist,
//  available properties are \
//  'apiVersion, location, properties, condition, isConditionTrue, subscriptionId, resourceGroupName, scope, resourceId, referenceApiVersion, existing, isTemplateResource, isAction, provisioningOperation\'..'
