# DevOps setup for Kisan Market

This repository contains the Kisan Market static frontend and its DevOps configuration.

## Application

- HTML
- CSS
- JavaScript
- Nginx for containerized serving

## Repository structure

```text
devops-24ESKCS133/
├── .github/
│   └── workflows/
│       └── ci.yml
├── docs/
├── frontend/
├── k8s/
├── monitoring/
├── scripts/
├── Dockerfile
├── Makefile
└── README.md
```

## CI

GitHub Actions runs on pushes and pull requests targeting `main`.

The pipeline:

1. Checks out the repository.
2. Validates required frontend files.
3. Checks the HTML entry point and CSS/JavaScript references.
4. Builds the Docker image.

## Local commands

```bash
make validate
make test
make docker-build
make docker-run
```

The Docker container serves the frontend through Nginx on port 80.

## Kubernetes

The `k8s/` directory contains the Deployment and Service manifests. The Deployment uses two replicas and HTTP health probes.

> Update the image name in `k8s/deployment.yaml` when using a remote container registry.

## Monitoring

The `monitoring/` directory documents the initial Kubernetes health monitoring configuration.
