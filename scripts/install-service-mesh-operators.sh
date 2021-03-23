#!/bin/bash

echo "Installing service mesh operators..."

helm install service-mesh-operators -n openshift-operators charts/install_sm_operators_with_helm/service-mesh-operators


exit 0
