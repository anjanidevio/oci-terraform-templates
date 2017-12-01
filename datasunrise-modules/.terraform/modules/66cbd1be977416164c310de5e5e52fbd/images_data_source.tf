data "oci_core_images" "linImageOCID" {
    compartment_id = "${var.compartment_ocid}"
    operating_system = "${var.instanceLinOS}"
    operating_system_version = "${var.instanceLinOSVersion}"
}