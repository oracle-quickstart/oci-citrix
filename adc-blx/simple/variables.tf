# Variables required by the OCI Provider
variable "tenancy_ocid" {}

variable "user_ocid" {}
variable "fingerprint" {}
variable "region" {}
variable "private_key_path" {}

variable "ssh_public_key" {}

## Variables required by ADC-BLX application ##

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

variable "compute_shape" {
  default = "VM.Standard2.1"
}

variable "availability_domain" {
  default = 1
}

variable "vm_display_name" {
  default = "adc-blx-vm"
}

variable "assign_public_ip" {
  default = true
}

variable "hostname_label" {
  default = "adcblx"
}

variable "ingress_tcp_ports" {
  default = [9080, 9443]
}

variable "image_id" {
  type = "map"

  default = {
    // See https://docs.us-phoenix-1.oraclecloud.com/images/
    // Oracle-provided image "Oracle-Linux-7.6-2019.08.02-0"
    ap-mumbai-1 = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaajc74fbcjvb6fm55ij6pfi6fgp6t4r4axfwbh3hkb6fjwpvt64xta"

    ap-seoul-1     = "ocid1.image.oc1.ap-seoul-1.aaaaaaaacdrxj4ktv6qilozzc7bkhcrdlzri2gw4imlljpg255stxvkbgpnq"
    ap-tokyo-1     = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaasd7bfo4bykdf3jlb7n5j46oeqxwj2r3ub4ly36db3pmrlmlzzv3a"
    ca-toronto-1   = "ocid1.image.oc1.ca-toronto-1.aaaaaaaa3i4wzxnwlfgizjv4usrz2fh7dhgolp5dmrmmqcm4i7bdhkbdracq"
    eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaax3xjmpwufw6tucuoyuenletg74sdsj5f2gzsvlv4mqbbgeokqzsq"
    eu-zurich-1    = "ocid1.image.oc1.eu-zurich-1.aaaaaaaa5cd4xnyw6udl5u7v7acgpc4a3xpkwirk7xg2oliq53ea2gmrqheq"
    sa-saopaulo-1  = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaacvzqswlkixoj4mmhyvxajburto5ulbicbh4pssfgqf5efmsowqga"
    uk-london-1    = "ocid1.image.oc1.uk-london-1.aaaaaaaaokbcnsqwbrgz2wiif2s452u2a4o674tnjsamja5rhtpml5a7sana"
    us-ashburn-1   = "ocid1.image.oc1.iad.aaaaaaaasorq3smbazoxvyqozz52ch5i5cexjojb7qvcefa5ubij2yjycy2a"
    us-langley-1   = "ocid1.image.oc2.us-langley-1.aaaaaaaad225yfhwxrkt4aprxf6erfhtiubrrq3ythktnuv4vu5lzgqowgsa"
    us-luke-1      = "ocid1.image.oc2.us-luke-1.aaaaaaaat37ujafbrdcdfirlfhwzsozyp4lnvzbv2ubiy2p6ob6q3lekpgjq"
    us-phoenix-1   = "ocid1.image.oc1.phx.aaaaaaaaa3vjdblyvw6rlz3jhjxudf6dpqsazqfynn3ziqrxyfox2wq5bdaq"
  }
}

variable "compartment_ocid" {}

variable "vcn_cidr_block" {
  default = "10.0.0.0/16"
}

variable "vcn_dns_label" {
  default = "vcn"
}

variable "vcn_display_name" {
  default = "vcn"
}

variable "igw_display_name" {
  default = "internet-gateway"
}

variable "routetable_display_name" {
  default = "route-table"
}

variable "subnet_cidr_block" {
  default = "10.0.1.0/24"
}

variable "subnet_display_name" {
  default = "subnet"
}

variable "subnet_dns_label" {
  default = "subnet"
}
