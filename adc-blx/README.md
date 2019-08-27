# Citrix ADX BLX
These are Terraform modules that deploys [Citrix ADC BLX apppliance](https://docs.citrix.com/en-us/citrix-adc-blx/13/introduction-blx.html) on [Oracle Cloud Infrastructure (OCI)](https://cloud.oracle.com/en_US/cloud-infrastructure).  They are developed jointly by Oracle and Citrix.

* [simple](simple) contains Terraform resources for deploying ADC-BLX on Oracle Cloud Infrastructure via Terraform CLI.
* [orm-generator](orm-generator) contains Terraform resources for packaging and deploying ADC-BLX on Oracle Cloud Infrastructure via OCI Resource Manager service.
* [marketplace](marketplace) contains Terraform resources for packaging and publishing ADC-BLX through the Oracle Cloud Infrastructure Marketplace service.
* [terraform-modules](terraform-modules) contains reusable Terraform modules

This repo is under active development.  Building open source software is a community effort.  We're excited to engage with the community building this.

## Prerequisites
First off you'll need to do some pre deploy setup.  That's all detailed [here](https://github.com/oracle/oci-quickstart-prerequisites).
Customers are expected to download and store the tgz/RPM files in a bucket on OCI object storage, see specific instructions for your selected Deployment Target.

## Clone the Module
Now, you'll want a local copy of this repo by running:

    git clone https://github.com/oracle/oci-quickstart-citrix.git

## Select a Deployment Target

Citrix ADC BLX appliances run as a software application, [supported](https://docs.citrix.com/en-us/citrix-adc-blx/13/supported-linux-platforms-adc-features-blx.html) on different Linux distributions.
You can run Citrix ADC BLX from a local Terraform CLI, OCI Resource Manager service or directly from the Marketplace Service on OCI.

## Customize variables accordingly

Modify your template variables accordingly to your OCI Tenancy.
You can use the boilerplate available on [terraform.tfvars.template](terraform.tfvars.template). After finishing, rename the file to `terraform.tfvars` and Terraform will automatically use it.

You should also modify [variables.tf](./simple/variables.tf) file, updating at least the bucket and object name of the file you uploaded to OCI Object Storage:

```
# ADC BLX stored on Object storage (requires bucket and object names)

variable "adc_blx_bucket_name" {
    default = "my-bucket"
}

variable "adc_blx_object_name" {
    default = "blx-13.0-36.27.tgz"
}


# deployment mode = shared or dedicated
variable "adc_blx_deployment_mode" {
  default = "shared"

  #default = "dedicated"
}
```


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
odule.adc-blx.oci_core_instance.vm: Still creating... (1m40s elapsed)
module.adc-blx.oci_core_instance.vm: Still creating... (1m50s elapsed)
module.adc-blx.oci_core_instance.vm: Creation complete after 1m57s (ID: ocid1.instance.oc1.iad.abuwcljsstaa4m5l...3go42fmsdozvni73syvoi5gqquw3ltya32ihvq)

Apply complete! Resources: 2 added, 0 changed, 2 destroyed.

Outputs:

adc_blx_private_ip = 10.0.1.2
adc_blx_public_ip = AA.BB.CC.DD

```

You can now connect via SSH or HTTPS through the public IP address of ADX-BLX Virtual Machine.
