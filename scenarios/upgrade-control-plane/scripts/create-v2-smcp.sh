#!/bin/bash

SERVICEMESH_CONTROL_PLANE=istio-system
V2_CONTROL_PLANE=istio-system-v2
MESH_NAME=basic-install

echo "Backing up the v1 configuration in the root of this project..."
oc project ${SERVICEMESH_CONTROL_PLANE}

oc get servicemeshcontrolplanes.v1.maistra.io ${MESH_NAME}  \
  -o yaml > ${MESH_NAME}.v1.yaml

echo "Creating the service mesh control plane component as a v2 resource..."

oc get smcp ${MESH_NAME} -o yaml > ${MESH_NAME}.v2.yaml

sed -i 's/istio-system/istio-system-v2/g' ${MESH_NAME}.v2.yaml

oc new-project ${V2_CONTROL_PLANE}

oc create -n ${V2_CONTROL_PLANE} -f ${MESH_NAME}.v2.yaml

echo "Adding api route to service mesh control plane..."

helm install smcp-route -n ${V2_CONTROL_PLANE} scenarios/upgrade-control-plane/charts/smcp-route

echo "Done."

exit 0