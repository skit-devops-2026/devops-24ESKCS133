# Monitoring

The first monitoring layer for Kisan Market is provided by Kubernetes health probes.

- **Readiness probe:** checks whether the Nginx web server can serve `/`.
- **Liveness probe:** checks whether the container remains responsive.
- **Replicas:** two application pods are configured for basic availability.

Useful commands:

```bash
kubectl get pods
kubectl describe deployment kisan-market
kubectl logs deployment/kisan-market
kubectl get service kisan-market
```

For a production deployment, this directory can be extended with the monitoring stack required by the course, such as Prometheus/Grafana configuration.
