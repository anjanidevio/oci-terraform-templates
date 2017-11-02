// creating internetgatewaqy
resource "oci_core_internet_gateway" "HPEinternetgateway" {
    compartment_id = "${var.compartment_id}"
    display_name = "${var.VcnDisplayName}igw${random_id.uniqueString.hex}"
    vcn_id = "${oci_core_virtual_network.HPEVcn.id}"
}