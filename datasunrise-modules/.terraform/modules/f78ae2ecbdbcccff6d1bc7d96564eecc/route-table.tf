resource "oci_core_route_table" "rt" {
    compartment_id = "${var.compartment_ocid}"
    vcn_id = "${var.vcn_ocid}"
    display_name = "${var.prefix}-rt"
    route_rules {
        cidr_block = "0.0.0.0/0"
        network_entity_id = "${var.internet_gateway_ocid}"
    }
}