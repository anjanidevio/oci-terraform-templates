resource "oci_core_route_table" "mariadbRoutetable" {
    compartment_id = "${var.compartment_id}"
    display_name = "${var.VCN-DisplayName}-rt${var.uniqueid}"
    route_rules {
        cidr_block = "0.0.0.0/0"
        network_entity_id = "${var.internet_gateway_ocid}"
    }
    vcn_id = "${var.vcn_ocid}"
}
