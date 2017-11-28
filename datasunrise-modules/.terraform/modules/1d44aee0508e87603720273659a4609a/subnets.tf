resource "oci_core_subnet" "sub1" {
  availability_domain = "${var.ad_name}"
  cidr_block = "10.3.0.0/24"
  display_name = "${var.prefix}-subnet1"
  dns_label = "${var.prefix}subnet1"
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${var.vcn_ocid}"
  route_table_id = "${var.route_table_ocid}"
  dhcp_options_id = "${var.dhcp_ocid}"
  security_list_ids = ["${var.security_list_ocid}"]
}