targetScope = 'subscription'

param baseName string
param dnsPrefix string
param linuxAdminUsername string
param sshRSAPublicKey string

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: baseName
  location: deployment().location
}

module aks './modules/aks.bicep' = {
  name: 'aks-deploy'
  scope: rg
  params: {
    baseName: baseName
    sshRSAPublicKey: sshRSAPublicKey
    linuxAdminUsername: linuxAdminUsername
    dnsPrefix: dnsPrefix
  }
}

module kubernetes './modules/kubernetes.bicep' = {
  name: 'kubernetes-deploy'
  scope: rg
  params: {
    kubeconfig: aks.outputs.kubeconfig
    manifest: loadTextContent('./assets/manifest.yml')
  }
}

output webUrl string = 'http://${kubernetes.outputs.externalIp}/'
