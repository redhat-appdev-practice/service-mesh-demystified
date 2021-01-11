# Zero Downtime Upgrade

This scenario is an alternate way to upgrade the control plane and the corresponding applications with zero downtime.  It mirrors the upgrade control plane scenario with the addition of deploying applications in a way that should not negatively affect routing to the application.

This scenario explains how to upgrade the Service Mesh control plane (smcp) when you already have applications deployed using OSSM 1.x.  In this scenario, we will first use the simple ingress gateway with Bookinfo scripts to deploy the control plane and Bookinfo application, make sure it works and then upgrade the control plane and verify things still work.

Note that for this to work correctly in a production scenario there would need to be external load balancing configured to include both the hosts for v1 and v2 of the gateway host routes.  See below under "Test out the new application" for more information on getting the fully routable host within v2 of the mesh.  The corresponding v1 description of the routable host is described in the scenario corresponding to "Deploy the BookInfo Application".

### Deploy the BookInfo Application

Follow the instructions in [Simple Ingress Gateway with Bookinfo](simple-ingress-gateway-with-bookinfo.md) to deploy OSSM 1.x with the Bookinfo application.  Do everything except for the cleanup step.

### Check for potential upgrade errors

```sh scenarios/upgrade-control-plane/scripts/check-for-errors.sh```

If the output is empty, then you are good to proceed.  Otherwise, consult the [Service Mesh Documentation](https://docs.openshift.com/container-platform/4.6/service_mesh/v2x/upgrading-ossm.html) for potential resolutions.

### Fix non-upgradeable components

You can follow the following procedure to fix the non-upgradeable components found.

```oc get smcp.v1.maistra.io <smcp_name> -o yaml > smcp-resource.yaml```

Make the appropriate edits to the resource.

```oc replace -f smcp-resource.yaml```


### Create the new control plane

This will create a backup of your current control plane and a conversion to version 2.x. Then, it will create a new project for the control plane and install the control plane components.

```sh scenarios/upgrade-control-plane/scripts/create-v2-smcp.sh```

Go to the console and wait for all resources to be created.

### Create second bookinfo project attached to new control plane

```sh scenarios/upgrade-control-plane/scripts/v2-bookinfo.sh```

### Test out the new application

Open the following URL in a browser.

```echo "https://$(oc get route api -n istio-system-v2 -o jsonpath={'.spec.host'})/productpage"```

### Tear down the original bookinfo project

```sh scenarios/upgrade-control-plane/scripts/remove-v1-bookinfo.sh```

Test again to be sure using the previous step.

### Clean up the original control plane

```sh scenarios/upgrade-control-plane/scripts/cleanup-v1-smcp.sh```

Continue to test as much as you like.  Visit the Kiali page to watch the traffic graphs.

```echo "https://$(oc get route kiali -n istio-system-v2 -o jsonpath={'.spec.host'})"```

### Cleanup Everything

```sh scenarios/upgrade-control-plane/scripts/cleanup-all.sh```