output "splunk_public_ip" {
    value = "${data.oci_core_vnic.splunk-nic.public_ip_address}"
}
output "splunkclient_public_ip" {
    value = "${data.oci_core_vnic.splunkclient-nic.public_ip_address}"
}

