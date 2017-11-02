// creating dhcp options
resource "oci_core_dhcp_options" "HPEdhcp" {
  compartment_id = "${var.compartment_id}"
  vcn_id = "${oci_core_virtual_network.HPEVcn.id}"
  display_name = "${var.VcnDisplayName}-dhcp${random_id.uniqueString.hex}"

// required
  options {
    type = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }
}