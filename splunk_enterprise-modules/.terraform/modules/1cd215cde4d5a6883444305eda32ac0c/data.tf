data "oci_core_images" "ImageOCID" {
    compartment_ocid = "${var.COMP-ID}"
    operating_system ="${var.InstanceOS}"
    operating_system_version =  "${var.InstanceOSVersion}"
}