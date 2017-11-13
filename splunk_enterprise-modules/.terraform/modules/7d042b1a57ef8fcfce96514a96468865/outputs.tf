output "dhcp" {
    value = "${oci_core_dhcp_options.dhcp-options.id}"
}