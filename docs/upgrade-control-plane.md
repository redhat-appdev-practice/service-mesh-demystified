# Upgrade Control Plane to OSSM 2.x

This scenario explains how to upgrade the Service Mesh control plane (smcp) when you already have applications deployed using OSSM 1.x.  In this scenario, we will first use the simple ingress gateway with Bookinfo scripts to deploy the control plane and Bookinfo application, make sure it works and then upgrade the control plane and verify things still work.

### Deploy the BookInfo Application

Follow the instructions in [Simple Ingress Gateway with Bookinfo](simple-ingress-gateway-with-bookinfo.md) to deploy OSSM 1.x with the Bookinfo application.  Do everything except for the cleanup step.

### Check for potential upgrade errors

```sh scenarios/upgrade-control-plane/scripts/check-for-errors.sh```

If the output is empty, then you are good to proceed.  Otherwise, consult the [Service Mesh Documentation](https://docs.openshift.com/container-platform/4.6/service_mesh/v2x/upgrading-ossm.html) for potential resolutions.

### Fix non-upgradeable components

You can follow the following procedure to fix the non-upgradeable components found.

```oc get smcp.v1.maistra.io <smcp_name> > smcp-resource.yaml```

Make the appropriate edits to the resource.

```oc replace -f smcp-resource.yaml```


### Create the new control plane

This will create a backup of your current control plane and a conversion to version 2.x. Then, it will create a new project for the control plane and install the control plane components.

```sh scenarios/upgrade-control-plane/scripts/create-v2-smcp.sh```
