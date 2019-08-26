# VCN comes with default route table, security list and DHCP options

resource "oci_core_vcn" "vcn" {
  cidr_block     = "${var.vcn_cidr_block}"
  dns_label      = "${var.vcn_dns_label}"
  compartment_id = "${var.compartment_ocid}"
  display_name   = "${var.vcn_display_name}"
}

resource "oci_core_internet_gateway" "igw" {
  compartment_id = "${var.compartment_ocid}"
  display_name   = "${var.igw_display_name}"
  vcn_id         = "${oci_core_vcn.vcn.id}"
}

resource "oci_core_route_table" "rt" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_vcn.vcn.id}"
  display_name   = "${var.routetable_display_name}"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = "${oci_core_internet_gateway.igw.id}"
  }
}

// resource "oci_core_default_dhcp_options" "default_dhcp_options" {
//   manage_default_resource_id = "${oci_core_vcn.vcn.default_dhcp_options_id}"
//   display_name               = "defaultDhcpOptions"

//   // required
//   options {
//     type        = "DomainNameServer"
//     server_type = "VcnLocalPlusInternet"
//   }

//   // optional
//   options {
//     type                = "SearchDomain"
//     search_domain_names = ["abc.com"]
//   }
// }

// resource "oci_core_dhcp_options" "default_dhcp_options" {
//   compartment_id = "${var.compartment_ocid}"
//   vcn_id         = "${oci_core_vcn.vcn1.id}"
//   display_name   = "dhcpOptions1"

//   // required
//   options {
//     type        = "DomainNameServer"
//     server_type = "VcnLocalPlusInternet"
//   }

//   // optional
//   options {
//     type                = "SearchDomain"
//     search_domain_names = ["test123.com"]
//   }
// }

resource "oci_core_security_list" "sec_list" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_vcn.vcn.id}"
  display_name   = "${var.security_list_display_name}"

  // allow outbound tcp traffic on all ports
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "6"
  }

  // allow outbound udp traffic on a port range
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "17"        // udp
    stateless   = true

    udp_options {
      min = 319
      max = 320
    }
  }

  // allow inbound ssh traffic
  ingress_security_rules {
    protocol  = "6"         // tcp
    source    = "0.0.0.0/0"
    stateless = false

    tcp_options {
      min = 22
      max = 22
    }
  }

  // allow inbound icmp traffic of a specific type
  ingress_security_rules {
    protocol  = 1
    source    = "0.0.0.0/0"
    stateless = true

    icmp_options {
      type = 3
      code = 4
    }
  }
}

resource "oci_core_subnet" "public_subnet" {
  compartment_id             = "${var.compartment_ocid}"
  vcn_id                     = "${oci_core_vcn.vcn.id}"
  cidr_block                 = "${var.subnet_cidr_block}"
  display_name               = "${var.subnet_display_name}"
  route_table_id             = "${oci_core_route_table.rt.id}"
  security_list_ids          = ["${oci_core_security_list.sec_list.id}"]
  dns_label                  = "${var.subnet_dns_label}"
  prohibit_public_ip_on_vnic = "false"
}
