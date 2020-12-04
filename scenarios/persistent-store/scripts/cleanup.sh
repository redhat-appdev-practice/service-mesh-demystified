#!/bin/bash

BOOKINFO=bookinfo 
ISTIO_V1=istio-system
ISTIO_V2=istio-system-v2

echo "Deleting all assets..."

echo "Delete bookinfo project"

oc delete project ${BOOKINFO}

echo "Deleting control plane v1..."

oc delete project ${ISTIO_V1}

echo "Deleting control plane v2..."

oc delete project ${ISTIO_V2}

echo "Done."

exit 0