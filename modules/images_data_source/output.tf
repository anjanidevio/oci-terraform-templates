output "image_ocid" {
    value = "${lookup(data.oci_core_images.OLImageOCID.images[1], "id")}"
}