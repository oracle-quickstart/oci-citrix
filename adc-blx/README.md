# Citrix ADX BLX
These are Terraform modules that deploys [Citrix ADC BLX apppliance](https://docs.citrix.com/en-us/citrix-adc-blx/13/introduction-blx.html) on [Oracle Cloud Infrastructure (OCI)](https://cloud.oracle.com/en_US/cloud-infrastructure).  They are developed jointly by Oracle and Citrix.

* [simple](simple) contains Terraform resources for deploying ADC-BLX on Oracle Cloud Infrastructure via Terraform CLI.
* [orm-generator](orm-generator) contains Terraform resources for packaging and deploying ADC-BLX on Oracle Cloud Infrastructure via OCI Resource Manager service.
* [marketplace](marketplace) contains Terraform resources for packaging and publishing ADC-BLX through the Oracle Cloud Infrastructure Marketplace service.
* [terraform-modules](terraform-modules) contains reusable Terraform modules

This repo is under active development.  Building open source software is a community effort.  We're excited to engage with the community building this.

## Prerequisites
First off you'll need to do some pre deploy setup.  That's all detailed [here](https://github.com/oracle/oci-quickstart-prerequisites).

## Clone the Module
Now, you'll want a local copy of this repo by running:

    git clone https://github.com/oracle/oci-quickstart-citrix.git

## Select a Deployment Target
Citrix ADC BLX appliances run as a software application, [supported](https://docs.citrix.com/en-us/citrix-adc-blx/13/supported-linux-platforms-adc-features-blx.html) on different Linux distributions.
You can run Citrix ADC BLX from a local Terraform CLI, OCI Resource Manager service or directly from the Marketplace Service on OCI.

## Deploy Simple from Terraform CLI
The TF templates here can be deployed by running the following commands:
```
cd oci-quickstart-citrix/adc-blx/simple
terraform init
terraform plan
terraform apply # will prompt to continue
```

The output of `terraform apply` should look like:
```
Apply complete! Resources: 8 added, 0 changed, 0 destroyed.

Outputs:
```
