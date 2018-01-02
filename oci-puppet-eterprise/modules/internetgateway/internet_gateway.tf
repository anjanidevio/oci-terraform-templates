resource "oci_core_internet_gateway" "internetgateway" {
    compartment_id = "${var.compartment_id}"
    display_name = "${var.VCN-DisplayName}-igw${var.uniqueid}"
    vcn_id = "${var.vcn_ocid}"
}
