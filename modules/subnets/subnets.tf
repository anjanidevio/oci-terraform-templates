resource "oci_core_subnet" "subnet" {
compartment_id = "${var.compartment_ocid}"
availability_domain = "${var.ad_name}"
route_table_id = "${var.route_table_ocid}"
vcn_id = "${var.vcn_ocid}"
security_list_ids = ["${var.security_list_ocid}"]
dhcp_options_id = "${var.dhcp_ocid}"
dns_label = "${var.prefix}snet"
display_name = "${var.prefix}-snet"
cidr_block = "10.0.0.0/24"
}