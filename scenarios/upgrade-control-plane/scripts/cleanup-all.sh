#!/bin/bash

BOOKINFO=bookinfo 
BOOKINFO_v2=bookinfo-v2

echo "Delete basic-gateway-configuration..."

helm delete basic-gateway-configuration -n ${BOOKINFO}

echo "Delete bookinfo app..."

helm delete bookinfo -n ${BOOKINFO}
helm delete bookinfo -n ${BOOKINFO_v2}

echo "Delete bookinfo project"

oc delete project ${BOOKINFO}
oc delete project ${BOOKINFO_v2}

echo "Deleting control plane..."

helm delete smcp-route -n istio-system-v2

oc delete project istio-system-v2

echo "Done."

exit 0