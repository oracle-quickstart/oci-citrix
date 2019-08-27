output "adc_blx_public_ip" {
  value = "${oci_core_instance.vm.public_ip}"
}

output "adc_blx_private_ip" {
  value = "${oci_core_instance.vm.private_ip}"
}
