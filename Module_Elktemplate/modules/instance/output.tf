output "Elkvm_ocid" {
    value = "${oci_core_instance.Elkvm.id}"
}
output "ELk-kibanaPublicIP" {
  value = ["${oci_core_instance.Elkvm.public_ip}"]
}
output "Clientvmpublicip" {
  value = ["${oci_core_instance.Clientvm.public_ip}"]
}
