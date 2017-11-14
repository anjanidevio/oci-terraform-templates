resource "oci_core_internet_gateway" "internetgateway" {
    compartment_id = "${var.COMP-ID}"
    display_name = "${var.prefix}-igw"
     vcn_id = "${var.vcn_ocid}"
}
