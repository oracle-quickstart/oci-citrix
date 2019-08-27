variable "region" {}
variable "compartment_ocid" {}
variable "tenancy_ocid" {}
variable "availability_domain" {}
variable "vm_display_name" {}
variable "compute_shape" {}
variable "subnet_id" {}
variable "ssh_public_key" {}

variable "assign_public_ip" {
  default = true
}

variable "hostname_label" {}
variable "image_id" {}

// variable "install_package_url" {}
variable "deployment_mode" {}

variable "adc_blx_bucket_name" {}
variable "adc_blx_object_name" {}
