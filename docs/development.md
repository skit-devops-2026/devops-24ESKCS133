# Development and DevOps commands

## Validate

```bash
chmod +x scripts/validate.sh
make validate
```

## Test

```bash
make test
```

For this static project, the test target performs structural validation of the frontend.

## Build the Docker image

```bash
make docker-build
```

## Run locally with Docker

```bash
make docker-run
```

Then open `http://localhost:8080`.

## Kubernetes

```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```
