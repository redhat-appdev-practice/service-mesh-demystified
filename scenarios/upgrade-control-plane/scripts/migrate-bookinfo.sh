#!/bin/bash

BOOKINFO=bookinfo 
ISTIO_SYSTEM=istio-system 
ISTIO_SYSTEM_V2=istio-system-v2
CONTROL_PLANE_NAME=basic-install 
MESH_ROUTE_NAME=api

echo "Remove current bookinfo project"
helm delete bookinfo -n ${BOOKINFO}

echo "Move Gateway from namespace \"${ISTIO_SYSTEM}\" to \"${ISTIO_SYSTEM_V2}\"..."

helm delete basic-gateway-configuration -n ${BOOKINFO}

helm install basic-gateway-configuration -n ${BOOKINFO} \
  --set control_plane_namespace=${ISTIO_SYSTEM_V2} \
  --set control_plane_name=${CONTROL_PLANE_NAME} \
  --set route_hostname=$(oc get route ${MESH_ROUTE_NAME} -n ${ISTIO_SYSTEM_V2} -o jsonpath={'.spec.host'}) \
  scenarios/simple-ingress-gateway-with-bookinfo/charts/basic-gateway-configuration

#echo "Install Bookinfo..."

helm install bookinfo -n ${BOOKINFO} scenarios/simple-ingress-gateway-with-bookinfo/charts/bookinfo

echo "Done."

exit 0