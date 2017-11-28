output "vcn_ocid" {
    value = "${oci_core_virtual_network.vcn.id}"
}

output "dhcp_ocid" {
    value = "${oci_core_virtual_network.vcn.default_dhcp_options_id}"
}