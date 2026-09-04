# Kubernetes deployment

The Kisan Market frontend is packaged as an Nginx container.

Apply the manifests after the image is available to your Kubernetes cluster:

```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl get pods
kubectl get service kisan-market
```

The deployment uses two replicas and HTTP readiness/liveness probes against `/`.

For a remote cluster, replace `kisan-market:local` in `deployment.yaml` with the image name pushed to your container registry.
