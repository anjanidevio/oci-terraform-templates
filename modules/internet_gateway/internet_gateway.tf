resource "oci_core_internet_gateway" "internetgateway" {
    compartment_id = "${var.compartment_ocid}"
    display_name = "${var.prefix}-gw"
    vcn_id = "${var.vcn_ocid}"
}