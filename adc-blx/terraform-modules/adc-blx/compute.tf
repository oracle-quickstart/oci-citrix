resource "oci_core_instance" "vm" {
  compartment_id      = "${var.compartment_ocid}"
  availability_domain = "${data.oci_identity_availability_domain.ad.name}"
  display_name        = "${var.vm_display_name}"
  shape               = "${var.compute_shape}"

  create_vnic_details {
    subnet_id        = "${var.subnet_id}"
    display_name     = "${format("vnic-%s", var.vm_display_name)}"
    assign_public_ip = "${var.assign_public_ip}"
    hostname_label   = "${var.hostname_label}"
  }

  source_details {
    source_type = "image"
    source_id   = "${var.image_id}"
  }

  //required for metadata setup via cloud-init
  metadata {
    user_data           = "${base64encode(data.template_file.bootstrap.rendered)}"
    ssh_authorized_keys = "${var.ssh_public_key}"
  }

  timeouts {
    create = "60m"
  }
}

data "template_file" "bootstrap" {
  template = "${file("${path.module}/userdata/bootstrap.tpl")}"

  vars {
    adc_blx_object_name = "${var.adc_blx_object_name}"
    install_package_url = "${local.adc_blx_par_url}"
    deployment_mode     = "${var.deployment_mode}"
  }
}

data "oci_identity_availability_domain" "ad" {
  compartment_id = "${var.tenancy_ocid}"
  ad_number      = "${var.availability_domain}"
}
