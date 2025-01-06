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

Display policies:

```sh
kubectl get cpol -A
```

This should show:

```sh
kubectl get cpol -A
NAME                             ADMISSION   BACKGROUND   READY   AGE   MESSAGE
disallow-capabilities            true        true         True    8s    Ready
disallow-capabilities-strict     true        true         True    8s    Ready
disallow-host-namespaces         true        true         True    8s    Ready
disallow-host-path               true        true         True    8s    Ready
disallow-host-ports              true        true         True    8s    Ready
disallow-host-process            true        true         True    8s    Ready
disallow-privilege-escalation    true        true         True    8s    Ready
disallow-privileged-containers   true        true         True    8s    Ready
disallow-proc-mount              true        true         True    8s    Ready
disallow-selinux                 true        true         True    8s    Ready
require-run-as-non-root-user     true        true         True    8s    Ready
require-run-as-nonroot           true        true         True    8s    Ready
restrict-apparmor-profiles       true        true         True    8s    Ready
restrict-seccomp                 true        true         True    8s    Ready
restrict-seccomp-strict          true        true         True    8s    Ready
restrict-sysctls                 true        true         True    8s    Ready
restrict-volume-types            true        true         True    8s    Ready
```

**NOTE**: If the policies do not show `READY: true,` then Kyverno installation may not have completed correctly.

### 4. Create an insecure application on the shared cluster

Try creating an insecure pod:

```sh
kubectl run bad-pod --image=busybox:1.28 --dry-run=server
```

This should be blocked:

```sh
Error from server: admission webhook "validate.kyverno.svc-fail" denied the request:

resource Pod/default/bad-pod was blocked due to the following policies

disallow-capabilities-strict:
  require-drop-all: 'validation failure: Containers must drop `ALL` capabilities.'
disallow-privilege-escalation:
  privilege-escalation: 'validation error: Privilege escalation is disallowed. rule
    privilege-escalation failed at path /spec/containers/0/securityContext/'
require-run-as-nonroot:
  run-as-non-root: 'validation error: Running the container as root is not allowed.
    rule run-as-non-root[0] failed at path /spec/securityContext/runAsNonRoot/ rule
    run-as-non-root[1] failed at path /spec/containers/0/securityContext/'
restrict-seccomp-strict:
  check-seccomp-strict: 'validation error: Use of custom Seccomp profiles is disallowed.
    rule check-seccomp-strict[0] failed at path /spec/securityContext/seccompProfile/
    rule check-seccomp-strict[1] failed at path /spec/containers/0/securityContext/'
```

### 5. Create a secure application on the shared cluster

Try creating a secure pod:

```sh
kubectl apply -f argocd/config/sample-apps/good-pod.yaml --dry-run=server
```

This pod should be allowed as it complies with the `Restricted` profile of the Pod Security Standards.

## What's Next
In this guide we set up Kyverno and enforced the [Kubernetes Pod Security Standards](https://kubernetes.io/docs/concepts/security/pod-security-standards/). Here are some other policies and use cases that you can explore and implement:
* Implement [RBAC Best Practices](https://github.com/nirmata/kyverno-policies/tree/main/rbac-best-practices)
* Implement [Workload Security Best Practices](https://github.com/nirmata/kyverno-policies/tree/main/best-practices)
* Explore [Essential policies to implement in your Kubernetes Cluster](https://nirmata.com/2024/12/03/5-essential-policies-to-implement-in-your-kubernetes-cluster-with-kyverno/)
