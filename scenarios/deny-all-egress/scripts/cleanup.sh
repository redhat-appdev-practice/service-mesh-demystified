#!/bin/bash

APP_PROJECT=bookinfo

echo "Cleaning up all Helm charts..."

helm uninstall reviews -n ${APP_PROJECT}

helm uninstall productpage -n ${APP_PROJECT}

helm uninstall egress-policies -n ${APP_PROJECT}

helm uninstall basic-gateway-configuration -n ${APP_PROJECT}

oc delete-project ${APP_PROJECT}

echo "Done."

exit 0