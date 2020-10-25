# Deny All Egress by Default

This scenario utilizes [EgressNetworkPolicy](https://docs.openshift.com/container-platform/4.5/rest_api/network_apis/egressnetworkpolicy-network-openshift-io-v1.html) with a default rule to deny all egress networking.

The example first creates a namespace for the application and installs the initial policy.  After this each application (there are currently two) will add their own ServiceEntry resources in the mesh and modify the EgressNetworkPolicy appropriately.  

Note that updating the set of rules for allowed egress network resources needs to be additive.  Thus, each subsequent call to upgrade the chart needs to contain the previous values.  Take a look in the [values](scenarios/deny-all-egress/values) directory to see how this works.

Since the EgressNetworkPolicy is a namespace-owned resource, it is contained within its own helm chart.  Follow along in the [scripts](scenarios/deny-all-egress/scripts) to see how this works.

Follow these steps to see this example in action:

### 1. Perform initial setup.
   
This will create the Gateway, create the application project, and create the EgressNetworkPolicy.

```sh scenarios/deny-all-egress/scripts/initial-setup.sh```
   
### 2. Inspect the default EgressNetworkPolicy

Take a look at the EgressNetworkPolicy and verify that there is a single Deny rule for any address.

```oc get EgressNetworkPolicy -n bookinfo```

### 3. Deploy the First bookinfo application.

```sh scenarios/deny-all-egress/scripts/deploy-first-app.sh```

### 4. Inspect ServiceEntry and EgressNetworkPolicy

Use the following commands to verify the EgressNetworkPolicy and ServiceEntry objects.

```
oc get EgressNetworkPolicy -n bookinfo

oc get ServiceEntry productpage-svc-entry -n bookinfo -o yaml
```

### 5. Deploy the Second bookinfo application.

```sh scenarios/deny-all-egress/scripts/deploy-second-app.sh```

### 6. Verify the ServiceEntries and EgressNetworkPolicy

```
oc get serviceentry -n bookinfo

oc get egressnetworkpolicy -n bookinfo -o yaml
```