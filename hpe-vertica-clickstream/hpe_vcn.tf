resource "oci_core_virtual_network" "HPEVcn" {
  cidr_block = "${var.HPEvcnCIDR}"
  dns_label = "${var.VcnDnsLabel}"
  compartment_id = "${var.compartment_id}"
  display_name = "${var.VcnDisplayName}"
}