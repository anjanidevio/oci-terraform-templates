data "oci_core_images" "OLImageOCID" {
    compartment_id = "${var.compartment_id}"
    operating_system = "${var.InstanceOS}"
    operating_system_version = "${var.InstanceOSVersion}"
}

data "oci_core_images" "winImageOCID" {
    compartment_id = "${var.compartment_id}"
    operating_system = "${var.winInstanceOS}"
    operating_system_version = "${var.winInstanceOSVersion}"
}