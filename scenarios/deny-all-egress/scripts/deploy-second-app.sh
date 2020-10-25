#!/bin/bash

APP_PROJECT=bookinfo

echo "Update EgressNetworkPolicy..."

helm upgrade --install egress-policies \
  -n ${APP_PROJECT} scenarios/deny-all-egress/charts/egress-policies \
  --values scenarios/deny-all-egress/values/second-app-egress.yaml

echo "Installing the Second Application..."

helm install reviews -n ${APP_PROJECT} \
  scenarios/deny-all-egress/charts/second-app

echo "Done."

exit 0