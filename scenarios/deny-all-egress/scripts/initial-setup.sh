#!/bin/bash

APP_PROJECT=bookinfo
MESH_CONTROL_PLANE=istio-system
MESH_INSTALL_PLAN=basic-install 
MESH_ROUTE_NAME=api

oc new-project ${APP_PROJECT}

echo "Install EgressNetworkPolicy in namespace \"${APP_PROJECT}\" and Gateway in namespace \"${MESH_CONTROL_PLANE}\"..."

helm upgrade --install egress-policies -n ${APP_PROJECT} \
  scenarios/deny-all-egress/charts/egress-policies

helm install basic-gateway-configuration -n ${APP_PROJECT} \
  --set control_plane_namespace=${MESH_CONTROL_PLANE} \
  --set control_plane_name=${MESH_INSTALL_PLAN} \
  --set route_hostname=$(oc get route ${MESH_ROUTE_NAME} -n ${MESH_CONTROL_PLANE} -o jsonpath={'.spec.host'}) \
  scenarios/deny-all-egress/charts/basic-gateway-configuration

echo "Done."

exit 0