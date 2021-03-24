# Installing Service Mesh Control Plane 

This role simply uses the `helm` module from `kubernetes.core` collection to apply the Helm chart from the `charts` directory. For suggestions on different ways of overriding the defaults refer [here](../README.md).  

Some of the control plane configurations have been parameterized. Take a look at the [values file](../../charts/install_smcp_with_helm/values.yaml)

Path to chart(s) being utilized: `charts/install_smcp_with_helm/control-plane` 
