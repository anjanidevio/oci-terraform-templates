output "image_ocid" {
    value = "${lookup(data.oci_core_images.LinImageOCID.images[0], "id")}"
}