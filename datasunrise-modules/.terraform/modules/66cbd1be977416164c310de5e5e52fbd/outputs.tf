output "image_ocid" {
    value = "${lookup(data.oci_core_images.linImageOCID.images[0], "id")}"
}