resource "oci_core_route_table" "Routetable" {
    compartment_id = "${var.compartment_id}"
    display_name = "${var.DisplayName}-rt${var.uniqueid}"
    route_rules {
        cidr_block = "0.0.0.0/0"
        network_entity_id = "${var.internet_gateway_ocid}"
    }
    vcn_id = "${var.vcn_ocid}"
}
