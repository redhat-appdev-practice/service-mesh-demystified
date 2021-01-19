#!/bin/bash

BOOKINFO=sso-bookinfo 
ISTIO_SYSTEM=istio-system 
CONTROL_PLANE_NAME=basic-install 
MESH_ROUTE_NAME=sso-api
INGRESS=sso-ingressgateway
GATEWAY_NAME=sso

oc new-project ${BOOKINFO}

echo "Install VirtualService & Bookinfo App in namespace \"${BOOKINFO}\" and Gateway in namespace \"${ISTIO_SYSTEM}\"..."

helm install basic-gateway-configuration -n ${BOOKINFO} \
  --set control_plane_namespace=${ISTIO_SYSTEM} \
  --set control_plane_name=${CONTROL_PLANE_NAME} \
  --set ingress=${INGRESS} \
  --set name=${GATEWAY_NAME} \
  --set route_hostname=$(oc get route ${MESH_ROUTE_NAME} -n ${ISTIO_SYSTEM} -o jsonpath={'.spec.host'}) \
  scenarios/multiple-gateways/charts/basic-gateway-configuration

echo "Install Bookinfo..."

helm install bookinfo -n ${BOOKINFO} scenarios/multiple-gateways/charts/bookinfo

echo "Done."

exit 0