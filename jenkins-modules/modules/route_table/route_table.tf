resource "oci_core_route_table" "routetable" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${var.vcn_ocid}"
  display_name   = "${var.prefix}-networkname"
  route_rules {
    cidr_block = "0.0.0.0/0"
    network_entity_id = "${var.internet_gateway_ocid}"
  } 
}