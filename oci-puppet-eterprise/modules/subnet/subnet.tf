resource "oci_core_subnet" "puppetsubnet" {
  compartment_id = "${var.compartment_id}"

  availability_domain = "${var.avial_domain_name}"
  route_table_id      = "${var.route_table_ocid}"
  vcn_id              = "${var.vcn_ocid}"
  security_list_ids   = ["${var.security_list_ocid}"]
  dhcp_options_id     = "${var.dhcp_ocid}"
  dns_label           = "elksubnet${var.uniqueid}"
  display_name        = "${var.VCN-DisplayName}-public${var.uniqueid}"
  cidr_block          = "10.0.0.0/24"
}