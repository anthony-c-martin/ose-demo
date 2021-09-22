#!/bin/bash

az deployment sub create \
  -f ./bicep/main.bicep \
  --location 'East US 2' \
  --name 'ose_demo' \
  --parameters \
    baseName='ose_demo' \
    dnsPrefix='osedemo' \
    linuxAdminUsername='anthony' \
    sshRSAPublicKey='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCeLiDskct+Rsx/VtOyCY1Jn1s24V/60fEjvpiGNnYiqlkA0c5YaYv6x0GYbx66YLiSgNIwxb1u2eCQGTrmRDQkg5gFH+DvIk227zSB8wvgRuFUVs17JTlGSwK00GmlisoetMbY668DYAZMxfqw1e1J1E9x0KFXKgxQX23Ryc9a1cry+5njTYdTdCzSKU2n8a85yAyoX5rkzmVLYUkufgEMMg/v11VtEEV8Ye4Ynwg7A0Xw4adGNrFJ+pMJQVz/AaEWDMSs/joBcSMN6Gh+q6az+eD+7Qtpknf9XNyqBGLJLg4/g7TVM/JrIr7qmIgT1vynJ15GVIBp3gj2JVtaU53fJRuafqOcheqSoED9Ck+dGffjw5sESsHfLRvWtC/Eovmv55pHWUMuLAj4Vj9B7b9cPEKcdbcOvHcT04+rEiZ8hIhBqVkqsmTQQj+Q8Q/XijtoS3s7n6rl/9XHtcUJ+hFYlsrNzH0ncDPJ8HT36URVep7GDUklEzmbknJMUgHK5UE= ant@anthonys-mbp.lan' \
  --query properties.outputs.webUrl