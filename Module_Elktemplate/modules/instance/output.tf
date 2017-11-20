output "Elkvm_ocid" {
    value = "${oci_core_instance.Elkvm.id}"
}
output "ELk-kibanaPublicIP" {
  value = ["${oci_core_instance.Elkvm.public_ip}"]
}
output "Clientvmpublicip" {
  value = ["${oci_core_instance.Clientvm.public_ip}"]
}
output "ELk-kibanaPrivateIP" {
  value = ["${oci_core_instance.Elkvm.private_ip}"]
}
output "Clientvmprivateip" {
  value = ["${oci_core_instance.Clientvm.private_ip}"]
}
