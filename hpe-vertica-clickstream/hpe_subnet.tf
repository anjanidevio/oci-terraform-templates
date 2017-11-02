 // create subnet
  resource "oci_core_subnet" "HPEsubnet" {
  compartment_id = "${var.compartment_id}"

  availability_domain = "${lookup(data.oci_identity_availability_domains.AvailDomain.availability_domains[0],"name")}"
  route_table_id      = "${oci_core_route_table.HPERoutetable.id}"
  vcn_id              = "${oci_core_virtual_network.HPEVcn.id}"
  security_list_ids   = ["${oci_core_security_list.HPEsecurityRules.id}"]
  dhcp_options_id     = "${oci_core_dhcp_options.HPEdhcp.id}"
  dns_label           = "hpevertica${random_id.uniqueString.hex}"
  display_name        = "${var.VcnDisplayName}publicsubnet${random_id.uniqueString.hex}"
  cidr_block          = "10.0.0.0/24"
}