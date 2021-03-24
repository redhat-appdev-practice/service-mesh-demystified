This Helm chart will isntall the bookinfo aplication and gateway according to
the values found in values.yaml.

If you enable secure_route, you must supply an SSL certificate and keyfile in
the form of a TLS secret stored in the cluster. An example method of creating
this secret follows:

1. Create the new key and certificate file using standard OpenSSL tooling:

    $ openssl req -out httpbin.example.com.csr \
        -newkey rsa:2048 \
        -nodes
        -keyout httpbin.example.com.key
        -subj "/CN=httpbin.example.com/O=httpbin organization"

    $ openssl x509 -req -days 365
        -CA example.com.crt
        -CAkey example.com.key
        -set_serial 0
        -in httpbin.example.com.csr
        -out httpbin.example.com.crt

2. Create the OCP secret that stores this key/certificate combination:

    $ oc create -n istio-system secret tls httpbin-credential
        --key=httpbin.example.com.key
        --cert=httpbin.example.com.crt

Notes:

- Any workflow that produces a valid key / certificate combination can be
substituted for step 1 above.

- The name of the secret should *not* being with `istio` or `prometheus`

- The secret should *not* contain a `token` field
