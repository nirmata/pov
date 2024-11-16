## Overview
In this example, we will walk through setting up a CI/CD pipeline that scans Dockerfiles and Kubernetes manifests for misconfigurations using Nirmata. We will integrate GitHub Actions to trigger scans when a developer opens a pull request (PR). If issues are found, the pipeline fails until the developer fixes the issues and re-runs the scan. Once the checks pass, the code will be merged into the main branch, and Argo CD will sync the apps to the Kubernetes cluster. The findings from the scans will be published to the Nirmata dashboard for centralized visibility.

## Prerequisites
Before you start, ensure you have the following:

* GitHub repository for storing the code.
* Nirmata account and API key (only if you want to publish results).
* ArgoCD setup for continuous deployment.
* Kubernetes cluster for syncing apps via Argo CD.
* Nirmata CLI and GitHub Actions for scanning.

## Set up Nirmata CLI
If you are on Mac, use the following command.
```bash
brew tap nirmata/nctl
brew install nctl
```

For installation on other platforms, refer to the [official documentation](https://docs.nirmata.io/docs/nctl/installation/).

## Setting Up GitHub Action for Scanning
In this example, we will use the GitHub Action specified [here](./../../.github/workflows/nirmata-scan-guestbook-app.yaml)

* **Trigger:** This workflow runs when a PR is opened or updated against the main branch. It watches for changes in `shift-left/app/` directory.

* **Set up Nirmata CLI**: This step downloads and installs the Nirmata CLI. The `login` step is not required if you are not publishing the results to Nirmata.

* **Run Scan:** `nctl` scans the Dockerfile and Kubernetes manifests, and reports any violations in the PR.

* **Check for Failures:** If the scan results contain failures, the workflow exits with an error (exit 1), causing the PR to fail. If the scan passes, it prints a success message.

## ArgoCD Setup for Syncing Apps
Follow the [Getting Started](https://argo-cd.readthedocs.io/en/stable/getting_started/) guide to setup ArgoCD in your cluster.

## Merging the Code and Syncing with Argo CD
Once all issues are fixed (if any) and the scan passes, the developer can proceed with merging the PR into main.

When the code is merged into the main branch, ArgoCD will automatically sync (if auto-sync is enabled) the Kubernetes manifests from the repository to the cluster, deploying the changes.

## Viewing Results in Nirmata Dashboard
Finally, the scan results, including any misconfigurations found in the Dockerfile and Kubernetes manifests, can be viewed in the Nirmata dashboard:

* Navigate to the Nirmata Control Hub.
* Go to `Policy Reports > Repositories` and select your repository and branch.
The dashboard will show detailed reports on any misconfigurations, allowing you to take action on them.


## Conclusion
With this setup:

* Developers can identify and resolve issues early, reducing the cost and effort required to fix them later.
* The GitHub Actions workflow acts as a gatekeeper, preventing insecure or misconfigured code from being merged.
* ArgoCD seamlessly deploys only validated and approved configurations, ensuring the cluster remains secure and compliant.
* Publishing scan findings to the Nirmata dashboard provides a centralized view for teams to monitor and address misconfigurations, fostering collaboration across Dev, Sec, and Ops teams.
