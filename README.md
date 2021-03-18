# Service Mesh Demystified

This project is inspired by the [Service Mesh Patterns](https://github.com/trevorbox/service-mesh-patterns) Github repository but contains specific scenarios to help explain Service Mesh to the uninitiated.

# Dependencies

To install this, you will need access to an OpenShift cluster that can support OSSM 2.x.  At the time of this writing, that would be OCP 4.6.  The installation utilizes operators thus you will also need administrator level access on the cluster.

You will also need [Helm](https://helm.sh) and the openshift client installed locally.

# Getting Started

## Install the Operators

First, install the operators in the cluster.

```sh ./scripts/install-service-mesh-operators.sh```
### With Ansible: 
Run the playbook: 
``` ansible-playbook playbooks/install_service_mesh_operators.yaml```

## Install the Control Plane

```sh ./scripts/install-service-mesh-control-plane.sh```

### With Ansible:
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
