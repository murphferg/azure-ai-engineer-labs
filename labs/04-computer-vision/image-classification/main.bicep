param accounts_ai102customvisionkmf_name string = 'ai102customvisionkmf'
param accounts_ai102customvisionkmf_Prediction_name string = 'ai102customvisionkmf-Prediction'

resource accounts_ai102customvisionkmf_name_resource 'Microsoft.CognitiveServices/accounts@2025-10-01-preview' = {
  name: accounts_ai102customvisionkmf_name
  location: 'eastus'
  sku: {
    name: 'F0'
  }
  kind: 'CustomVision.Training'
  properties: {
    customSubDomainName: accounts_ai102customvisionkmf_name
    networkAcls: {
      defaultAction: 'Allow'
      virtualNetworkRules: []
      ipRules: []
    }
    allowProjectManagement: false
    publicNetworkAccess: 'Enabled'
  }
}

resource accounts_ai102customvisionkmf_Prediction_name_resource 'Microsoft.CognitiveServices/accounts@2025-10-01-preview' = {
  name: accounts_ai102customvisionkmf_Prediction_name
  location: 'eastus'
  sku: {
    name: 'F0'
  }
  kind: 'CustomVision.Prediction'
  properties: {
    customSubDomainName: 'ai102customvisionkmf-prediction'
    networkAcls: {
      defaultAction: 'Allow'
      virtualNetworkRules: []
      ipRules: []
    }
    allowProjectManagement: false
    publicNetworkAccess: 'Enabled'
  }
}
