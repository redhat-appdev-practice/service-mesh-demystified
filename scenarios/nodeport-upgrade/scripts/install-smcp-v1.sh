#!/bin/bash

MESH_CONTROL_PLANE=istio-system
INSTALL_PLAN=nodeport-install

oc new-project ${MESH_CONTROL_PLANE}

echo "Install control plane..."

helm install control-plane -n ${MESH_CONTROL_PLANE} scenarios/nodeport-upgrade/charts/control-plane/

echo "Wait for control plane to finish deployment..."

FAILURES=0
RETRY=10
for ((i=$RETRY; i>=1; i--)); do if [ -z "$(oc get servicemeshcontrolplane ${INSTALL_PLAN} -n ${MESH_CONTROL_PLANE} -o jsonpath={'.status.annotations.readyComponentCount'})" ]; then echo "wait $i more times for service mesh deployment..."; (( FAILURES++ )); sleep 30s; else echo "service mesh deployed successfully!"; break; fi; done 

#exit with failure if the mesh failed to deploy
if [ $FAILURES -ge $RETRY ]; then echo "Deploying the control plane took longer than expected. Check the status of it."; exit 1; fi

echo "Done."
exit 0