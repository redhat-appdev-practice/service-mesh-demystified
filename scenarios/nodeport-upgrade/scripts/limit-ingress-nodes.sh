#!/bin/bash

RAW_NODES=`oc get node --selector='!node-role.kubernetes.io/master' --output=jsonpath={.items..metadata.name}`
IFS=' ' read -r -a NODES <<< "$RAW_NODES"

count=${#NODES[@]}
echo "Found $count worker nodes"

half=$(( count / 2))
echo "Half of these nodes equals $half"

for (( i=0; i<$half; i++ )); do
    echo "Labeling node ${NODES[$i]}"
done

echo "Done."
exit 0