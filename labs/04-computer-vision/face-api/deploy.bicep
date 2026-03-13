param location string = resourceGroup().location
param aiServiceName string = 'face-api-${uniqueString(resourceGroup().id)}'

resource accounts_kmf_ai102_face_name_resource 'Microsoft.CognitiveServices/accounts@2025-10-01-preview' = {
  identity: {
    type: 'None'
  }
  kind: 'Face'
  location: location
  name: aiServiceName
  properties: {
    allowProjectManagement: false
    customSubDomainName: aiServiceName
    networkAcls: {
      defaultAction: 'Allow'
      ipRules: []
      virtualNetworkRules: []
    }
    publicNetworkAccess: 'Enabled'
  }
  sku: {
    name: 'F0'
  }
}
