resource "oci_core_subnet" "subnet1" {
  compartment_id      = "${var.COMP-ID}"
  cidr_block          = "10.0.0.0/24"
  availability_domain = "${var.avail_domain}"
  route_table_id      = "${var.route_table}"
  vcn_id              = "${var.vcn_ocid}"
  security_list_ids   = ["${var.security_list}"]
  dhcp_options_id     = "${var.dhcp}"
  dns_label           = "${var.prefix}subnet1"
  display_name        = "${var.prefix}_subnet"
 
}
