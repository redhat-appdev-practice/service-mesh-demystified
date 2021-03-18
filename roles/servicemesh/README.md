Role Name
=========

A role to install Service Mesh on an OCP cluster.

Requirements
------------

You must install the python3-openshift package for this role to work correctly.
The role executes on localhost, so that package must be installed on localhost.

Role Variables
--------------

At present, the target cluster is identified by and authenticated to with the
K8S_AUTH_HOST and  K8S_AUTH_KUBECONFIG shell variables.

Dependencies
------------

N/A

Example Playbook
----------------

    - hosts: localhost
      roles:
         - servicemesh

License
-------

GPL 2.0 or later

Author Information
------------------

John Berninger
john.berninger@redhat.com
