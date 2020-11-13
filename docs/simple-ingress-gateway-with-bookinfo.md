# Simple Ingress Gateway with Bookinfo

This scenario shows how to install the entire suite of services with the Bookinfo application according to the Istio documentation for OSSM 1.x.  This will also install the Gateway and VirtualService resources necessary to route traffic to the appropriate BookInfo services.

Follow these steps to install and test the Bookinfo app.

# Install the Gateway and Bookinfo App

```sh scenarios/simple-ingress-gateway-with-bookinfo/scripts/install.sh```

# Test the Bookinfo Application

Open the following url in a web browser.

```echo "https://$(oc get route api -n istio-system -o jsonpath={'.spec.host'})/productpage"```

# Cleanup

```sh scenarios/simple-ingress-gateway-with-bookinfo/scripts/cleanup.sh```