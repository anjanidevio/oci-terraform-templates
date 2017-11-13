resource "oci_core_route_table" "routetable" {
    compartment_id = "${var.COMP-ID}"
    display_name = "${var.prefix}_rt"
    route_rules {
        cidr_block = "0.0.0.0/0"
        network_entity_id = "${var.internet_gateway}"
    }
    vcn_id = "${var.vcn_ocid}"
}
