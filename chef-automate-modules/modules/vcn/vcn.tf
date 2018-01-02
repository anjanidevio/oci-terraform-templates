resource "oci_core_virtual_network" "Vcn" {
  cidr_block = "${var.Vcn-CIDR}"
  dns_label = "${var.VCN-DNSLabel}${var.uniqueid}"
  compartment_id = "${var.compartment_id}"
  display_name = "${var.DisplayName}vcn${var.uniqueid}"
}
