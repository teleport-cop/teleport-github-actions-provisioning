# Secure provisioning of Teleport targets with Github Actions

This repository is an example of using Teleport Machine ID with Github Actions, to securely provision Teleport targets. It includes the Actions workflow, as well as some example Terraform code for provisining a server to AWS. 

## Why?

Teleport supports many methods for secure auto-joining of distributed services. For example:
- Node auto-join via AWS IAM Role ([docs](https://goteleport.com/docs/management/guides/joining-nodes-aws-iam/))
- Node auto-join via AWS EC2 ([docs](https://goteleport.com/docs/management/guides/joining-nodes-aws-ec2/))
- Node auto-join and discovery for Azure (docs)
- Kubernetes discovery for EKS, GKE and AKS ([docs](https://goteleport.com/docs/kubernetes-access/discovery/))
- RDS Database discovery ([docs](https://goteleport.com/docs/database-access/guides/rds/))


However, not every platform or use-case is covered by the existing auto-join solutions. For example, if you are deploying Teleport services on-prem, there is no existing trust mechanism that Teleport can integrate with for secure auto-join. 

In this case, Teleport supports the generation of short-lived tokens which can be used for the initial service join. An example of how to do this is [here](https://goteleport.com/docs/management/admin/adding-nodes/). 

The challenge with this process is that it has historically been hard to automate in a secure way. How do I give a CICD pipeline the ability to generate short-lived tokens without hard-coding a long-lived credential in the pipeline itself?

## Introducing Machine ID

Machine ID was introduced in Teleport 10 as a way of opening up the Teleport workflow beyond users. It gives you a way of solving connectivity, authentication, authorization and audit for services and applications. 
(A great primer on Machine ID is [here](https://www.youtube.com/watch?v=QWd0eqIa9mA&ab_channel=Teleport).)

As Machine ID has matured, we have added support for various CICD platforms, starting with Github Actions. 

You can see a guide for providing connectivity to an SSH host using Teleport and Github Actions [here](https://goteleport.com/docs/machine-id/guides/github-actions/). 

The great thing about Machine ID is that it can helpe with use cases outside of securely connecting to infrastructure. In fact it can help with administrative actions against Teleport itself, including the ability to generate short-lived tokens! 



