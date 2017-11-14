resource "oci_core_virtual_network" "VCN" {
  cidr_block = "10.0.0.0/16"
  dns_label = "${var.prefix}vcn"
  compartment_id = "${var.COMP-ID}"
  display_name = "${var.prefix}-vcn"
}

