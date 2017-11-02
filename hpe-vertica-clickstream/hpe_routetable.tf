// creating route table
resource "oci_core_route_table" "HPERoutetable" {
    compartment_id = "${var.compartment_id}"
    display_name = "${var.VcnDisplayName}rt${random_id.uniqueString.hex}"
    route_rules {
        cidr_block = "0.0.0.0/0"
        network_entity_id = "${oci_core_internet_gateway.HPEinternetgateway.id}"
    }
    vcn_id = "${oci_core_virtual_network.HPEVcn.id}"
}