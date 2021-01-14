# Upgrade Control Plane to OSSM 2.x While Using Nodeport for Ingress

This scenario explains how to upgrade the Service Mesh control plane (smcp) when you already have applications deployed using OSSM 1.x.  In this scenario, we will first use the simple ingress gateway with Bookinfo scripts to deploy the control plane and Bookinfo application, make sure it works and then upgrade the control plane and verify things still work.

Note that this scenario only differs from the original upgrade scenario in that ingress is using NodePort.  We will assume at the outset that the control plane is deployed without any restrictions as to which nodes ingress is allocated.  This creates a challenge in that we will need to first restrict ingress on v1 to a set of nodes and then deploy v2 with restrictions as well so that there is no conflict.  Note that for this to be seamless in a production environment you would most likely want to modify the external load balancer rules as well to avoid sending traffic to the v2 hosts until after the applications have been redeployed.  

### Deploy the Control Plane configured with NodePort

```sh scenarios/nodeport-upgrade/scripts/install-smcp-v1.sh```

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

### Migrate the BookInfo Application to the new Service Mesh

```sh scenarios/upgrade-control-plane/scripts/migrate-bookinfo.sh```

### Test out the application

Open the following URL in a browser.


```echo "https://$(oc get route api -n istio-system-v2 -o jsonpath={'.spec.host'})/productpage"```

### Clean up the original control plane

```sh scenarios/upgrade-control-plane/scripts/cleanup-v1-smcp.sh```

Continue to test as much as you like.  Visit the Kiali page to watch the traffic graphs.

```echo "https://$(oc get route kiali -n istio-system-v2 -o jsonpath={'.spec.host'})"```


### Cleanup

```sh scenarios/upgrade-control-plane/scripts/cleanup-all.sh```