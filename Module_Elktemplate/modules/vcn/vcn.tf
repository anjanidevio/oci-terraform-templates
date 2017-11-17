resource "oci_core_virtual_network" "ElkVcn" {
  cidr_block = "${var.ElkVcn-CIDR}"
  dns_label = "${var.VCN-DNSLabel}-${var.unique_id}"
  compartment_id = "${var.compartment_id}"
  display_name = "${var.VCN-DisplayName}-vcn${var.unique_id}"
}
