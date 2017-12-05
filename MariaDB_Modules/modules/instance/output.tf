output "mariadb_ocid" {
    value = "${oci_core_instance.mariadbvm.id}"
}
output "Mariadbvm_PublicIP" {
  value = ["${oci_core_instance.mariadbvm.public_ip}"]
}

output "Mariadbvm_PrivateIP" {
  value = ["${oci_core_instance.mariadbvm.private_ip}"]
}
