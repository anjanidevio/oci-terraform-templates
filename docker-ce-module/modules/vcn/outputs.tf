output "vcn_ocid" {
    value = "${oci_core_virtual_network.vcn1.id}"
}

output "dhcp_ocid" {
    value = "${oci_core_virtual_network.vcn1.default_dhcp_options_id}"
}