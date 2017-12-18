resource "oci_core_virtual_network" "vcn" {
cidr_block = "10.0.0.0/16"
compartment_id = "${var.compartment_ocid}"
dns_label = "${var.prefix}vnet"
display_name = "${var.prefix}-vcn"
}