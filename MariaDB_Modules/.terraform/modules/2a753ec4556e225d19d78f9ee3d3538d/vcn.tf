resource "oci_core_virtual_network" "mariadbVcn" {
  cidr_block = "${var.mariadbVcn-CIDR}"
  dns_label = "${var.VCN-DNSLabel}${var.uniqueid}"
  compartment_id = "${var.compartment_id}"
  display_name = "${var.VCN-DisplayName}vcn${var.uniqueid}"
}