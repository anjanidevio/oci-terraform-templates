output "image_ocid" {
    value = "${lookup(data.oci_core_images.ImageOCID.images[0], "id")}"
} 