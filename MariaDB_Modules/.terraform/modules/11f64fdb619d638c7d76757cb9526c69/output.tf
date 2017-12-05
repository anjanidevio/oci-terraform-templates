output "dhcp_ocid" {
    value = "${oci_core_dhcp_options.mariadbdhcp-options.id}"
}