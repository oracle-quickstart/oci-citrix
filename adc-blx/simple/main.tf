provider "oci" {
  tenancy_ocid     = "${var.tenancy_ocid}"
  user_ocid        = "${var.user_ocid}"
  fingerprint      = "${var.fingerprint}"
  private_key_path = "${var.private_key_path}"
  region           = "${var.region}"
  version          = ">= 3.37"
}

## Creates a VCN with a public subnet
module "vcn-plus-subnet" {
  source = "../terraform-modules/vcn-plus-subnet-default"

  compartment_ocid = "${var.compartment_ocid}"
  vcn_display_name = "${var.vcn_display_name}"
  vcn_cidr_block   = "${var.vcn_cidr_block}"
  vcn_dns_label    = "${var.vcn_dns_label}"

  subnet_cidr_block = "${var.subnet_cidr_block}"

  ingress_tcp_ports = "${var.ingress_tcp_ports}"
}

module "adc-blx" {
  source              = "../terraform-modules/adc-blx"
  tenancy_ocid        = "${var.tenancy_ocid}"
  region           = "${var.region}"
  compartment_ocid    = "${var.compartment_ocid}"
  availability_domain = "${var.availability_domain}"

  vm_display_name = "${var.vm_display_name}"
  hostname_label  = "${var.hostname_label}"
  compute_shape   = "${var.compute_shape}"
  image_id        = "${var.image_id[var.region]}"
  ssh_public_key  = "${var.ssh_public_key}"

  subnet_id = "${module.vcn-plus-subnet.subnet_id}"

  adc_blx_bucket_name = "${var.adc_blx_bucket_name}"
  adc_blx_object_name = "${var.adc_blx_object_name}"

  deployment_mode     = "${var.adc_blx_deployment_mode}"
  assign_public_ip    = "${var.assign_public_ip}"
}
