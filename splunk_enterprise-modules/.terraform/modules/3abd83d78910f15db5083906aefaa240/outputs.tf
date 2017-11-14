output "splunk_instance" {
    value = "${oci_core_instance.splunkvm.id}"
}