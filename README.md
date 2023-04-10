# The spire-toolbox image

The spire-toolbox image is a toolbox image for the SPIRE environment.

## Usage

Add a container to a Pod that is assigned with a SPIRE identity.

Example:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: prober-deployment
spec:
  replicas: 2
  selector:
    matchLabels:
      app: prober
  template:
    metadata:
      labels:
        app: prober
    spec:
      serviceAccountName: prober-sa
      containers:
      - name: envoy
        image: envoyproxy/envoy:v1.25.1
...
      - name: toolbox
        image: troydai/spire-toolbox:v0.1.0
        volumeMounts:
        - name: spiffe-workload-api
          mountPath: /opt/spire/sockets
          readOnly: true
      volumes:
        - name: spiffe-workload-api
          csi:
            driver: "csi.spiffe.io"
            readOnly: true
```

Once started you can execute the `sh` in the toolbox to examine the SPIRE operation with spire-agent on the toolbox.

Example:
```
kubectl exec -it deployment/prober-deployment -- /opt/spire/bin/spire-agent healthcheck -socket /opt/spire/sockets/spire-agent.sock
```