output "vcn_ocid" {
    value = "${oci_core_virtual_network.VCN.id}"
}

output "dhcp" {
    value = "${oci_core_dhcp_options.dhcp-options.id}"
}