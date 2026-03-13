param accounts_customvisionobjectdetectionlab_name string = 'customvisionobjectdetectionlab'
param accounts_customvisionobjectdetectionlab_Prediction_name string = 'customvisionobjectdetectionlab-Prediction'

resource accounts_customvisionobjectdetectionlab_name_resource 'Microsoft.CognitiveServices/accounts@2025-10-01-preview' = {
  name: accounts_customvisionobjectdetectionlab_name
  location: 'eastus'
  sku: {
    name: 'S0'
  }
  kind: 'CustomVision.Training'
  properties: {
    customSubDomainName: accounts_customvisionobjectdetectionlab_name
    networkAcls: {
      defaultAction: 'Allow'
      virtualNetworkRules: []
      ipRules: []
    }
    allowProjectManagement: false
    publicNetworkAccess: 'Enabled'
  }
}

resource accounts_customvisionobjectdetectionlab_Prediction_name_resource 'Microsoft.CognitiveServices/accounts@2025-10-01-preview' = {
  name: accounts_customvisionobjectdetectionlab_Prediction_name
  location: 'eastus'
  sku: {
    name: 'S0'
  }
  kind: 'CustomVision.Prediction'
  properties: {
    customSubDomainName: 'customvisionobjectdetectionlab-prediction'
    networkAcls: {
      defaultAction: 'Allow'
      virtualNetworkRules: []
      ipRules: []
    }
    allowProjectManagement: false
    publicNetworkAccess: 'Enabled'
  }
}
