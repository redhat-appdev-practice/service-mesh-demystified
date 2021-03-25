# Installing Service Mesh and other related resources using Ansible

The Ansible roles simply use the `helm` module from the `kubernetes.core` collection. The module invokes `helm upgrade ...` command under the hood. The charts are located in the `charts` directory. 

## Setting values in the chart

The default values for various parameters in the charts are located in the corresponding `values.yml` files. Since the charts are being applied by the Ansible Roles, it's recommended the overrides are done via the Roles, as opposed to modifying the default values in `values.yml`. There are two ways of achieving this: 

### Method 1

1. Define the value in the `defaults/main.yml` or the `vars/main.yml` file under the role's sub directory. 
2. This parameter can now be used in the role. In order to use the parameter in the helm charts, use the `release_values` parameter in the `helm` module. For example, set the parameter as follows: 

   ```
   values: 
     variable_from_values_yml: "{{ variable_from_ansible_role_or_playbook }}"  
   ``` 
There is an additional benefit to this method. This allows the role to use the variables for other tasks independent of helm. 

### Method 2

1. Define the value in a `yml` file. The location of the file doesn't matter. The file should be structured following the same best practices as `values.yml`
2. Reference the file using the `values_files` parameter of the `helm` module. 

   ```
   values_files: 
   - <file-name>.yml 
   ```

## Sharing values between charts and other Ansible roles 

Sometimes it might be necessary to access a value that's being used in the chart. There are two scenarios:

1. The default value is being overriden using method 1 from above section. In that case the value can be accessed without any further configuration. 

2. The default value is being overriden using method 2. In this case, it'll be necessary save the return values of the helm command. The subsequent Ansible roles can use the values from the saved return values. 

3. The default values are not being overridden. In this case, the values file should be explicitly mentioned using the `values_files` parameter of the `helm` module. Otherwise, the default values will be printed in returned values. The subsequent Ansible roles can use the values from the saved return values. 

4. The scenarios 2 and 3 assume the shared values are only need AFTER the helm chart is applied. However, sometimes it might be necessary to access it earlier. In this case, either utilize method 1 to define the variables, or use the `var_files` parameter in playbook. 

# References: 
1. Kubernetes core module: https://docs.ansible.com/ansible/latest/collections/kubernetes/core/helm_module.html#ansible-collections-kubernetes-core-helm-module
