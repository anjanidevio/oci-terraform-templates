// creating dhcp options
resource "oci_core_dhcp_options" "dhcp-options" {
  compartment_id      = "${var.COMP-ID}"
  vcn_id              = "${var.vcn_ocid}"
  display_name        = "${var.prefix}dhcp"

// required
  options {
    type = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }
}




