resource "oci_core_dhcp_options" "mariadbdhcp-options" {
  compartment_id = "${var.compartment_id}"
  vcn_id = "${var.vcn_ocid}"
  display_name = "${var.VCN-DisplayName}-dhcp${var.uniqueid}"
  options {
    type = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }
}
