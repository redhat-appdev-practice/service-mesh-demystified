# Service Mesh Demystified

This project is inspired by the [Service Mesh Patterns](https://github.com/trevorbox/service-mesh-patterns) Github repository but contains specific scenarios to help explain Service Mesh to the uninitiated. This repository also contains few Ansible Roles to automate the installation of the Service Mesh Operators, Control Plane and an example bookinfo application. 

# Dependencies

To install this, you will need access to an OpenShift cluster that can support OSSM 2.x.  At the time of this writing, that would be OCP 4.6.  The installation utilizes operators thus you will also need administrator level access on the cluster.

You will also need [Helm](https://helm.sh) and the openshift client installed locally.

# Getting Started

## Install with Helm 
The following scripts invoke `helm install ...` commands using the `helm` binary from local machine. 

1. Install the operators in the cluster: 
```
sh ./scripts/install-service-mesh-operators.sh
```
2. Install the control plane: 
```
sh ./scripts/install-service-mesh-control-plane.sh
```

## Install with Ansible 
The following Ansible Roles use modules from `kubernetes.core` collection to install the operators and control plane. The roles use the same Helm charts that the scripts above do.

Learn more about how the Ansible roles and charts are being utilized together [here](roles/README.md) 

1. Install the operators with the following playbook: 
```
ansible-playbook playbooks/install_service_mesh_operators.yaml
```

2. Install the control plane:
```
ansible-playbook playbooks/install_service_mesh_controlplane.yaml
```

# Service Mesh Deployment Examples

Now that the control plane is installed, you may want to go through some examples to see how service mesh can be used. 

 - [Simple Ingress Gateway with Bookinfo](docs/simple-ingress-gateway-with-bookinfo.md)
    - The installation of the bookinfo application with minimal gateway configuration is also automated with an Ansible role [here](roles/install_bookinfo_basic_gateway_with_helm)
 - [Deny all egress by default](docs/deny-all-egress-by-default.md)
 - [Upgrade OSSM Control Plane to 2.x](docs/upgrade-control-plane.md)
 - [Zero downtime upgrade](docs/zero-downtime-upgrade.md)
 - [Persistent Storage for Jaeger and ElasticSearch](docs/persistent-storage-jaeger-elasticsearch.md)
