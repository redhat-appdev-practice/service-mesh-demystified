#!/bin/bash

BOOKINFO=bookinfo 

echo "Delete basic-gateway-configuration..."

helm delete basic-gateway-configuration -n ${BOOKINFO}

echo "Delete bookinfo app..."

helm delete bookinfo -n ${BOOKINFO}

echo "Delete bookinfo project"

oc delete project ${BOOKINFO}

echo "Deleting control plane..."

helm delete smcp-route -n istio-system-v2

oc delete project istio-system-v2

echo "Done."

exit 0