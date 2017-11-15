resource "oci_core_virtual_network" "vcn1" {
  cidr_block = "10.7.0.0/16"
  dns_label = "${var.prefix}dnsvcn"
  compartment_id = "${var.compartment_ocid}"
  display_name = "${var.prefix}-vcn"
}