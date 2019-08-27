variable "compartment_ocid" {}

variable "vcn_cidr_block" {
  default = ""
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

variable "subnet_cidr_block" {}

variable "subnet_display_name" {
  default = "subnet"
}

variable "subnet_dns_label" {
  default = "subnet"
}

variable "security_list_display_name" {
  default = "sec-list"
}

variable "ingress_tcp_ports" {
  default = []
}
