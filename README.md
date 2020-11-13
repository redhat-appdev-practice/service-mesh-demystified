# Service Mesh Demystified

This project is inspired by the [Service Mesh Patterns](https://github.com/trevorbox/service-mesh-patterns) Github repository but contains specific scenarios to help explain Service Mesh to the uninitiated.

# Dependencies

To install this, you will need access to an OpenShift cluster that can support OSSM 1.x.  The installation utilizes operators thus you will also need administrator level access on the cluster.

You will also need [Helm](https://helm.sh) installed locally.

# Getting Started

## Install the Operators

First, install the operators in the cluster.

```sh ./scripts/install-service-mesh-operators.sh```

## Install the Control Plane

```sh ./scripts/install-service-mesh-control-plane.sh```

# Service Mesh Deployment Examples

Now that the control plane is installed, you may want to go through some examples
to see how service mesh can be used.

 - [Simple Ingress Gateway with Bookinfo](docs/simple-ingress-gateway-with-bookinfo.md)
 - [Deny all egress by default](docs/deny-all-egress-by-default.md)
 - [Upgrade OSSM Control Plane to 2.x](docs/upgrade-control-plane.md)
