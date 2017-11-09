resource "oci_core_dhcp_options" "Elkdhcp-options" {
  compartment_id = "${var.compartment_id}"
  vcn_id = "${var.vcn_ocid}"
  display_name = "${var.DisplayName}-dhcpoptions"
  options {
    type = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }
}