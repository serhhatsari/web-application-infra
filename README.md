## Overview
This project demonstrates a robust web application infrastructure on Google Cloud, provisioned with Terraform, configured using Ansible, and featuring a Jenkins-based CI/CD pipeline.

## Key Features  
- **Infrastructure as Code (IaC):** Utilized Terraform for provisioning the network and virtual machines, ensuring a scalable and reproducible infrastructure.

- **Configuration Management:** Employed Ansible to automate machine configurations, making it easy to maintain and update the application environment.

- **Secure Credential Management:** Stored sensitive credentials using Ansible Vault, enhancing security and compliance.

- **CI/CD:** Implemented Jenkins to automate the test, and deployment processes, streamlining development and deployment workflows.

## Jenkins Integration
Assume that php-project is hosted in its own dedicated GitHub repository. I have put it in this repository too to show the Jenkins pipeline. Here's how the integration works:

* **GitHub Webhook:** Whenever a new commit is pushed to this repository, GitHub initiates an automatic webhook request to Jenkins. This ensures that Jenkins remains synchronized with your development progress, allowing for continuous integration and deployment.

## Project Architecture  
Here's an illustration of the project's architecture. It provides a visual representation of how the various components come together to create a reliable and efficient web application infrastructure on Google Cloud.

![Project Architecture](docs/pa.png)
