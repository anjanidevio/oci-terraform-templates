resource "oci_core_internet_gateway" "ELKinternetgateway" {
    compartment_id = "${var.compartment_id}"
    display_name = "${var.VCN-DisplayName}-igw${var.unique_id}"
    vcn_id = "${var.vcn_ocid}"
}
