param appServiceAppName string = 'podstawychmury20261108asa'
param location string = resourceGroup().location

var appServicePlanName string = 'podstawychmury20261108asp'
// var vs param not properly used 


resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: 'podstawychmury20261108sa'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

resource appServicePlan 'Microsoft.Web/serverfarms@2024-04-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: 'F1'
  }
}

resource appServiceApp 'Microsoft.Web/sites@2024-04-01' = {
  name: appServiceAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}
