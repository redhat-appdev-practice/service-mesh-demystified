#!/bin/bash

echo "Installing service mesh operators..."

helm install service-mesh-operators -n openshift-operators charts/install_sm_operators_with_helm/service-mesh-operators

echo "If you chose manual approval, approve the InstallPlans within the openshift-operators namespace at the following URL..."
echo
echo "https://$(oc get route console -o jsonpath={.spec.host} -n openshift-console)/k8s/ns/openshift-operators/operators.coreos.com~v1alpha1~InstallPlan"
echo
echo "Done."

exit 0
