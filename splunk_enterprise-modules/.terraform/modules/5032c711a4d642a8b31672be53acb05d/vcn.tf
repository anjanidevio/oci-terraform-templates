resource "oci_core_virtual_network" "VCN" {
  cidr_block = "${var.VCN-CIDR}"
  dns_label = "${var.prefix}vcn"
  compartment_id = "${var.COMP-ID}"
  display_name = "${var.prefix}-vcn"
}

