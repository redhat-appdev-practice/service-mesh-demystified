# Service Mesh Demystified

This project is inspired by the [Service Mesh Patterns](https://github.com/trevorbox/service-mesh-patterns) Github repository but contains specific scenarios to help explain Service Mesh to the uninitiated.

# Dependencies

To install this, you will need access to an OpenShift cluster that can support OSSM 2.x.  At the time of this writing, that would be OCP 4.6.  The installation utilizes operators thus you will also need administrator level access on the cluster.

## Prereqs
- [Helm 3.x](https://helm.sh/docs/intro/install/)
- [Ansible 2.9.x](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- [Ansible Helm Module](https://docs.ansible.com/ansible/latest/collections/community/kubernetes/helm_module.html)

## Running the playbooks
All the Ansible playbooks are located in the `playbooks` directory. The Helm charts are located in the `charts` directory. 

The values of the various variables for the Helm charts are located in the `values.yml` file located in the respective charts directory. The defaults can be overridden by taking advantage of the `values` or `values_files` parameters of the `helm` module. 


## Installing Keycloak

To take full advantage of the example of Service Mesh authorization, you will need to install [Keycloak](https://www.keycloak.org/).  The Helm chart for this Keycloak installation automatically configures for redirect to the bookinfo application.  There is a default environment values file for OpenTLC in the values/env directory.  This configuration is required to set the baseDomain value for the redirectUrl.  To override this, create your own values.yaml and ensure that the playbook picks it up by creating your own inventory pointing to your environment file.  See labs_inventory/group_vars/all.yml for an example.

Finally, run the keycloak playbook like so (for OpenTLC environment) =>

`ansible-playbook playbooks/keycloak -i labs_inventory`

# Getting Started

## Install the Operators via Bash

First, install the operators in the cluster.

```sh ./scripts/install-service-mesh-operators.sh```

### Via Ansible: 

Run the playbook: 
``` ansible-playbook playbooks/install_service_mesh_operators.yaml```

## Install the Control Plane via Bash

```sh ./scripts/install-service-mesh-control-plane.sh```

### Via Ansible:

```ansible-playbook playbooks/install_service_mesh_controlplane.yaml```

## (Optional) deploy the bookinfo application with minimial configurations:

```ansible-playbook playbooks/install_bookinfo_basic_gateway.yml```

# Service Mesh Deployment Examples

Now that the control plane is installed, you may want to go through some examples
to see how service mesh can be used.

 - [Simple Ingress Gateway with Bookinfo](docs/simple-ingress-gateway-with-bookinfo.md)
 - [Deny all egress by default](docs/deny-all-egress-by-default.md)
 - [Upgrade OSSM Control Plane to 2.x](docs/upgrade-control-plane.md)
 - [Zero downtime upgrade](docs/zero-downtime-upgrade.md)
 - [Persistent Storage for Jaeger and ElasticSearch](docs/persistent-storage-jaeger-elasticsearch.md)

##References: 
- Bookinfo Helm charts: https://github.com/trevorbox/service-mesh-patterns/tree/master/ossm-2.0