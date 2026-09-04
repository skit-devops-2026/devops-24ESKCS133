# Kisan Market DevOps Architecture

Kisan Market is currently a static frontend built with HTML, CSS and JavaScript.

```text
Developer
   |
   v
GitHub: skit-devops-2026/devops-24ESKCS133
   |
   v
GitHub Actions
   |-- validate required frontend files
   |-- validate HTML entry point/references
   `-- build Docker image
   |
   v
Docker image
   |
   v
Kubernetes Deployment
   |
   +-- Pod 1: Nginx
   `-- Pod 2: Nginx
   |
   v
Kubernetes Service
   |
   v
Kisan Market web application
```

The application files remain under `frontend/`. The DevOps configuration is kept at the repository root in `.github/`, `scripts/`, `k8s/`, `docs/`, and `monitoring/`.
