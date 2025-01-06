# Installation Guide
This guide outlines the recommended approach for installing and managing Enterprise Kyverno using GitOps principles. By leveraging GitOps, you can:

* Version Control: Track all Kyverno configurations (including policies, roles, and clusters) within your Git repository, enabling easy audits, rollbacks, and collaboration.
* Automation: Automate deployments and updates, reducing manual effort and minimizing human error.
* Continuous Delivery: Integrate Kyverno deployments into your existing CI/CD pipelines for faster and more reliable releases.
* Collaboration: Facilitate collaboration among teams by providing a single source of truth for all Kyverno configurations.

Jump to ArgoCD approach [here](./argocd/README.md).

Enterprise Kyverno is also available as an independent Helm chart that you can install in your cluster. If you skipped installation via ArgoCD, continue following the below steps.

## Prerequisites
* Kubernetes version compatibility:
  * Enterprise Kyverno supports Kubernetes versions 1.22 and above (see [Kubernetes Compatibility Matrix](https://docs.nirmata.io/docs/n4k/release-compatibility-matrix/))
  * Ensure your cluster meets this requirement before proceeding.
* [Helm](https://helm.sh/) installed on your system (v3 or later).

## Install Enterprise Kyverno
Add the Nirmata Helm repository:
```bash
helm repo add nirmata https://nirmata.github.io/kyverno-charts/
helm repo update nirmata
```

Install Enterprise Kyverno into the kyverno namespace:
```bash
helm install kyverno nirmata/kyverno -n kyverno --create-namespace
```
This will install the latest stable release of Enterprise Kyverno.

Verify the installation:
```bash
kubectl get pods -n kyverno
```

## Install Policies
```bash
kustomize build https://github.com/nirmata/kyverno-policies/pod-security/enforce | kubectl apply -f -
```
