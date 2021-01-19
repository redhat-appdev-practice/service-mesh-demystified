#!/bin/bash

BOOKINFO=bookinfo 
SSO_BOOKINFO=sso-bookinfo
CONTROL_PLANE_NAME=istio-system

echo "Delete basic-gateway-configuration..."

helm delete basic-gateway-configuration -n ${BOOKINFO}
helm delete basic-gateway-configuration -n ${SSO_BOOKINFO}

echo "Delete bookinfo app..."

helm delete bookinfo -n ${BOOKINFO}
helm delete bookinfo -n ${SSO_BOOKINFO}

echo "Delete bookinfo project"

oc delete project ${BOOKINFO}
oc delete project ${SSO_BOOKINFO}

echo "Remove SMCP"

helm delete basic-install -n ${CONTROL_PLANE_NAME} 
oc delete project ${CONTROL_PLANE_NAME}

echo "Done."

exit 0