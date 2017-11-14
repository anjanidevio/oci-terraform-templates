output "instance_ocid" {
    value = "${oci_core_instance.splunkvm.id}"
}
output "client_instance_ocid" {
    value = "${oci_core_instance.clientinstance.id}"
}