output "puppetvm_ocid" {
    value = "${oci_core_instance.puppetvm.id}"
}
output "Puppet_master_PublicIP" {
  value = ["${oci_core_instance.puppetvm.public_ip}"]
}
output "Puppet_master_PrivateIP" {
  value = ["${oci_core_instance.puppetvm.private_ip}"]
}
