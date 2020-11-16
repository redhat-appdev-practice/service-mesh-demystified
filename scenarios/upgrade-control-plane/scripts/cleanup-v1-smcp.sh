#!/bin/bash

MESH_CONTROL_PLANE=istio-system

echo "Uninstalling the v1 control plane..."

helm delete control-plane -n ${MESH_CONTROL_PLANE}

echo "Removing the istio-system project"

oc delete project ${MESH_CONTROL_PLANE}

echo "Done."