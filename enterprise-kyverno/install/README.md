# Installation Guide

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

## Setup policy checks in CI pipeline