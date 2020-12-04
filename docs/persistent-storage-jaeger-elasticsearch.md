# Persistent Storage for Jaeger and Elasticsearch

This scenario installs OSSM 2.0 from the beginning with Jaeger and Elasticsearch configured to use persistent storage.  The default storage value in this scenario is set to 50G but that can be easily changed in the values.yaml.

# Start with a clean system

If you already have the control plane installed run the following script to clean it up.

```sh scenarios/persistent-store/scripts/cleanup.sh```

# Install the Service Mesh and Bookinfo project

```sh scenarios/persistent-store/scripts/install.sh```

# Take a look at the Elasticsearch configuration

```oc get pvc -n istio-system```

You should see two persistent volume claims bound with a capacity of 50Gi each.