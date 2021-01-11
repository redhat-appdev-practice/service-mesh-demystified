#!/bin/bash

BOOKINFO=bookinfo 

echo "Delete basic-gateway-configuration..."

helm delete basic-gateway-configuration -n ${BOOKINFO}

echo "Delete bookinfo app..."

helm delete bookinfo -n ${BOOKINFO}

echo "Delete bookinfo project"

oc delete project ${BOOKINFO}

echo "Done."

exit 0