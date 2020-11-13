#!/bin/bash

CONTROL_PLANE_NAMESPACE=istio-system

echo "Checking for potential upgrade errors..."

oc get smcp -n ${CONTROL_PLANE_NAMESPACE} -o jsonpath={'.items[0].spec.techPreview.errored'} 

echo "Done."

exit 0