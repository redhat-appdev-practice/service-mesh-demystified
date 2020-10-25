#!/bin/bash

APP_PROJECT=bookinfo

echo "Update EgressNetworkPolicy..."

helm upgrade --install egress-policies \
  -n ${APP_PROJECT} scenarios/deny-all-egress/charts/egress-policies \
  --values scenarios/deny-all-egress/values/first-app-egress.yaml

echo "Installing the First Application..."

helm install productpage -n ${APP_PROJECT} \
  scenarios/deny-all-egress/charts/first-app

echo "Done."

exit 0