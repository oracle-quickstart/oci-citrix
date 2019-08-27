data "oci_objectstorage_namespace" "ns" {
  compartment_id = "${var.compartment_ocid}"
}

resource "oci_objectstorage_preauthrequest" "adc_blx_par" {
  namespace    = "${data.oci_objectstorage_namespace.ns.namespace}"
  bucket       = "${var.adc_blx_bucket_name}"
  object       = "${var.adc_blx_object_name}"
  name         = "adc-blx.tgz"
  access_type  = "ObjectRead"
  time_expires = "${timeadd(timestamp(), "10m")}"
}

locals {
  adc_blx_par_url = "https://objectstorage.${var.region}.oraclecloud.com${oci_objectstorage_preauthrequest.adc_blx_par.access_uri}"
}
