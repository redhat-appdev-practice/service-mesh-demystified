# Upgrade Control Plane to OSSM 2.x

This scenario explains how to upgrade the Service Mesh control plane (smcp) when you already have applications deployed using OSSM 1.x.  In this scenario, we will first use the simple ingress gateway with Bookinfo scripts to deploy the control plane and Bookinfo application, make sure it works and then upgrade the control plane and verify things still work.

### Deploy the BookInfo Application

Follow the instructions in [Simple Ingress Gateway with Bookinfo](simple-ingress-gateway-with-bookinfo.md) to deploy OSSM 1.x with the Bookinfo application.  Do everything except for the cleanup step.

