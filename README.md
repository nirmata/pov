# Nirmata Proof of Value
Welcome to the Nirmata Proof of Value (POV) repository – your one-stop source for rapidly exploring Nirmata's powerful capabilities!

Nirmata is the creator and core maintainer of [Kyverno](https://kyverno.io/), the popular CNCF Policy-as-Code solution. Nirmata's commercial solutions are designed to optimize the usage and maximize the value enterprises can derive from Kyverno, by saving time and costs, and improving productivity of DevSecOps and platform engineering teams.

This repository is designed to help you explore and evaluate the capabilities of [Nirmata Enterprise For Kyverno (N4K)](https://nirmata.com/nirmata-enterprise-for-kyverno/) through self-service guides and workflows.

## Policy-as-Code
Policy as code ensures consistent, automated enforcement of policies across the software lifecycle, enabling teams to shift left and scale governance. To implement it effectively, evaluate solutions against a [Policy-as-Code checklist](./PaC.md) to ensure they support version control, automation, testing, and integration with your workflows.

## What You'll Find Here
* Guides for Nirmata Products:

Step-by-step instructions to set up and use:

  * [Nirmata Enterprise For Kyverno (N4K)](https://nirmata.com/nirmata-enterprise-for-kyverno/): The enterprise-grade version of CNCF’s Kyverno, with enhanced features for policy management, security, and governance.
  * [Nirmata Control Hub (NCH)](https://nirmata.com/nirmata-control-hub/): A comprehensive cloud governance platform for managing security, compliance, and operational policies across your Kubernetes and cloud environments.

* Workflows for Local or Sandbox Environments:
Easily try out the features in your own environment or in a provided sandbox setup to understand the value of Nirmata's solutions.

* Best Practices:
Learn how to:

  * Migrate seamlessly from open-source Kyverno to Enterprise Kyverno.
  * Implement GitOps workflows with tools like ArgoCD.
  * Shift-left security and governance with nctl in CI/CD pipelines.
  * Manage the policy lifecycle using Nirmata's curated policysets and Chainsaw.
  * Ensure your policies are production-ready by benchmarking performance at scale.

## How to Use This Repository
This repository is structured to help you understand the capabilities of Nirmata's products and address specific use cases. Here’s how you can get started:

1. **Explore the Directories:**
    * Begin by browsing through all the directories to get a sense of what Nirmata's products can help you achieve.
    * Each directory contains workflows, guides, and best practices tailored for Enterprise Kyverno and Nirmata Control Hub.

2. **Jump to Your Use Case:**
    * If you have a specific use case in mind, feel free to dive directly into the relevant section and follow the detailed instructions.

3. **Suggested Flow for New Users:** If you’re new to Kyverno or Policy-as-Code in general, we recommend the following approach:
    * **[Start with Enterprise Kyverno](./enterprise-kyverno/installation/README.md)**
    Install and configure Enterprise Kyverno to secure your Kubernetes environment.
    * **Install Curated Policies**
    Apply default and custom policies, and explore tools like Chainsaw to write and test robust policies.
    * **[Shift Security Left](shift-left/app/README.md)**
    Once Kyverno is operational in your cluster, automate CI pipelines to enforce security and governance early in the development lifecycle. Leverage nctl to integrate policy checks in your pipelines effectively.

Following this flow ensures you gain a comprehensive understanding of Nirmata's capabilities while addressing common security and governance challenges.

## Get in Touch
* Ready to Buy a Subscription?
Contact us at sales@nirmata.com or visit our website.

* Questions or Support?
Reach out to our team at support@nirmata.com.

We hope this repository helps you explore and experience the full value of Nirmata's products. Happy exploring! 🚀
