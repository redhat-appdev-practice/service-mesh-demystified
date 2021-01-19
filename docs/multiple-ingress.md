# Multiple Ingress

This scenario is based on OSSM 2.x. If you have installed the control plane, please delete it and the namespace before beginning 
this scenario.

This scenario explains how to enable multiple ingress gateways in the control plane, one for SSO traffic and the other for non-SSO traffic.  We will use the bookinfo application deployed to two different namespaces, one assumed to be only for SSO traffic.

This scenario showcases oath2 proxy as a sidecar in the SSO based gateway so that we can redirect to an OIDC-based authentication mechanism, such as [Keycloak](https://www.keycloak.org/).

### Deploy the Service Mesh

```sh scenarios/multiple-gateways/scripts/install-smcp.sh```

### Deploy the bookinfo application to the SSO namespace

```sh scenarios/multiple-gateways/scripts/sso-bookinfo.ssh```

### Create second bookinfo project attached to non-sso namespace

```sh scenarios/multiple-gateways/scripts/bookinfo.sh```

### Test out the sso application

Open the following URL in a browser.

```echo "https://$(oc get route sso-api -n istio-system -o jsonpath={'.spec.host'})/productpage"```

### Test out the non-sso application

Open the following URL in a browser.

```echo "https://$(oc get route nonsso-api -n istio-system -o jsonpath={'.spec.host'})/productpage"```

Visit kiali to see the traffic go to each as you refresh the browser.

### Cleanup Everything

```sh scenarios/upgrade-control-plane/scripts/cleanup.sh```